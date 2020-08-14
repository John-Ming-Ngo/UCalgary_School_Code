/**
Multithreaded conversion of the single-threaded subset program
By: Pavol Federl (majority of code), John Ming Ngo (conversion edits).
30020834
*/

// single threaded program that reads in 32-bit integers from
// standard input, and then counds and prints out how many
// subsets of these integers sum up to 0 (zero).
//
// this program uses a trivial exponential time algorithm, by
// testing every possible subset (there are 2^N-1 subsets to
// test for N integers)
//
// the program uses global variables - to make it a bit easier
// to convert to a multi-threaded code for programmers
// that have not used pthreads before

#include <iostream>
#include <stdio.h>
#include <vector>
#include <stdlib.h>
#include <assert.h>
#include <errno.h>

#include <pthread.h>

//I utilize this structure to carry data through threads - John Ming Ngo
struct countData {
	long countVal;
	long taskStart;
	long taskFinish;
};

// global variables are bad ...
// but they are acceptable for your first mulithreaded program
std::vector<long> a;
long count = 0;


//- Old code
// for debugging purposes (if you want to print the combinations)
void print_sol(long comb)
{
  return; // comment this out if you want to see the subsets
  
  for(size_t i = 0 ; i < a.size() ; i ++ ) {
    if( comb & 1)
      printf("%ld ", a[i]);
    comb /= 2;
  }
  printf("\n");
}

// test a combination 'comb'
// the binary representation of comb will be used to decide
// which numbers in a[] will be used to test the sum
void test(long comb)
{
  long long sum = 0;
  long bits = comb;
  for(size_t i = 0 ; i < a.size() ; i ++ ) {
    if( bits & 1) // check lowest bit
      sum += a[i];
    bits >>= 1; // shift bits to the right
  }
  if( sum == 0) {
    print_sol(comb);
    count ++;
  }
}

// test all combinatsion in range [from, to)
void test_range( long from, long to)
{
  for( long i = from ; i < to ; i ++) {
	test(i);
  }
}

/** Old version, need to change everything.
//John Ming Ngo, this divides the tasks evenly amongst the parameters.
void test_enqueue( long from, long to, countData params[], long nThreads)
{
  //std::cout << "Test enqueue from: " << from << "\n";
  //std::cout << "Test enqueue to: " << to << "\n";
  int threadNum = 0;
  for( long i = from ; i < to ; i ++) {
	countData threadParam = params[threadNum];
	threadParam.tasks.push_back(i);
	params[threadNum] = threadParam;
	threadNum++;
	threadNum = threadNum % nThreads;
  }
  
}
*/

//John Ming Ngo, this divides the tasks evenly amongst the parameters.
void test_enqueue( long from, long to, countData params[], long nThreads)
{
  //std::cout << "Test enqueue from: " << from << "\n";
  //std::cout << "Test enqueue to: " << to << "\n";
  long increment = (to - from) / nThreads;
  long remainder = (to - from) % nThreads;
  long base = from; //Don't want 000000 because that's trivially 0!
  long next = 0;
  
  long threadNum = 0;
  while (threadNum < nThreads) {
	  next = base + increment;
	  if (remainder > 0) {
		  next++;
		  remainder--;
	  } //Pass a remainder into this current task.
	  
	  countData threadParam = params[threadNum];
	  threadParam.taskStart = base;
	  
	  threadParam.taskFinish = next;
	  params[threadNum] = threadParam;
	  threadNum++;
	  
	  base = next;
  }
  
}
//John Ming Ngo, Boolean edition of the test.
bool test2(long comb)
{
  long long sum = 0;
  long bits = comb;
  for(size_t i = 0 ; i < a.size() ; i ++ ) {
    if( bits & 1) // check lowest bit
      sum += a[i];
    bits >>= 1; // shift bits to the right
  }
  if( sum == 0) {
    //std::cout << comb << "\n";
    return true;
  }
  return false;
}
//John Ming Ngo, this code executes the test.
void testCountData(countData * data) {
	//std::cout << "TestCount Set Count: " << data->countVal << "\n"; //Tests
	
	long taskStart = data->taskStart; //Get the start and end
	long taskFinish = data->taskFinish;
	
	//std::cout << taskStart << "\n";
	//std::cout << taskFinish << "\n";
	
	//std::vector<long> tasks = data->tasks;
	//std::cout << "Tests size: " << tasks.size() << "\n";
	
	//Conduct the test.
	for (long i = taskStart; i < taskFinish; i++) {
		//std::cout << "Current task:" << "\n";
		//std::cout << task << "\n";
		if (test2(i)) {
			data->countVal++;
		}
	}
	//std::cout << "Number Zeros Counted by Thread: " << data->countVal << "\n";
}
//John Ming Ngo, this is the main thread control function. I shove the entire control flow into here.
void * threadExecute(void * params) {
	//std::cout << "Thread Executing, " << "\n";
	countData * paramData = (countData*) params; //Get the count data package.
	//std::cout << "Param Init Count: " << paramData->countVal << "\n";
	paramData->countVal = 0; //Make sure it's initialized to 0.
	//std::cout << "Param Set Count: " << paramData->countVal << "\n";
	testCountData(paramData);	//Execute the test.
	pthread_exit(0); //Terminate on success.
}

int main( int argc, char ** argv)
{
  //
  // parse command line arguments
  //
  if( argc > 2) {
    printf("Error: expected at most 1 command line argument.\n");
    return -1;
  }
  long nThreads = 1;
  if( argc > 1) {
    // convert argv[1] to 'nThreads', report error if failed
    char * end = 0;
    errno = 0;
    nThreads = strtol( argv[1], & end, 10);
    if( * end != 0 || errno != 0) {
      printf("Expected integer, but you gave me '%s'\n", argv[1]);
      return -1;
    }
	if (nThreads < 1) {
		printf("You gave me a zero or negative number of threads, that's evil! '%s'\n", argv[1]);
      return -1;
	}
	if (nThreads > 32) {
		printf("Warning: Number of Threads > 32, this isn't recommended (by the assignment)... '%s'\n", argv[1]);
	}
  }
  /**
  if( nThreads > 1) { //We can do multithreading now.
    printf("Sorry, I don't know how to use multiple threads yet.\n");
    nThreads = 1;
  }
  */
  
  //
  // read all integers one by one and put them into the array
  //
  while(1) {
    long n;
    if( 1 != scanf("%ld", & n)) break;
    a.push_back(n);
  }

  // debug message
  printf( "Using %ld thread(s) on %lu numbers.\n",
	  nThreads, a.size());

  //
  // to convert this into multithreaded code, you should
  // create threads here, and make each thread count different
  // subsets
  //
  // to make the code work without synchronization mechanisms,
  // you should make separate counters for each thread
  //
  
  
  //Start: My Code, John Ming Ngo, 30020834
  pthread_t threads[nThreads]; //Make the threads.
  countData threadData[nThreads]; //We need as many parameters as threads to pass in.
  
  //Enqueue all the tasks. This just means evenly dividing the tasks into the right bins.
  test_enqueue(1, long(1) << a.size(), threadData, nThreads);
  
  //Task execute.
  for (long i = 0; i < nThreads; i++) { //Do all the tasks
	  //std::cout << "Thread Starting: " << i << "\n";
	  pthread_create(&threads[i], NULL, threadExecute, &threadData[i]);
  }
  
  //Wait for finish.
  for (pthread_t thread:threads){// Wait for all of them.
	pthread_join(thread, NULL);  
  }
  //
  // once you join the threads, you can simply sum up the counters
  // to get the total count
  //
  // since this version does not use multiple counters, report the only
  // one we have
  //
  //Count it all.
  for (countData data:threadData) {
	  //std::cout << data.countVal << "\n";
	  count += data.countVal;
  }
  //Report.
  printf("Subsets found: %ld\n", count);
  

  return 0;
}
