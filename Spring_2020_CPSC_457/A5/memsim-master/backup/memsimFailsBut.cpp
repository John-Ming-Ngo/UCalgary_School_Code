#include <stdio.h>
#include <string>
#include <vector>
#include <cassert>
#include <list>
#include <iostream>
#include <unordered_map>
#include <set>

/**
Current problem: Segfault on deleting 5 in a test. Find out why.

==> There are keys INSIDE the iterator list that do not point to anything valid! Figure out why.
==? Their target was already deleted, but it still points to it. That's weird.
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

struct BySize {
	bool operator () (std::list<MemAlloc>::iterator lhs, std::list<MemAlloc>::iterator rhs) {
		//std::cout << "Comparing\n";
		//std::cout << "LHS stats: " << (*lhs).tag << " " << (*lhs).size << "\n";
		//std::cout << "RHS stats: " << (*rhs).tag << " " << (*rhs).size << "\n";
		return ((*lhs).size < (*rhs).size); //Less than or equal to?
	}
};
struct ByReference { //Lets me check if the iterator is pointing to the same object or not.
	bool operator () (std::list<MemAlloc>::iterator lhs, std::list<MemAlloc>::iterator rhs) {
		return (&(*lhs) < &(*rhs)); //Less than or equal to?
	}
};

// all you need to do is to fill in the implementation of MemSim class
struct MemSim {
  private:
	long pageSize;
	long numRequests;
	
	std::list<MemAlloc> allocations;
	std::set<std::list<MemAlloc>::iterator,BySize> freeBlocks;
	std::set<std::list<MemAlloc>::iterator,ByReference> freeBlocksReference;
	std::unordered_map<long, std::vector<std::list<MemAlloc>::iterator>> taggedBlocks;
	
  public:
  // initializes the memory simulator with a page size
  MemSim( long page_size) {
    pageSize = page_size;
	numRequests = 0;
	MemAlloc initial_alloc = {FREE, 0};
	allocations.push_back(initial_alloc);
	freeBlocks.emplace(allocations.begin());
	freeBlocksReference.emplace(allocations.begin());
  }

  
  // frees all blocks with the given tag and merges adjecent free blocks.
  void free(long tag) {
	//Deallocate
    for (std::list<MemAlloc>::iterator it1:taggedBlocks[tag]) {
		//std::cout << "Iteration:\n";
		//printState();
		std::list<MemAlloc>::iterator left, right;
		left = right = it1;
		(*it1).tag = FREE;
		//TODO: Somewhere in here, I end up doing a bad delete or insert, resulting in corrupted entries for my set. Figure out why. Verified that the stupid code works in a different context. Problem is allocations.erase and leaving behind a bad iterator.
		
		if (left != allocations.begin()) {
			left--;
			if ((*left).tag == FREE) {
				//std::cout << "left merge\n";
				(*it1).size += (*left).size;
				//std::cout << "Decrementing\n";
				//TODO: Should I really be erasing a range?? I am segfaulting, means some pointer doesn't exist?
				std::pair<std::set<std::list<MemAlloc>::iterator>::const_iterator,std::set<std::list<MemAlloc>::iterator>::const_iterator> retVal = freeBlocksReference.equal_range(left);
				freeBlocksReference.erase(retVal.first, retVal.second);
				freeBlocks.erase((*(retVal.first)));
				
				//allocations.erase((*(retVal.first)));
				//std::cout << "left merge finish\n";
			}
		}
		
		if (right != allocations.end()) { //Actually make it its right neighbour if and only if it's not already at the end. TODO: I probably don't need this, there's no way one of the tags would be the end  iterator pointer...
			right++;
		}
		if (right != allocations.end()) { //Might I have exceeded allocations.end and so this thing is broken for that reason? Possibly...
			if ((*right).tag == FREE) {
				printf("Free Blocks:\n");
				printFreeBlocks();
				printf("Free Blocks Reference:\n");
				printFreeBlocksReference();
				std::cout << "right merge\n";
				
				(*it1).size += (*right).size;
				//std::cout << "Incrementing\n";
				std::pair<std::set<std::list<MemAlloc>::iterator>::const_iterator,std::set<std::list<MemAlloc>::iterator>::const_iterator> retVal = freeBlocksReference.equal_range(right);
				//std::cout << "Equal Range success\n";
				freeBlocksReference.erase(retVal.first, retVal.second);
				
				//std::cout << "Reference erase success\n";
				
				printf("Item ID: ");
				std::cout << &(*(retVal.first)) << "\n";
				
				freeBlocks.erase((*(retVal.first)));
				
				//std::cout << "Free Blocks erase success\n";
				
				allocations.erase((*(retVal.first))); //TODO: This line is the problem. FreeBlocks doesn't get erased or something, leaving a corrupted pointer.
				
				//std::cout << "Actual list erase success\n";
				//std::cout << "right merge finish\n";
			}
		}
		freeBlocks.insert(it1);
		freeBlocksReference.insert(it1);
	}
	taggedBlocks[tag].clear();  //Forgot about this, in case we delete the same tag repeatedly.
  }
  
  // allocates a chunk using best-fit
  // if no suitable chunk found, requests new page(s)
  void alloc( long tag, long size) {
	std::list<MemAlloc>::iterator candidate;
	bool foundCandidate = false;
	
	MemAlloc newAllocA = {tag, size};
	allocations.push_back(newAllocA);
	std::pair<std::set<std::list<MemAlloc>::iterator>::const_iterator,std::set<std::list<MemAlloc>::iterator>::const_iterator> findMatch = freeBlocks.equal_range((--allocations.end())); //This is some insane mental gymnastics.
	foundCandidate = !(findMatch.first == freeBlocks.end());
	if (foundCandidate) {
		candidate = (*(findMatch.first));
	}
	allocations.pop_back();
	
	if (!foundCandidate) {
		MemAlloc lastFree = *(--allocations.end());
		long sizeNeeded = size - lastFree.size;
		long numPagesNeeded = sizeNeeded/pageSize + (sizeNeeded % pageSize != 0); //I am assuming this value is going to be positive.
		numRequests += numPagesNeeded;
		(*(--allocations.end())).size += numPagesNeeded * pageSize;
		candidate = --allocations.end();
	}
	if (((*candidate).size == size) && (candidate != (--allocations.end()))) {
		//std::cout << "If tag the perfect fit.\n";
		//Remove the candidate from the list of availiable.
		//Todo: Check if this remove code makes actual sense.
		std::pair<std::set<std::list<MemAlloc>::iterator>::const_iterator,std::set<std::list<MemAlloc>::iterator>::const_iterator> retVal = freeBlocksReference.equal_range(candidate);
		freeBlocksReference.erase(retVal.first, retVal.second);
		freeBlocks.erase((*(retVal.first)));
		//Do stuff
		(*candidate).tag = tag;
		taggedBlocks[tag].push_back(candidate);
	}
	else {
		//std::cout << "Else create a new allocation block and insert it.\n";
		
		MemAlloc newAlloc{tag, size};
		
		//std::cout << "Empty spot old size: " << (*candidate).size << "\n";
		//std::cout << "Empty spot old tag: " << (*candidate).tag << "\n";
		//std::cout << "Whether or not a fit candidate was found (and we didn't need to manually set it): " << foundCandidate << "\n";
		(*candidate).size -= size;
		//std::cout << "Empty spot new size: " << (*candidate).size << "\n";
		
		allocations.insert(candidate, newAlloc); //Todo: Not sure if the iterator moves as a result of this. Hopefully not.
		taggedBlocks[tag].push_back((--candidate)); //Add pointer to inserted block for tagged blocks.
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
	  //std::cout << "----------------------------------------------\n";
	  for (std::list<MemAlloc>::iterator block:freeBlocks) {
		  if ((*block).tag != FREE) {
			  std::cout << "Tag: " << (*block).tag << "| Value: " << (*block).size << "\n";
		  }
	  }
	  //std::cout << "----------------------------------------------\n";
  }
  void printFreeBlocksReference() {
	  //std::cout << "----------------------------------------------\n";
	  for (std::list<MemAlloc>::iterator block:freeBlocksReference) {
		  if ((*block).tag != FREE) {
		  std::cout << "Tag: " << (*block).tag << "| Value: " << (*block).size << "\n";
		  }
	  }
	  //std::cout << "----------------------------------------------\n";
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
	//std::cout << "Numbers: " << n1 << " | " << n2 << "\n";
    if( n1 < 0) {
		//std::cout << "Freeing \n";
		ms.free( -n1);
	}
      
    else {
		//std::cout << "Adding \n";
		ms.alloc( n1, n2);
	}
	//Debug
	//ms.printState();
	//ms.printFreeBlocks();
	//ms.printFreeBlocksReference();
  }
  //ms.printState();
  //ms.printFreeBlocks();
  //ms.printFreeBlocksReference();
  // report results
  // ------------------------------
  long n_page_requests, largest_free_chunk_size;
  ms.get_report( n_page_requests, largest_free_chunk_size);
  printf("pages requested: %ld\n", n_page_requests);
  printf("largest free chunk: %ld\n", largest_free_chunk_size);

  return 0;
}

