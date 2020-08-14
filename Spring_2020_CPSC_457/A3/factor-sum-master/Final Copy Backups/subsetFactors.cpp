/// reads in a positive integers in range (2 .. 2^63-1) from standard input
/// for each number on input:
///   if the number is prime, it is ignored
///   determines the smallest factor of the composite number
/// prints out the sum of all smallest factors
///
/// if no composite numbers are found, prints out "0"
///
/// compile with:
///   $ g++ subsetFactors.cpp -O3 -o gcd -lm -lpthread

/**
Multithreaded solution designed by John Ming Ngo, 30020834. The algorithm came to me right before I headed to sleep, like a bolt of lightning. My algorithm, roughly, is:

Main calling function:

main:
	Create barrier with int = number of threads.
	Create all these threads with threadID.
	Create global problem domains.

	Go into core of main.

subsetSum(int problem)
	Put problem number into global problem parameter with mutex locks.
	Atomic bool switch to indicate that a new problem is loaded in.
	Wait until bool switch that problem is solved is sent. (Spinlock)
	Return solution located in global domain.

Threads:
	Block until single.
	While single
		Spinlock until bool switch that new problem is loaded in is toggled.
		Set solution spot to -1.
		Attempt base cases.
		If base cases succeed, indicate problem is solved. Continue to next loop (return to spinlock)
		Else:
			Distribute problem subsets into global problem domains.
	Block into parallel.
	In parallel: Solve problem domain indicated by threadID, located in global domain.
	If global answer output slot is not -1, check to see if it is smaller. If it is, break.
	If have answer: Take mutex for the problem domain. Do the check again to make sure nothing changed on them.
	Block into single.
	If global solution space is not -1: set it to 0.
	Toggle off that a new problem is loaded in (wait for new problem).
	Toggle true answer is found.
	Block again, global loop.

Using atomic variables to signal makes things more responsive than with mutexes, though the problem of thread synchronization still causes problems on large numbers of small inputs.
*/

/**
Note: For numbers which are too small, waiting on the threads to be called by the scheduler so that they can synchronize takes more time than just directly computing the problem. Determining that number and then diverting it also takes time...

Note: likely due to waiting on the CPU deciding to change the active process, or the amount of workload on the server, the results for this method appear to vary by at least 2 seconds every time, if not more, even on high thread counts. Rather unfortunate. I suspect my program can be made vastly more efficient if my spinlocks instead contained something like pthread_yield(), but there's no indication we're allowed to use it, or that it works.

THANK GOODNESS FOR THE 10k NUMBERS ONLY ASSUMPTION! Hitting it with 10 million small numbers broke it.
*/

#include <cstdio>
#include <cstdlib>
#include <cstdint>
#include <cinttypes>
#include <cmath>
#include <iostream>
#include <pthread.h>
#include <atomic>

//Implementation 8: Parallelize smallest divisor, reuse threads, use globals to pass data. See algorithm listed above.
struct DivData {
	int64_t start;
	int64_t end;
	int64_t n;
};

//Function declarations
void distribute(int64_t low, int64_t high, int64_t increment);
void* getSmallestDivisorThreadCore(void* id);
int64_t getSmallestDivisorThreaded(int64_t n, int64_t divertToSingleThreaded);
int64_t getSmallestDivisor(int64_t n);

//These are the threads and the tasks each thread does.
pthread_t * threads;
DivData * tasks;

//These are various bits of information and parameters which we need to know.
pthread_mutex_t numThreadsMutex;
int64_t numThreads;

pthread_mutex_t paramDataMutex;
int64_t getSmallestDivisorParamData;

pthread_mutex_t retDataMutex;
int64_t getSmallestDivisorRetData;

//These are used to signal the main controlling thread of various bits of information.
std::atomic<bool> waitingOnProblem (false);
std::atomic<bool> newProblem (false);
std::atomic<bool> problemSolved (false);
std::atomic<bool> endThreads (false);

//This is the barrier which synchronizes all the threads which do the actual work.
pthread_barrier_t threadSync;

//Distributes the problems into the global task array.
void distribute(int64_t low, int64_t high, int64_t increment) {
	
	int64_t numIncrements = (high - low) / increment;
	
	int64_t incrementsPerThread = numIncrements/numThreads;
	int64_t remainderIncrements = numIncrements%numThreads;
	
	int64_t n = getSmallestDivisorParamData;
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
		//Sets the task for a given i in the array.
		tasks[i].start = start;
		tasks[i].end = next;
		tasks[i].n = n;
		
		//std::cout << "In Distribute - n: " << tasks[i].n << "\n";
		//std::cout << "In Distribute - start: " << tasks[i].start << "\n";
		//std::cout << "In Distribute - end: " << tasks[i].end << "\n";

		start = next;
	}
}
//This is the core threaded function, which conducts the bulk of the threaded work.
void* getSmallestDivisorThreadCore(void* id) {
	long tid = (long) id;
	while (true) {
		int res = pthread_barrier_wait(&threadSync);
		while (res == PTHREAD_BARRIER_SERIAL_THREAD) {
			newProblem = false;
			waitingOnProblem = true; //Signal that the threads are waiting for a new problem.
			//std::cout << "Thread #" << tid << " Waiting on problem" << "\n";
			while (!newProblem) {}
			waitingOnProblem = false; //Got a problem, we no longer wait on a problem.
			if (endThreads) {
				break;
			}
			pthread_mutex_lock(&retDataMutex);
			getSmallestDivisorRetData = -1;
			pthread_mutex_unlock(&retDataMutex);
			int64_t n =  getSmallestDivisorParamData;
			if( n <= 3) {
				//std::cout << "Num believed to be ." << "\n";
				pthread_mutex_lock(&retDataMutex);
				getSmallestDivisorRetData = 0;
				pthread_mutex_unlock(&retDataMutex);
				newProblem = false;
				problemSolved = true;
				continue;
			}
			if( n % 2 == 0) {
				//std::cout << "Waiting for threads to sync." << "\n";
				pthread_mutex_lock(&retDataMutex);
				getSmallestDivisorRetData = 2;
				pthread_mutex_unlock(&retDataMutex);
				newProblem = false;
				problemSolved = true;
				continue;
			}
			if( n % 3 == 0) {
				//std::cout << "Waiting for threads to sync." << "\n";
				pthread_mutex_lock(&retDataMutex);
				getSmallestDivisorRetData = 3;
				pthread_mutex_unlock(&retDataMutex);
				newProblem = false;
				problemSolved = true;
				continue;
			}
			int64_t i = 5;
			int64_t max = sqrt(n);
			distribute(i, max, 6); //TODO: Maybe different parameters.
			break;
		}
		pthread_barrier_wait(&threadSync);
		//All threads check if they should end. If so, die.
		if (endThreads) {
			break;
		}
		//Do the problem in parallel.
		DivData localProblem = tasks[tid];
		
		int64_t n = localProblem.n;
		int64_t start = localProblem.start;
		int64_t end  = localProblem.end;
		
		while(start <= end) {
			if (n % start == 0) {
				pthread_mutex_lock(&retDataMutex);
				if ((getSmallestDivisorRetData != -1) && ( (start) > getSmallestDivisorRetData)) {
					pthread_mutex_unlock(&retDataMutex);
					break; //Someone else already solved the problem, don't care,
				}
				getSmallestDivisorRetData = start;
				pthread_mutex_unlock(&retDataMutex);
			}
			if (n % (start+2) == 0) {
				pthread_mutex_lock(&retDataMutex);
				if ((getSmallestDivisorRetData != -1) && ( (start+2) > getSmallestDivisorRetData)) {
					pthread_mutex_unlock(&retDataMutex);
					break; //Someone else already solved the problem, don't care,
				}
				getSmallestDivisorRetData = (start+2);
				pthread_mutex_unlock(&retDataMutex);
			}
			start += 6;
			if ( (getSmallestDivisorRetData != -1) && (start > getSmallestDivisorRetData) ) { //Someone found a factor smaller; we're done.
				break;
			}
		}
		
		int res2 = pthread_barrier_wait(&threadSync);
		if (res2 == PTHREAD_BARRIER_SERIAL_THREAD) {
			if (getSmallestDivisorRetData == -1) {
				pthread_mutex_lock(&retDataMutex);
				getSmallestDivisorRetData = 0;
				pthread_mutex_unlock(&retDataMutex);
			}
			problemSolved = true;
		}
		pthread_barrier_wait(&threadSync);
	}
	//std::cout << "Thread with ID: " << tid << "Trying to turn off \n";
	return id;
}
//This is the main function that is called, which controls the execution sequence of the threads and handles returns.
int64_t getSmallestDivisorThreaded(int64_t n, int64_t divertToSingleThreaded) {
	if (n < divertToSingleThreaded) {
		return getSmallestDivisor(n); //This problem is too trivial to handle with threads.
	}
	//std::cout << "Waiting for threads to sync." << "\n";
	while (!waitingOnProblem) {} //Wait for threads to sync.
	//std::cout << "Threads synced, assigning problem." << "\n";
	pthread_mutex_lock(&paramDataMutex);
	getSmallestDivisorParamData = n;
	pthread_mutex_unlock(&paramDataMutex);
	//std::cout << "Value assigned." << "\n";
	newProblem = true; //This should turn on the threads.
	//std::cout << "Threads turned on, waiting for them to solve it." << "\n";
	while (!problemSolved) {}
	//std::cout << "Problems solved.\n";
	problemSolved = false;
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
  //Value below which to divert the program to a single-threaded algorithm.
  int64_t divert = 10000; //I found this number to be decent for this problem. Anything below this involves too few cycles to really matter; anything above risks not speeding up when it should.
  
  //Create thread features.
  pthread_mutex_init(&retDataMutex, NULL);
  pthread_mutex_init(&paramDataMutex, NULL);
  pthread_mutex_init(&numThreadsMutex, NULL);
  pthread_barrier_init(&threadSync, NULL, nThreads);
  
  //Initialize threads.
  numThreads = nThreads;
  DivData newTasks[nThreads];
  tasks =  newTasks;
  pthread_t newThreads[nThreads];
  threads = newThreads;
  for (long j = 0; j < numThreads; j++) {
	  pthread_create(&threads[j], NULL, getSmallestDivisorThreadCore, (void *) j);
  }
  
  /// sum up the divisors
  int64_t sum = 0;
  while( 1) {
    int64_t num;
    if( ! (std::cin >> num) ) break;
    int64_t divVal = getSmallestDivisorThreaded(num, divert);
    // the line below may help you with debugging
    //std::cout << "Debug: " << num << " --> " << divVal << "\n";
    sum += divVal;
  }
  //End threads.
  //std::cout << "Waiting to turn off threads \n";
  while (!waitingOnProblem) {}
  endThreads = true;
  newProblem = true;
  //std::cout << "Threads should turn themselves off...\n";
  //Destroy thread features.
  pthread_mutex_destroy(&retDataMutex); //No longer need this mutex.
  pthread_mutex_destroy(&paramDataMutex);
  pthread_mutex_destroy(&numThreadsMutex);
  pthread_barrier_destroy(&threadSync);
  /// report results
  std::cout << "Sum of divisors = " << sum << "\n";

  return 0;
}

