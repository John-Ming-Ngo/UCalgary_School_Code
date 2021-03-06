/// reads in a positive integers in range (2 .. 2^63-1) from standard input
/// for each number on input:
///   if the number is prime, it is ignored
///   determines the smallest factor of the composite number
/// prints out the sum of all smallest factors
///
/// if no composite numbers are found, prints out "0"
///
/// compile with:
///   $ g++ 4sumFactorsThreadPool.cpp -O3 -o gcd -lm -lpthread

/**

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

Workflow:

1. Thread is in eternal  loop.
	2. Loop contents:
		3. Block for 1 thread
			4. One thread: Mutex wait condition variable on new input set.
			5. Do simple checks, set variable data with more mutexes.
		6. Branch to many threads:
			1. Mutex: Claim section to work on.
			2. Work on that section.
			3. Periodically check to see if the return value variable is not -1.
			4. If it isn't, check to see if it's lower than i. If it is, terminate.
			
			1. If result found:
				1. Mutex [NOT DONE?]
		Wait for all 
	Repeat.
	
Need a section to kill the process with a kill flag somewhere, for when all the numbers are done.
*/

/**
Problem: Thread can declare ending before other thread has finished, outputting wrong answer. Must wait until BOTH threads finish. Use barriers or counters?  ==> Might be fixed! Try and break it.

Problem: Still gets murdered by endless small numbers (endless 49s), esp. on multiple threads. Why? Probably the mutex on the vector. Maybe need to upgrade to barrier form... Need to get rid of mutexes somehow, transfer data in a more effective manner.

Problem: The algorithm is fundimentally inefficient; compared to the single-threaded solution, it just takes much more time to do the same task...
*/

//Implementation 4: Parallelize smallest divisor, thread reuse, mutexes on the task pool.
struct DivData {
	int64_t start;
	int64_t end;
	int64_t n;
};

pthread_t* threads;

pthread_mutex_t taskQueueMutex;
pthread_cond_t waitTasks;
std::vector<DivData> taskQueue;

pthread_mutex_t endThreadsMutex;
std::atomic<bool> endThreads;

pthread_mutex_t tasksCompleteMutex;
std::atomic<bool> tasksComplete;

std::atomic<bool> threadsCreated (false);

std::atomic<int> countFinished (0);
std::atomic<int> numThreads;

pthread_mutex_t retDataMutex;
int64_t getSmallestDivisorRetData;

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
			next = start-1; //Anyhting mod 1 = 0;
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
  
  distribute(i, max, 6, n, nThreads); //Distribute the work across the threads. The increment is 6, from the core...
  
  //std::cout << "Single-Threaded component done.\n";
  
  if (!threadsCreated) {
	  pthread_t newThreads[nThreads];
	  threads = newThreads;
	  for (long count = 0; count < nThreads; count++) {
		  pthread_create(&threads[count], NULL, getSmallestDivisorThreadCore, (void *) count);
	  }
	  numThreads = nThreads;
	  threadsCreated = true;
  }
		
  //Todo: Consider a spinlock to ensure all threads make it to the waiting point... ==> It never goes through for some reason help! :///
  /**
  while (!tasksComplete) {
	  //std::cout << tasksComplete << "\n"; //Need this line to keep the while loop updating; not good.
  } //Wait until tasks are done.
  */
  
  pthread_cond_broadcast(&waitTasks); //All threads which were waiting on a task to do, do them now!
  
  while (!tasksComplete) {
	  //std::cout << tasksComplete << "\n"; //Need this line to keep the while loop updating; not good.
  } //Wait until tasks are done.
  
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
  /**
  for (long count = 0; count < nThreads; count++) {
	  pthread_join(threads[count], NULL);
  }
  */
  
  /// report results
  std::cout << "Sum of divisors = " << sum << "\n";

  pthread_mutex_destroy(&retDataMutex); //No longer need this mutex.
  pthread_mutex_destroy(&taskQueueMutex);
  pthread_mutex_destroy(&endThreadsMutex);
  pthread_mutex_destroy(&tasksCompleteMutex);
  pthread_cond_destroy(&waitTasks);

  return 0;
}

