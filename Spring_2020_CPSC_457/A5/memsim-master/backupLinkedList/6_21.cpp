#include <stdio.h>
#include <string>
#include <vector>
#include <cassert>
#include <list>
#include <iostream>
#include <unordered_map>
#include <set>

/**
Was: Corrupting tree by failing to tell it to remove and reinsert. That was a horrible problem, 7+ hours right there.
Now: Getting wrong values for the big tests. Need to find out why; similar thing happened for the vector implementation.
==> Program completely correct up to 120 iterations... the f is going on?
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
	long address;
};

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
struct MemSim {
  private:
	long pageSize;
	long numRequests;
	long address = 0; //Use this to increment the address of inserted blocks...
	
	std::list<MemAlloc> allocations;
	std::set<std::list<MemAlloc>::iterator,BySizeAndAddress> freeBlocks; //Free blocks sorted by size/address.
	std::unordered_map<long, std::vector<std::list<MemAlloc>::iterator>> taggedBlocks;
	
  public:
  // initializes the memory simulator with a page size
  MemSim( long page_size) {
    pageSize = page_size;
	numRequests = 0;
	address = 1;
	MemAlloc initial_alloc = {FREE, 0, address};
	address++;
	allocations.push_back(initial_alloc);
	freeBlocks.insert(allocations.begin());
  }
  
  // frees all blocks with the given tag and merges adjecent free blocks.
  void free(long tag) {
	//Deallocate
    for (std::list<MemAlloc>::iterator it1:taggedBlocks[tag]) {
		//std::cout << "Iteration:\n";
		//printState();
		//Mark current chunk as free.
		(*it1).tag = FREE;
		//Need to do the merge. How does this work? Aaack.
		std::list<MemAlloc>::iterator left = it1;
		left--;
		if ((it1 != allocations.begin()) && ((*left).tag == FREE)) {
			(*it1).size += (*left).size;
			std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(left);
			freeBlocks.erase(retVal);
			allocations.erase((*retVal));
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
		
		//Insert current chunk into the list of free allocations.
		freeBlocks.insert(it1);
	}
	taggedBlocks[tag].clear();  //Forgot about this, in case we delete the same tag repeatedly.
  }
  
  // allocates a chunk using best-fit
  // if no suitable chunk found, requests new page(s)
  void alloc( long tag, long size) {
	//std::cout<< "New Allocation.\n";
	
	std::list<MemAlloc> testList = {{FREE, size, -100}}; //Dummy block
	std::set<std::list<MemAlloc>::iterator>::iterator findMatch = freeBlocks.lower_bound((testList.begin()));
	std::list<MemAlloc>::iterator candidate = allocations.end();

	if (findMatch != freeBlocks.end()) { //TODO: This executes more often than it should, find out why!
		candidate = (*findMatch);
	}
	
	if (candidate == allocations.end()) { //Need to allocate more memory. Todo: This is being called more often than it should be, allocating more pages than are needed. Find out why.
		candidate = (--allocations.end());
		//Get rid of the set's old pointer.
		std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(candidate);
		freeBlocks.erase(retVal);
		//Adjust the candidate block.
		MemAlloc lastFree = *(candidate);
		long sizeNeeded = size - lastFree.size;
		
		long numPagesNeeded = sizeNeeded/pageSize + (sizeNeeded % pageSize != 0); //I am assuming this value is going to be positive.
		numRequests += numPagesNeeded;
		(*(candidate)).size += numPagesNeeded * pageSize;
		//Give the set a new pointer.
		freeBlocks.insert(candidate);
		//std::cout << "More memory allocated.\n";
	}
	
	if (((*candidate).size == size) && (candidate != (--allocations.end()))) {// TODO Experiment: What if we allowed candidate == --Allocations.end?
		//Remove the candidate from the list of free blocks, as it is no longer availiable.
		std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(candidate);
		freeBlocks.erase(retVal);
		
		//Do stuff
		(*candidate).tag = tag;
		taggedBlocks[tag].push_back(candidate);
	}
	else {
		MemAlloc newAlloc{tag, size, address};
		address++; //Increment for next person, address 0 is reserved for new inserts.
		
		//Get rid of the old set position for the empty block we're shoving crap into.
		std::set<std::list<MemAlloc>::iterator>::const_iterator retVal = freeBlocks.lower_bound(candidate);
		freeBlocks.erase(retVal);
		
		(*candidate).size -= size;
		
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
		  std::cout << "Tag: " << allocation.tag << " | Value: " << allocation.size << "\n";
	  }
	  std::cout << "----------------------------------------------\n";
  }
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
	//ms.printFreeBlocks();
	//std::cout << "Current operation: " << n1 << " | " << n2 << "\n";
	//if (numIter > MAXITER) {
	//	break;
	//}
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

