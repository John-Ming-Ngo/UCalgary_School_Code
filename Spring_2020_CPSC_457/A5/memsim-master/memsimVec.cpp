#include <stdio.h>
#include <string>
#include <vector>
#include <cassert>
#include <iostream>

/**
John Ming Ngo, 30020834

First implementation, utilizing a vector to store relevant data. Algorithm is O(n^2), fails on very large inputs.
*/

typedef std::vector<std::string> vs_t;

// split string p_line into a vector of strings (words)
// the delimiters are 1 or more whitespaces
vs_t
split( const std::string & p_line)
{
  auto line = p_line + " ";
  vs_t res;
  bool in_str = false;
  std::string curr_word = "";
  for( auto c : line) {
    if( isspace(c)) {
      if( in_str)
        res.push_back(curr_word);
      in_str = false;
      curr_word = "";
    }
    else {
      curr_word.push_back(c);
      in_str = true;
    }
  }
  return res;
}

// convert string to long
// if successful, success = True, otherwise success = False
long
str2long( const std::string & s, bool & success)
{
  char * end = 0;
  errno = 0;
  long res = strtol( s.c_str(), & end, 10);
  if( * end != 0 || errno != 0) {
    success = false;
    return -1;
  }
  success = true;
  return res;
}

// read in a line from stdin and parse it
// parsed results are passed back via parameter references
// returns true on EOF, otherwise false
// aborts program on bad input
bool
parse_line( long & n1, long & n2)
{
  char buff[4096];
  vs_t words;
  static long line_no = 0;

  // read in a line and parse it into words
  while(1) { // loop to skip empty lines
    line_no ++;
    if( ! fgets( buff, sizeof(buff), stdin))
      return true; // eof
    words = split(buff);
    if( words.size() != 0) break; // continue if line not empty
  }

  if( words.size() > 2) {
    printf("Error on line %ld - too many words\n", line_no);
    exit(-1);
  }

  // convert first word into number
  bool ok;
  n1 = str2long( words[0], ok);
  if( ! ok) {
    printf("Error on line %ld - not an integer\n", line_no);
    exit(-1);
  }

  if( n1 < 0) {
    if( words.size() != 1) {
      printf("Error on line %ld - too many numbers\n", line_no);
      exit(-1);
    }
  }
  else {
    // convert 2nd number
    n2 = str2long( words[1].c_str(), ok);
    if( ! ok || n2 < 1) {
      printf("Error on line %ld - 2nd paramter not positive integer\n",
             line_no);
      exit(-1);
    }
  }
  return false;
};

#define FREE -1
struct MemAlloc {
	long tag;
	long size;
};

// all you need to do is to fill in the implementation of MemSim class
struct MemSim {
  private:
	long pageSize;
	long numRequests;
	std::vector<MemAlloc> allocations;
	
  public:
  // initializes the memory simulator with a page size
  MemSim( long page_size) {
    pageSize = page_size;
	numRequests = 0;
	MemAlloc initial_alloc = {FREE, 0};
	allocations.push_back(initial_alloc);
  }
  //O(n), merges all empty bits together.
  void mergeEmpty() {
	//i = 1, because there must be at least one thing before it to merge with.
	unsigned long i = 1;
	while (i < allocations.size()) {
		if ((allocations[i].tag == FREE) && (allocations[i-1].tag == FREE)) {
			allocations[i-1].size += allocations[i].size;
			allocations.erase(allocations.begin()+i);
			continue;
		}
		i++;
	}
  }
  
  // frees all blocks with the given tag and merges adjecent free blocks
  void free( long tag) {
	//Deallocate
    for (unsigned long i = 0; i < allocations.size(); i++) {
		if (allocations[i].tag == tag) {
			allocations[i].tag = FREE;
		}
	}
	mergeEmpty();
  }
  // allocates a chunk using best-fit
  // if no suitable chunk found, requests new page(s)
  void alloc( long tag, long size) {
	unsigned long candidate = 0;
	bool foundCandidate = false;
    for (unsigned long i = 0; i < allocations.size(); i++) {
		if (allocations[i].tag != FREE) continue;
		if ((allocations[i].size == size) && (i != (allocations.size()-1))) {
			candidate = i;
			foundCandidate = true;
			break; //We're done; we found a perfect fit
		}
		if ((!foundCandidate) && (allocations[i].size >= size)) {
			candidate = i;
			foundCandidate = true;
		}
		else if ((foundCandidate) && (allocations[i].size < allocations[candidate].size) && (allocations[i].size >= size)) {
			candidate = i;
		}
	}
	if (!foundCandidate) {
		MemAlloc lastFree = allocations[allocations.size()-1];
		long sizeNeeded = size - lastFree.size;
		long numPagesNeeded = sizeNeeded/pageSize + (sizeNeeded % pageSize != 0); //I am assuming this value is going to be positive.
		numRequests += numPagesNeeded;
		allocations[allocations.size()-1].size += numPagesNeeded * pageSize;
		candidate = allocations.size()-1;
	}
	if ((allocations[candidate].size == size) && (candidate != (allocations.size()-1))) {
		allocations[candidate].tag = tag;
	}
	else {
		MemAlloc newAlloc{tag, size};
		allocations[candidate].size -= size;
		allocations.insert(allocations.begin() + candidate, newAlloc);
	}
  }
  // returns statistics about the simulation
  // - number of total page requests
  // - the largest available chunk
  void get_report( long & n_req, long & largest) {
    // implement this
    n_req = numRequests;
    largest = getLargestFreeChunk();
  }
  long getLargestFreeChunk() {
	  long biggest = 0;
	  for (MemAlloc allocation:allocations) {
		  //std::cout << "Checking allocation";
		  if ((allocation.size > biggest) && (allocation.tag == FREE))
			  biggest = allocation.size;
	  }
	  return biggest;
  }
  void printState() {
	  std::cout << "----------------------------------------------\n";
	  for (MemAlloc allocation:allocations) {
		  std::cout << "Tag: " << allocation.tag << "| Value: " << allocation.size << "\n";
	  }
	  std::cout << "----------------------------------------------\n";
  }
  void printFreeBlocks() {
	  std::cout << "----------------------------------------------\n";
	  for (MemAlloc allocation:allocations) {
		  if (allocation.tag == FREE) {
			  std::cout << "Tag: " << allocation.tag << " | Value: " << allocation.size << "\n";
		  }
	  }
	  std::cout << "----------------------------------------------\n";
  }
};

int
main( int argc, char ** argv)
{
  // parse command line arguments
  // ------------------------------
  long page_size = 1000;
  if( argc != 2) {
    printf("Assuming page size = %ld.\n", page_size);
  }
  else {
    bool ok;
    page_size = str2long( argv[1], ok);
    if( !ok || page_size < 1) {
      printf("Bad page size '%s'.\n", argv[1]);
      exit(-1);
    }
  }

  // process every line
  // ------------------------------
  MemSim ms( page_size);
  
  while(true) {
    long n1, n2;
    if( parse_line( n1, n2)) break;
    if( n1 < 0)
      ms.free( -n1);
    else
      ms.alloc( n1, n2);
	//Debug
	//ms.printState();
  }
  //ms.printState();
  //ms.printFreeBlocks();
  // report results
  // ------------------------------
  long n_page_requests, largest_free_chunk_size;
  ms.get_report( n_page_requests, largest_free_chunk_size);
  printf("pages requested: %ld\n", n_page_requests);
  printf("largest free chunk: %ld\n", largest_free_chunk_size);

  return 0;
}

