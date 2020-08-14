#include <stdio.h>
#include <string>
#include <vector>
#include <cassert>
#include <list>
#include <iostream>
#include <unordered_map>
#include <set>
#include <assert.h>

/**
Implementation 2.0: Linked list and size-based memory addressing, based heavily on the tips and hints Prof. Federl provided on D2L and via emails.

This program simultates memory allocation for a number of processes by the OS (or similar by a program with its allocated memory)

I tunnel visioned too hard on addresses being some sort of abstract thing that I completely missed their connection to the class's physical memory addressing idea. Once I was reminded of this, everything actually fell into place, holy smokes.

John Ming Ngo,
30020834
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

//This code by John Ming Ngo, 30020834
#define FREE -1 //Tags are positive, so we can use negative tags to denote 'free' chunks.
struct MemAlloc {
	long tag; //What process the memory chunk belongs to.
	long size; //The size of the chunk.
	long long address; //Its starting address. Should be equivalent to the sum of the sizes of prior chunks.
};

//Struct used by the set during initialization to determine how it sorts itself.
//Here, we sort first by size, and then secondarily by address.
struct BySizeAndAddress {
	bool operator () (std::list<MemAlloc>::iterator lhs, std::list<MemAlloc>::iterator rhs) {
		//std::cout << "Comparing\n";
		//std::cout << "LHS stats: " << (*lhs).tag << " " << (*lhs).size << "\n";
		//std::cout << "RHS stats: " << (*rhs).tag << " " << (*rhs).size << "\n";
		//Less than or equal to?
		if ((*lhs).size == (*rhs).size) { //If the files are the same size, sort them by address of what they're pointing to. Else, sort them by their size.
			return ((*lhs).address < (*rhs).address); //==> Strict ordering is needed if I don't want to crash my entire set.
		}
		return ((*lhs).size < (*rhs).size); 
	}
};

// all you need to do is to fill in the implementation of MemSim class
//This struct/class simulates memory allocation.
//Filled in by John Ming Ngo, 30020834
struct MemSim {
  private:
	//These attributes are what the user wants to know down the road. We'll record them here so we can output them after the sim.
	long pageSize;
	long numRequests;
	//These are vital for the actual simulation.
	std::list<MemAlloc> allocations;
	std::set<std::list<MemAlloc>::iterator,BySizeAndAddress> freeBlocks; //Free blocks sorted by size/address.
	std::unordered_map<long, std::vector<std::list<MemAlloc>::iterator>> taggedBlocks;
	
  public:
  // initializes the memory simulator with a page size
  MemSim( long page_size) {
    pageSize = page_size;
	numRequests = 0;
	MemAlloc initial_alloc = {FREE, 0, 0}; //Start off the address on 1, at the minimum.
	allocations.push_back(initial_alloc);
	freeBlocks.insert(allocations.begin());
  }  
  
  // frees all blocks with the given tag and merges adjecent free blocks.
  void free(long tag) {
	//Deallocate
    for (std::list<MemAlloc>::iterator it1:taggedBlocks[tag]) {
		(*it1).tag = FREE;
		//Merge adjacent chunks
		std::list<MemAlloc>::iterator left = it1;
		left--;
		if ((it1 != allocations.begin()) && ((*left).tag == FREE)) {
			(*it1).size += (*left).size;
			(*it1).address = (*left).address; //Take the lower address as its own, since we're eating the left chunk. Vital.
			std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(left);
			freeBlocks.erase(retVal);
			allocations.erase((*retVal));
			//TODO: Take the lower label out of convenience?
			//(*left).size = 0;
			//freeBlocks.insert(left);
		}
		std::list<MemAlloc>::iterator right = it1;
		right++;
		if ((right != allocations.end()) && ((*right).tag == FREE)) {
			(*it1).size += (*right).size;
			std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(right);
			freeBlocks.erase(retVal);
			allocations.erase((*retVal));
			//(*right).size = 0;
			//freeBlocks.insert(right);
		}
		//std::cout << "Sanity Check: Left and Right not equal to each other: " << (left!=right) << "\n";
		//std::cout << "Sanity Check: Right not equal to it1: " << (it1!=right) << "\n";
		//std::cout << "Sanity Check: Left not equal to it1: " << (it1!=left) << "\n";
		
		//Insert current chunk into the list of free allocations.
		freeBlocks.insert(it1);
	}

	taggedBlocks[tag].clear();  //Forgot about this, makes sure we don't delete the same set of things repeatedly. Or the wrong things.
  }
  
  // allocates a chunk using best-fit
  // if no suitable chunk found, requests new page(s)
  void alloc( long tag, long size) {
	//std::cout<< "New Allocation.\n";
	//Check to see if we can find a open slot corresponding to the block we want to insert.
	std::list<MemAlloc> testList = {{FREE, size, -1}}; //Dummy block. Negative to ensure we get the correct first entry.
	std::set<std::list<MemAlloc>::iterator>::iterator findMatch = freeBlocks.lower_bound((testList.begin()));
	std::list<MemAlloc>::iterator candidate = allocations.end();
	//If we can, we identify it.
	if (findMatch != freeBlocks.end()) {
		candidate = (*findMatch);
	}
	//If we can't, we insert the new entry at the open block at the end.
	if (candidate == allocations.end()) {
		candidate = (--allocations.end());
		//Get rid of the set's old pointer.
		std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(candidate);
		freeBlocks.erase(retVal);
		
		//Adjust the candidate block.
		MemAlloc lastFree = *(candidate);
		long sizeNeeded = size - lastFree.size;
		long numPagesNeeded = sizeNeeded/pageSize + (sizeNeeded % pageSize != 0); //I am assuming this value is going to be positive.
		numRequests += numPagesNeeded;
		
		//std::cout << "Size Demanded: " << size << " | lastFree size: " << lastFree.size << "\n";
		
		(*(candidate)).size += numPagesNeeded * pageSize;
		
		//std::cout << "Candidate new size: " << (*(candidate)).size << " | Pages Needed: " << numPagesNeeded << "\n";
		
		assert((*(candidate)).size >= size); // to make sure you allocated enough memory
		assert((*(candidate)).size - size < pageSize); // to make sure you didn't allocate more than you needed
		(*(candidate)).size -= size;
		//Create the new block.
		MemAlloc newAlloc{tag, size, (*(candidate)).address};
		
		//Ensure last block has highest address.
		(*(candidate)).address = newAlloc.address + newAlloc.size; //Worst case scenario, 1000000 * 1000000 size
		
		//std::cout << "Candidate final size: " << (*(candidate)).size << " | Pages size: " << pageSize << "\n";
		assert((*(candidate)).size < pageSize); // to make sure you didn't allocate more than you needed
		//Give the set a new pointer.
		//Reinsert our last block.
		freeBlocks.insert(candidate);
		//std::cout << "More memory allocated.\n";
		//Insert the last block.
		allocations.insert(candidate, newAlloc);
		taggedBlocks[tag].push_back((--candidate)); //Add pointer to inserted block for tagged blocks.
	}
	//If the size is exact, we just change the slot directly.
	else if (((*candidate).size == size) && (candidate != (--allocations.end()))) {
		//Remove the candidate from the list of free blocks, as it is no longer availiable.
		std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(candidate);
		freeBlocks.erase(retVal);
		
		//Do stuff
		(*candidate).tag = tag;
		taggedBlocks[tag].push_back(candidate);
	}
	//We have to split the block into two.
	else {
		MemAlloc newAlloc{tag, size, (*(candidate)).address};
		
		//Get rid of the old set position for the empty block we're shoving crap into.
		std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(candidate);
		freeBlocks.erase(retVal);
		(*(candidate)).address = newAlloc.address + newAlloc.size; //Increment candidate address.
		
		(*candidate).size -= size;
		//Push the addresses of anything it comes into conflict with.
		
		//Insert the new candidat result.
		freeBlocks.insert(candidate);
		
		allocations.insert(candidate, newAlloc);
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
  //Scans the list, finds the largest free trunk.
  long getLargestFreeChunk() {
	  long biggest = 0;
	  for (MemAlloc allocation:allocations) {
		  //std::cout << "Checking allocation";
		  if ((allocation.size > biggest) && (allocation.tag == FREE))
			  biggest = allocation.size;
	  }
	  return biggest;
  }
  //Debug function, prints the program's current state.
  void printState() {
	  std::cout << "----------------------------------------------\n";
	  for (MemAlloc allocation:allocations) {
		  std::cout << "Tag: " << allocation.tag << " | Value: " << allocation.size << " | Address: " << allocation.address << "\n";
	  }
	  std::cout << "----------------------------------------------\n";
  }
  //Debug program, prints the current free blocks.
  void printFreeBlocks() {
	  std::cout << "----------------------------------------------\n";
	  for (std::list<MemAlloc>::iterator block:freeBlocks) {
		  //if ((*block).tag != FREE) {
			  std::cout << "Tag: " << (*block).tag << " | Value: " << (*block).size << " | Address: " << (*block).address << "\n";
		  //}
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
  //long numIter = 0;
  //#define MAXITER 2000
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
	//system("read"); //Todo: Press any key to continue. Need a way to wait for an input... But that's not doable... Standard input got hijacked.
	//std::cout << "Current operation: " << n1 << " | " << n2 << "\n";
	//std::cout << "Current iteration: " << numIter << "\n";
	//ms.printFreeBlocks();
	//if (numIter > MAXITER) {
	//	break;
	//}
	//numIter++;
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

