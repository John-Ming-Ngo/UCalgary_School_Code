#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <unordered_map>
#include <list>

#include <iostream>

/**
John Ming Ngo, 30020834

Finds relevant attributes of a FAT file system.
*/

//Meant to hold the value pointed to, as well as the depth level it represents.
struct NextChild{
	long next;
	long depth;
};

//Returns the longest depth, and increments the number of blocks visited. Stack based implementation.
long depthSum(std::unordered_map<long, std::list<long>> adjList, long & numVisited, long searchStart) {
	
	std::list<long> children = adjList[searchStart];
	if (children.size() == 0) return 0; //There isn't anything past this node.
	
	std::list<NextChild> stack; 
	long longestBlock = 0;
	for (long child:children) {
		NextChild newNext{child, 1};
		stack.push_front(newNext);
	}
	//Stack implementation of recursive algorithm; the goal being to find the longest depth of the tree. The good news is, this tree never has a loop that can be accessed from a -1 terminating condition!
	while (stack.size() > 0) {
		NextChild next = stack.front();
		stack.pop_front();
		
		std::list<long> nextChildren = adjList[next.next];
		for (long child:nextChildren) {
			NextChild newNext{child, next.depth + 1};
			stack.push_front(newNext);
		}
		
		if (next.depth > longestBlock)
			longestBlock = next.depth;
		
		numVisited++;
	}
	return longestBlock;
}


/** Recursive implementation. It runs too slowly due to stack depth problems.
long depthSum(std::unordered_map<long, std::list<long>> adjList, long & numVisited, long searchStart) {
	
	numVisited += 1; //The terminating node doesn't count as a data node! User needs to account for this.
	
	std::list<long> children = adjList[searchStart];
	if (children.size() == 0) return 1; //This is the end.
	
	long maxSearch = -1;
	long candidateVal = 0;
	for (long child:children) {
		candidateVal = depthSum(adjList, numVisited, child);
		if (candidateVal > maxSearch) 
			maxSearch = candidateVal;
		//std::cout << maxSearch << "\n";
	}
	return (maxSearch + 1);
}
*/

void
fatsim(
    const std::vector<long> fat,
    long & longest_file_blocks,
    long & unused_blocks
       )
{
  //Convert to a backwards adjacency list. We are going to exploit that this is a graph where there is at most 1 edge per vertex.
  std::unordered_map<long, std::list<long>> adjBack;
  for (long unsigned i = 0; i < fat.size(); i++) {
	  adjBack[fat[i]].push_back(i);
  }
  
  long usedBlocks = 0;
  longest_file_blocks = depthSum(adjBack, usedBlocks, -1); //-1 is where it terminates
  unused_blocks = fat.size() - usedBlocks; //Used blocks is modified by depthsum.
}

int
main( int argc, char **)
{
  if( argc != 1) {
    printf("Thanks for all the command line arguments.\n"
           "But I don't like any of them... Bye.\n");
    exit(-1);
  }

  std::vector<long> fat;
  long maxnum = 0;
  while ( 1) {
    long num;
    if( 1 != scanf("%ld", & num)) break;
    if( num < -1) {
      printf("I don't like your FAT, it's too negative.\n");
      exit(-1);
    }
    maxnum = std::max( maxnum, num);
    fat.push_back(num);
  }

  if( long(fat.size()) <= maxnum) {
    printf("Some of your FATs are too big.\n");
    exit(-1);
  }

  long count1, count2;
  fatsim( fat, count1, count2);
  printf("blocks in largest file: %ld\n", count1);
  printf("blocks not in any file: %ld\n", count2);

  return 0;
}
