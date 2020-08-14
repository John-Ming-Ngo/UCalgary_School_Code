/// reads in a positive integers in range (2 .. 2^63-1) from standard input
/// for each number on input:
///	  if the number is prime, it is ignored
///	  determines the smallest factor of the composite number
/// prints out the sum of all smallest factors
///
/// if no composite numbers are found, prints out "0"
///
/// compile with:
///	  $ g++ 3sumFactorsReuseAttempt2.cpp -O3 -o gcd -lm -lpthread

/**
Issue: Not done. Runs into lock issues. Need to also check the distribute values...

Attempting: 3 new mutexes. Not sure if any of that helps at all.
*/

#include <cstdio>
#include <cstdlib>
#include <cstdint>
#include <cinttypes>
#include <cmath>
#include <iostream>
#include <pthread.h>

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

1. Thread is in eternal	 loop.
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

//Implementation 2: TODO

pthread_mutex_t currentNumMutex;
int64_t currentNumber;

int64_t* starts;
int64_t* ends;

pthread_t* threads;
int64_t numThreads;

pthread_mutex_t startThreadMutex;
bool startThread;
pthread_mutex_t waitingNumberMutex;
bool waitingOnNewNumber;
pthread_mutex_t killThreadMutex;
bool killThread;

pthread_barrier_t threadSync;
pthread_mutex_t threadWait;
pthread_cond_t runThreads;

pthread_mutex_t retDataMutex;
int64_t getSmallestDivisorRetData;

void distribute(int64_t low, int64_t high, int64_t increment) {
	int64_t n = currentNumber;
	
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
		
		starts[i] = start;
		ends[i] = next;
		
		std::cout << "In Distribute - start: " << starts[i] << "\n";
		std::cout << "In Distribute - end: " << ends[i] << "\n";

		start = next;
	}
}

//Programming with globals is lazy, but I tried programming with mutable memory and it went to hell remarkably quickly.
void* getSmallestDivisorThreadCore(void* id) {	
	long threadId = (long) id;
	
	while (true) {
		//Wait to start.
		int res = pthread_barrier_wait( &threadSync);
		if( res == PTHREAD_BARRIER_SERIAL_THREAD) {
			pthread_mutex_lock(&threadWait);
			while (!startThread) {
				std::cout << "Waiting to start thread." << "\n";
				std::cout << "Waiting value: " << waitingOnNewNumber << "\n";
				pthread_mutex_lock(&waitingNumberMutex);
				waitingOnNewNumber = true;
				pthread_mutex_unlock(&waitingNumberMutex);
				std::cout << "Waiting value: " << waitingOnNewNumber << "\n";
				pthread_cond_wait(&runThreads, &threadWait);
				
				std::cout << "Condition awoken." << "\n";
			}
			pthread_mutex_unlock(&threadWait);
		}
		pthread_barrier_wait( &threadSync);

		//Thread exit condition.
		if (killThread) {
			break;
		}
		std::cout << "Didn't kill thread." << "\n";
		int64_t n = currentNumber;
		int64_t i = starts[i];
		int64_t max = ends[i];
		std::cout << "Current Number: " << n << "| start: " << i << "| end: " << max << "\n";
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
			i += 6; //Increment. TODO: Oh this can be a problem also. WTF?
			if ( (getSmallestDivisorRetData != -1) && (i > getSmallestDivisorRetData) ) { //Someone found a factor smaller; we're done.
				break;
			}
		}
		pthread_mutex_lock(&startThreadMutex);
		startThread = false;
		pthread_mutex_unlock(&startThreadMutex);
	}
  return id;
}

int64_t getSmallestDivisorThreaded(int64_t n)
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
  pthread_mutex_lock(&startThreadMutex);
  startThread = false;
  pthread_mutex_unlock(&startThreadMutex);
  std::cout << "Waiting on new number" << "\n";
  while (!waitingOnNewNumber) {
	  std::cout << "Waiting value: " << waitingOnNewNumber << "\n";
  } //Spinlock.
  std::cout << "Waiting on new number done" << "\n";
  
  pthread_mutex_lock(&threadWait);
  pthread_mutex_lock(&waitingNumberMutex);
  waitingOnNewNumber = false;  
  pthread_mutex_unlock(&waitingNumberMutex);
  pthread_mutex_lock(&currentNumMutex);
  currentNumber = n; //Send data on current number to globals where threads can read it.
  pthread_mutex_unlock(&currentNumMutex);
  distribute(i, max, 6); //Distribute the work across the threads. The increment is 6, from the core...
  pthread_mutex_lock(&startThreadMutex);
  startThread = true;
  pthread_mutex_unlock(&startThreadMutex);
  pthread_cond_broadcast(&runThreads);
  pthread_mutex_unlock(&threadWait);
  
  std::cout << "Threads Started." << "\n";
  
  while (!waitingOnNewNumber) {} //Spinlock, waiting for the threads to complete and loop around.
  
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
///	   n =	1		  --> result = 0
///	   n =	2		  --> result = 0
///	   n =	9		  --> result = 3
///	   n = 35		  --> result = 5
///	   n = 8589934591 --> result = 7
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

  //Threads
  numThreads = nThreads;
  //Make the threads
  pthread_t newThreads[nThreads];
  threads = newThreads; //Global thread array pointer to this array of threads we made.
  //Vital thread components.
  pthread_mutex_init(&retDataMutex, NULL);
  pthread_mutex_init(&threadWait, NULL);
  
  pthread_mutex_init(&startThreadMutex, NULL);
  pthread_mutex_init(&waitingNumberMutex, NULL);
  pthread_mutex_init(&killThreadMutex, NULL);
  pthread_mutex_init(&currentNumMutex, NULL);
  
  pthread_barrier_init (&threadSync, NULL, numThreads);
  pthread_cond_init(&runThreads, NULL);
  //Initialize all booleans
  startThread = false;
  waitingOnNewNumber = false;
  killThread = false;
  //Start up all threads which need to do work. They won't do anything until I signal them to start, which happens in the original function.
  for (long threadNum = 0; threadNum < numThreads; threadNum++) {
	  pthread_create(&threads[threadNum], NULL, getSmallestDivisorThreadCore, (void *) threadNum); //I am going to be using globals for this, screw everything.
  }

  /// sum up the divisors
  int64_t sum = 0;
  while( 1) {
	int64_t num;
	if( ! (std::cin >> num) ) break;
	int64_t divVal = getSmallestDivisorThreaded(num);
	// the line below may help you with debugging
	std::cout << "Debug: " << num << " --> " << divVal << "\n";
	sum += divVal;
  }

  /// report results
  std::cout << "Sum of divisors = " << sum << "\n";
  //Kill threads
  killThread = true;
  startThread = true;
  pthread_cond_broadcast(&runThreads);
  for (long i = 0; i < numThreads; i++){// Wait for all of them.
	pthread_join(threads[i], NULL);
  }
  //Kill unneeded thread components.
  pthread_mutex_destroy(&retDataMutex); //No longer need this mutex.
  pthread_mutex_destroy(&threadWait); //No longer need this mutex.
  
  pthread_mutex_destroy(&startThreadMutex); //No longer need this mutex.
  pthread_mutex_destroy(&waitingNumberMutex); //No longer need this mutex.
  pthread_mutex_destroy(&killThreadMutex); //No longer need this mutex.
  pthread_mutex_destroy(&currentNumMutex);
  
  pthread_barrier_destroy(&threadSync); //No longer need this barrier.
  pthread_cond_destroy(&runThreads); //No Longer need this condition var.
  return 0;
}

