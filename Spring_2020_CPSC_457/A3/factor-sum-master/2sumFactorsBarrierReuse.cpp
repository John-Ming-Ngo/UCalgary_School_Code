/// reads in a positive integers in range (2 .. 2^63-1) from standard input
/// for each number on input:
///   if the number is prime, it is ignored
///   determines the smallest factor of the composite number
/// prints out the sum of all smallest factors
///
/// if no composite numbers are found, prints out "0"
///
/// compile with:
///   $ g++ 1sumFactorsNoThreadReuse.cpp -O3 -o gcd -lm -lpthread

/**

*/

#include <cstdio>
#include <cstdlib>
#include <cstdint>
#include <cinttypes>
#include <cmath>
#include <iostream>
#include <pthread.h>
#include <atomic>

/**
Todo:
	Thread Reuse via barriers needed.

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

//Implementation 1: Parallelize smallest divisor, no thread reusing. Weakness: High thread count + many tiny numbers results in inefficiency.
struct DivData {
	int64_t start;
	int64_t end;
	int64_t n;
};

pthread_barrier_t threadSync;
pthread_mutex_t threadWaiting;
pthread_cond_t runThreads;
std::atomic<bool> threadRun (false);
std::atomic<bool> needNewNum (false);

std::atomic<bool> threadTerminate (false);

pthread_mutex_t retDataMutex;
int64_t getSmallestDivisorRetData;

std::atomic<bool> threadsCreated (false); //Initialize this to false.
pthread_t * threads; //Make the threads.
DivData * threadData; //We need as many parameters as threads to pass in.
int64_t numCreated;

//Todo: This literally doesn't work anymore; the results have no bearing to reality.
void distribute(int64_t low, int64_t high, int64_t increment, int64_t n, int64_t numThreads) {
	
	int64_t numIncrements = (high - low) / increment;
	
	int64_t incrementsPerThread = numIncrements/numThreads;
	int64_t remainderIncrements = numIncrements%numThreads;
	
	int64_t start = low;
	int64_t next;
	
	for (int64_t i = 0; i < numThreads; i++) {
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
		
		std::cout << "In Distribute - n: " << n << "\n";
		std::cout << "In Distribute - start: " << start << "\n";
		std::cout << "In Distribute - end: " << next << "\n";
		
		threadData[i].start = start;
		threadData[i].end = next;
		threadData[i].n = n;
		
		std::cout << "In Distribute t - n: " << threadData[i].n << "\n";
		std::cout << "In Distribute t - start: " << threadData[i].start << "\n";
		std::cout << "In Distribute t - end: " << threadData[i].end << "\n";
		
		start = next;
	}
}
// While !threadrun got optimized away by O3, need atomics?
void* getSmallestDivisorThreadCore(void* data) {
  std::cout << "Threadrun value pre loop: " << threadRun <<"\n";
  while (true) {
	  //Sync the threads and wait for new data.
	  int res = pthread_barrier_wait( & threadSync);
	  if (res == PTHREAD_BARRIER_SERIAL_THREAD) {
		  std::cout << "Got into single-threaded part post-barrier.\n";
		  std::cout << "Threadrun value: " << threadRun <<"\n";
		  pthread_mutex_lock(&threadWaiting);
		  while (!threadRun) {
			  needNewNum = true; //Toggle this off once the new num is fed in, in the main function.
			  std::cout << "Waiting for thread to be run.\n";
			  pthread_cond_wait(&runThreads, &threadWaiting);
		  }
		  pthread_mutex_unlock(&threadWaiting);
	  }
	  pthread_barrier_wait( & threadSync);	  
	  
	  //Terminate the thread.
	  std::cout << "Thread Terminate value divisor call: " << threadTerminate <<"\n";
	  if (threadTerminate) {
		  break;
	  }
	  
	  DivData* threadData = (DivData*) data;
	  int64_t i = threadData -> start;
	  int64_t max = threadData -> end;
	  int64_t n = threadData -> n;
	  
	  std::cout << "i: " <<  i << " | max: " << max << " | n: " << n << "\n";
	  
	  while( i <= max) {
		if (n % i == 0) {
			pthread_mutex_lock(&retDataMutex);
			if ( (getSmallestDivisorRetData != -1) && (i > getSmallestDivisorRetData) ) { //Someone found a factor smaller; we're done.
				break;
			}
			//Else ours is the smallest factor.
			getSmallestDivisorRetData = i;
			break; //Return, we found the smallest for this function.
		}
		if (n % (i+2) == 0) {
			pthread_mutex_lock(&retDataMutex);
			if ( (getSmallestDivisorRetData != -1) && ( (i+2) > getSmallestDivisorRetData) ) { //Someone found a factor smaller; we're done.
				break;
			}
			//Else this is the smallest factor.
			getSmallestDivisorRetData = (i+2);
			break; //Return, we found the smallest for this function.
		}
		i += 6; //Increment. TODO: Oh this can be a problem also. WTF?
		if ( (getSmallestDivisorRetData != -1) && (i > getSmallestDivisorRetData) ) { //Someone found a factor smaller; we're done.
			break;
		}
	  }
	  pthread_mutex_unlock(&retDataMutex);
	  
	  //Turn off the thread, await next thing to do.
	  res = pthread_barrier_wait( & threadSync);
	  if (res == PTHREAD_BARRIER_SERIAL_THREAD) {
		  pthread_mutex_lock(&threadWaiting);
		  threadRun = false;
		  pthread_mutex_unlock(&threadWaiting);
	  }
	  res = pthread_barrier_wait( & threadSync);
  }
  return data;
}

void endThreads() {
	//Destroy old threads. Requires that they be waiting on the next run.
	//std::cout << "Terminate Threads Called: \n";
	
	threadTerminate = true;
	pthread_mutex_lock(&threadWaiting);
	threadRun = true;
	pthread_cond_signal(&runThreads);
	pthread_mutex_unlock(&threadWaiting);
	
	for (long i = 0; i < numCreated; i++){// Wait for all of them to die.
		pthread_join(threads[i], NULL);
	}
	threadRun = false; //Don't run threads anymore. This was a horrible bug.
	threadTerminate = false; //Don't terminate other threads.
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
  
  pthread_mutex_lock(&threadWaiting);
  threadRun = false;
  pthread_mutex_unlock(&threadWaiting);
  
  needNewNum = false;
  
  if ((!threadsCreated)||(numCreated != nThreads)) {
	 //Kill old threads, if any. Truth be told, this path shouldn't ever happen or be relevant.
	 endThreads();
	 
	 //New Threads
	 //std::cout << "Trying to create new threads \n";
	 
	 pthread_t newThreads[nThreads]; //Make the threads.
	 DivData newThreadData[nThreads]; //We need as many parameters as threads to pass in.
	 threads = newThreads;
	 threadData = newThreadData;
	 numCreated = nThreads;
	 //Start the threads.
	 for (long i = 0; i < nThreads; i++){// Actively instantiate the threads.
		pthread_create(&threads[i], NULL, getSmallestDivisorThreadCore, &threadData[i]);
	}
	//std::cout << "Threads created, they shouldn't be running yet. \n";
  } 
  
  //Spinlock, waiting on the threads to sync themselves and demand a new number.
  while (!needNewNum) {
  };
  
  std::cout << "Pre-Distribute\n";
  DivData dataPacket = threadData[0];
  std::cout << "Out of Distribute - n: " << dataPacket.n << "\n";
  std::cout << "Out of Distribute - start: " << dataPacket.start << "\n";
  std::cout << "Out of Distribute - end: " << dataPacket.end << "\n";
  
  std::cout << "------------------------------------\n";
  
  //Distribute the parameters to all the threads.
  distribute(i, max, 6, n, numCreated); //Distribute the work across the threads. The increment is 6, from the core...
  
  dataPacket = threadData[0];
  std::cout << "Out of Distribute - n: " << dataPacket.n << "\n";
  std::cout << "Out of Distribute - start: " << dataPacket.start << "\n";
  std::cout << "Out of Distribute - end: " << dataPacket.end << "\n";
  
  dataPacket = threadData[(nThreads-1)];
  std::cout << "Out of Distribute - n: " << dataPacket.n << "\n";
  std::cout << "Out of Distribute - start: " << dataPacket.start << "\n";
  std::cout << "Out of Distribute - end: " << dataPacket.end << "\n";
  
  needNewNum = false;
  
  //Run the threads
  pthread_mutex_lock(&threadWaiting);
  threadRun = true;
  pthread_cond_signal(&runThreads);
  pthread_mutex_unlock(&threadWaiting);
  
  std::cout << "Waiting for threads to finish \n";
  while (threadRun) { //Spinlock waiting on threads to complete. TODO: Replace with something better?
	  
  }
  
  while (true) {
	  //std::cout << "Sanity checking the distribution of data packets \n";
  }
  
  std::cout << "Threads Finished \n";
  //std::cout << "Single-Threaded component done.\n";
  
  //DivData dataPacket = threadData[0];
  //std::cout << "Out of Distribute - n: " << dataPacket.n << "\n";
  //std::cout << "Out of Distribute - start: " << dataPacket.start << "\n";
  //std::cout << "Out of Distribute - end: " << dataPacket.end << "\n";
  
  //No smallest factor found ==> It's prime.
  if (getSmallestDivisorRetData == -1) {
	  getSmallestDivisorRetData = 0;
  }

  return getSmallestDivisorRetData; //Return what the threads found.
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

  //Thread globals:
  pthread_mutex_init(&retDataMutex, NULL);
  pthread_mutex_init(&threadWaiting, NULL);
  pthread_cond_init(&runThreads, NULL);
  pthread_barrier_init (&threadSync, NULL, nThreads);

  /// sum up the divisors
  int64_t sum = 0;
  while( 1) {
    int64_t num;
    if( ! (std::cin >> num) ) break;
    int64_t divVal = getSmallestDivisorThreaded(num, nThreads);
    // the line below may help you with debugging
    std::cout << "Debug: " << num << " --> " << divVal << "\n";
    sum += divVal;
  }
  endThreads();
  
  //End Thread Globals
  pthread_mutex_destroy(&retDataMutex); //No longer need this mutex.
  pthread_barrier_destroy(&threadSync); //No longer need this barrier.
  pthread_cond_destroy(&runThreads);
  /// report results
  std::cout << "Sum of divisors = " << sum << "\n";

  return 0;
}

