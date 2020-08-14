/// reads in a positive integers in range (2 .. 2^63-1) from standard input
/// for each number on input:
///   if the number is prime, it is ignored
///   determines the smallest factor of the composite number
/// prints out the sum of all smallest factors
///
/// if no composite numbers are found, prints out "0"
///
/// compile with:
///   $ g++ sumFactors.cpp -O3 -o gcd -lm -lpthread

/**
Threaded version by: John Ming Ngo, 30020834

THANK THE HEAVENS THAT I CAN ASSUME ONLY 10k NUMBERS IN THE INPUT! THANK GODS! THANK EVERYTHING! THAT SOLVES EVERYTHING! I MEAN EVERYTHING!
*/

#include <cstdio>
#include <cstdlib>
#include <cstdint>
#include <cinttypes>
#include <cmath>
#include <iostream>
#include <pthread.h>
#include <vector>
#include <atomic>

/**
List of required optimizations:

N times speedup on N threads on all inputs except for tiny inputs; so long as input has big numbers we should see this (ex. 11 digits)...

==> Optimization techniques: Don't care but:

1. Optimize inner loop
2. Reuse threads (barriers)
3. Cancellation

Mutexes, barriers, conditional variables. Maybe semiphores.

==> Ended up using mutexes, conditional variables, and atomics.
*/

/**
Notes: I don't understand why, but sometimes it takes 1.5x longer than it should on the Unix servers; screwing my results over. I think this may be due to workload on the unix servers. In general, I'm getting a 1/N + 2 seconds speedup on most cases; but it varies violently, especially as N gets large. I think this is due to mutex calls being SYSTEM CALLS (according to strace -c) (futex), which are inherently sensitive to who else is on the system demanding system calls.
*/

//Implementation 4: Parallelize smallest divisor, thread reuse, mutexes on the task pool.
struct DivData {
	int64_t start;
	int64_t end;
	int64_t n;
};
//Globals.
pthread_t* threads;

//Task queue method.
pthread_mutex_t taskQueueMutex;
pthread_cond_t waitTasks;
std::vector<DivData> taskQueue;

//Indicates to kill the thread.
pthread_mutex_t endThreadsMutex;
std::atomic<bool> endThreads;

//Indicates that the thread's task is done and it is waiting.
pthread_mutex_t tasksCompleteMutex;
std::atomic<bool> tasksComplete;

std::atomic<bool> threadsCreated (false);

//Indicates how many threads are done and how many threads there are. 
std::atomic<int> countFinished (0); //Number of finished threads.
std::atomic<int> numThreads;

//Return data.
pthread_mutex_t retDataMutex;
int64_t getSmallestDivisorRetData;

//Distributes the tasks into bite-sized increments into task queue.
void distribute(int64_t low, int64_t high, int64_t increment, int64_t n, int64_t numThreads) {
	
	int64_t numIncrements = (high - low) / increment;
	
	int64_t incrementsPerThread = numIncrements/numThreads;
	int64_t remainderIncrements = numIncrements%numThreads;
	
	int64_t start = low;
	int64_t next;
	
	for (int64_t i = 0; i < numThreads; i++) {
		DivData dataPacket;
		
		if (sqrt(n) > increment) {
			next = start + (incrementsPerThread * increment);
			if (remainderIncrements > 0) {
				next = next + increment;
				remainderIncrements--;
			}
		}
		else {
			next = start-1; //Anyhting mod 1 = 0; I mean, I don't want it to run.
		}
		
		dataPacket.start = start;
		dataPacket.end = next;
		dataPacket.n = n;
		
		//std::cout << "In Distribute - n: " << dataPacket.n << "\n";
		//std::cout << "In Distribute - start: " << dataPacket.start << "\n";
		//std::cout << "In Distribute - end: " << dataPacket.end << "\n";
		
		pthread_mutex_lock(&taskQueueMutex);
		taskQueue.push_back(dataPacket);
		pthread_mutex_unlock(&taskQueueMutex);
		
		start = next;
	}
	pthread_mutex_lock(&tasksCompleteMutex);
	tasksComplete = false;
	pthread_mutex_unlock(&tasksCompleteMutex);
}

//Main 'core' threads doing the processing.
void* getSmallestDivisorThreadCore(void* id) {
  
  while (true) {
	  
	  if (endThreads) {
		  break;
	  }
	  
	  pthread_mutex_lock(&taskQueueMutex);
	  if (taskQueue.size() < 1) {
		//std::cout << "Waiting on new task." << "\n";
		//std::cout << "Task Queue Size: " << taskQueue.size() << "\n";
		
		countFinished++;
		
		if (countFinished == numThreads) {
			pthread_mutex_lock(&tasksCompleteMutex);
			tasksComplete = true;
			pthread_mutex_unlock(&tasksCompleteMutex);
		}
		
		pthread_cond_wait(&waitTasks, &taskQueueMutex);
		pthread_mutex_unlock(&taskQueueMutex);
		
		countFinished--;
		
		continue;
	  }
	  
	  DivData threadData = taskQueue.back();
	  taskQueue.pop_back();
	  pthread_mutex_unlock(&taskQueueMutex);
	  
	  int64_t i = threadData.start;
	  int64_t max = threadData.end;
	  int64_t n = threadData.n;
	  
	  //std::cout << "i: " <<  i << " | max: " << max << " | n: " << n << "\n";
	  
	  while( i <= max) {
		if (n % i == 0) {
			pthread_mutex_lock(&retDataMutex);
			if ( (getSmallestDivisorRetData != -1) && (i > getSmallestDivisorRetData) ) { //Someone found a factor smaller; we're done.
				pthread_mutex_unlock(&retDataMutex);
				break;
			}
			//Else ours is the smallest factor.
			getSmallestDivisorRetData = i;
			pthread_mutex_unlock(&retDataMutex);
			break; //Return, we found the smallest for this function.
		}
		if (n % (i+2) == 0) {
			pthread_mutex_lock(&retDataMutex);
			if ( (getSmallestDivisorRetData != -1) && ( (i+2) > getSmallestDivisorRetData) ) { //Someone found a factor smaller; we're done.
				pthread_mutex_unlock(&retDataMutex);
				break;
			}
			//Else this is the smallest factor.
			getSmallestDivisorRetData = (i+2);
			pthread_mutex_unlock(&retDataMutex);
			break; //Return, we found the smallest for this function.
		}
		i += 6;
		if ( (getSmallestDivisorRetData != -1) && (i > getSmallestDivisorRetData) ) { //Someone found a factor smaller; we're done.
			break;
		}
	  }
  }  
  return id;
}
//Main function to be called once the thread stuff is set up.
int64_t getSmallestDivisorThreaded(int64_t n, int64_t nThreads)
{
  getSmallestDivisorRetData = -1;

  if( n <= 3) {
	  return 0;
  }// 2 and 3 are primes
  if( n % 2 == 0) {
	  return 2; 
  }// handle multiples of 2
  if( n % 3 == 0) {
	  return 3; 
  }// handle multiples of 3
  
  int64_t i = 5;
  int64_t max = sqrt(n);
  
  //std::cout << "Single-Threaded component done.\n";
  
  //Create the threads.
  if (!threadsCreated) {
	  pthread_t newThreads[nThreads];
	  threads = newThreads;
	  for (long count = 0; count < nThreads; count++) {
		  pthread_create(&threads[count], NULL, getSmallestDivisorThreadCore, (void *) count);
	  }
	  numThreads = nThreads;
	  threadsCreated = true;
  }
		
  //Ensure all threads make it to the waiting point... 
  while (!tasksComplete) {} //Wait until tasks are done. 
  
  distribute(i, max, 6, n, nThreads); //Distribute the work across the threads. The increment is 6, from the core... It also indicates the tasks are not yet done.
  
  pthread_cond_broadcast(&waitTasks); //All threads which were waiting on a task to do, do them now!
  
  while (!tasksComplete) {} //Wait until tasks are done.
  
  //std::cout << "Tasks completed." << "\n";
  
  //No smallest factor found ==> It's prime.
  if (getSmallestDivisorRetData == -1) {
	  getSmallestDivisorRetData = 0;
  }
  
  return getSmallestDivisorRetData;
}



/// calculates smallest divisor of n that is less than n
///
/// returns 0 if n is prime or n < 2
///
/// examples:
///    n =  1         --> result = 0
///    n =  2         --> result = 0
///    n =  9         --> result = 3
///    n = 35         --> result = 5
///    n = 8589934591 --> result = 7
int64_t getSmallestDivisor(int64_t n)
{
  if( n <= 3) return 0; // 2 and 3 are primes
  if( n % 2 == 0) return 2; // handle multiples of 2
  if( n % 3 == 0) return 3; // handle multiples of 3
  int64_t i = 5;
  int64_t max = sqrt(n);
  while( i <= max) {
    if (n % i == 0) return i;
    if (n % (i+2) == 0) return i + 2;
    i += 6;
  }
  return 0;
}

int main( int argc, char ** argv)
{
  /// parse command line arguments
  int nThreads = 1;
  if( argc != 1 && argc != 2) {
    std::cout << "Usage: " << argv[0] << " [nThreads]\n";
    exit(-1);
  }
  if( argc == 2) nThreads = atoi( argv[1]);

  /// handle invalid arguments
  if( nThreads < 1 || nThreads > 256) {
    std::cerr << "Error: Bad arguments. 1 <= nThreads <= 256!\n";
	exit(-1);
  }

  std::cout << "Using " << nThreads
            << " thread" << (nThreads == 1 ? "" : "s")
            << ".\n";

  pthread_mutex_init(&retDataMutex, NULL);
  pthread_mutex_init(&taskQueueMutex, NULL);
  pthread_mutex_init(&endThreadsMutex, NULL);
  pthread_mutex_init(&tasksCompleteMutex, NULL);
  pthread_cond_init(&waitTasks, NULL);
  
  /// sum up the divisors
  int64_t sum = 0;
  while( 1) {
    int64_t num;
    if( ! (std::cin >> num) ) break;
    int64_t divVal = getSmallestDivisorThreaded(num, nThreads);
    // the line below may help you with debugging
    //std::cout << "Debug: " << num << " --> " << divVal << "\n";
    sum += divVal;
  }

  //End threads.
  pthread_mutex_lock(&endThreadsMutex);
  endThreads = true;
  pthread_mutex_unlock(&endThreadsMutex);
  pthread_cond_broadcast(&waitTasks);
  
  /// report results
  std::cout << "Sum of divisors = " << sum << "\n";

  pthread_mutex_destroy(&retDataMutex); //No longer need this mutex.
  pthread_mutex_destroy(&taskQueueMutex);
  pthread_mutex_destroy(&endThreadsMutex);
  pthread_mutex_destroy(&tasksCompleteMutex);
  pthread_cond_destroy(&waitTasks);

  return 0;
}

