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
1347054890
1347054890
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

*/

//Implementation 1: Parallelize smallest divisor, no thread reusing. Weakness: High thread count + many tiny numbers results in inefficiency.
struct DivData {
	int64_t start;
	int64_t end;
	int64_t n;
};

//Globals
std::atomic<bool> threadsInitiated (false);
pthread_t * threads;
int64_t numThreads;

pthread_mutex_t inputDataMutex;
int64_t getSmallestDivisorInputData;

pthread_mutex_t retDataMutex;
int64_t getSmallestDivisorRetData;

void distribute(int64_t low, int64_t high, int64_t increment, DivData threadData[], int64_t n, int64_t numThreads) {
	
	int64_t numIncrements = (high - low) / increment;
	
	int64_t incrementsPerThread = numIncrements/numThreads;
	int64_t remainderIncrements = numIncrements%numThreads;
	
	int64_t start = low;
	int64_t next;
	
	for (int64_t i = 0; i < numThreads; i++) {
		DivData dataPacket = threadData[i];
		
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
		
		threadData[i] = dataPacket;
		start = next;
	}
}

void* getSmallestDivisorThreadCore(void* id) {
  long threadId = (long) id;
  while (true) {
	  int res = pthread_barrier_wait( & barr_id);
      if( res == PTHREAD_BARRIER_SERIAL_THREAD) {
		  while (!threadsInitiated) {} //Wait until these threads are supposed to start.
		  int64_t n = getSmallestDivisorInputData;
		  
	  }
      pthread_barrier_wait( & barr_id);
	  if (endThread) {
		  break
	  }
	  if (ansFound) {
		  continue;
	  }
	  //Find the answer.
	  int64_t n = getSmallestDivisorInputData;
	  int64_t i = 5;
	  int64_t max = sqrt(n);
	  
	  
	  
	  while( start <= end) {
		if (n % i == 0) return i;
		if (n % (i+2) == 0) return i + 2;
		i += 6;
	  }
	  //Turn off the thread and final wrapup.
	  res = pthread_barrier_wait( & barr_id);
      if( res == PTHREAD_BARRIER_SERIAL_THREAD) {
		  if (!ansFound) {
			  phread_mutex_lock(&retDataMutex);
			  getSmallestDivisorRetData = 0; //Must have been a prime.
			  phread_mutex_unlock(&retDataMutex);
		  }
		  threadsInitiated = false;
		  ansFound = true;
	  }
      pthread_barrier_wait( & barr_id);
  }
  return threadId;
}

int64_t getSmallestDivisorThreaded(int64_t n, int64_t nThreads)
{
  if (!threadsInitiated) {
	  DivData newThreadData[nThreads]; //We need as many parameters as threads to pass in.
	  threadData = newThreadData; //Tell the global pointer to point to this array.
	  pthread_t newThreads[numThreads]; //Make the threads.
	  threads = newThreads; //Assign them to global.
	  for (long i = 0; i < numThreads; i++) { //Start these threads so they can wait at all.
		  pthread_create(&threads[i], NULL, getSmallestDivisorThreadCore, (void *) i);
	  }
	  threadsInitiated = true;
  }
  
  while (!threadsWaitingOnInput) {}
  pthread_mutex_lock(&inputDataMutex);
  getSmallestDivisorInputData = n;
  pthread_mutex_unlock(&inputDataMutex);
  pthread_con
  while (!threadsDone) {}
  
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

  /// report results
  std::cout << "Sum of divisors = " << sum << "\n";

  return 0;
}

