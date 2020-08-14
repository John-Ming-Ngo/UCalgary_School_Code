#include <stdio.h>
#include <ctype.h>
#include <vector>
#include <string>
#include <cassert>
#include <unordered_map>
#include <set>
#include <list>
#include <iostream>

/**
Notes: 1. Set insert is O(log(n)), consider switching to unordered set which has insert of O(1), for C++11 and above.

Notes: Currently taking 1min5seconds on 10000 entries. Not good. Need to cut this down, heavily.
*/

typedef std::vector<std::string> vs_t;

enum Edge {
  Allocation, Request
};

// split string p_line into vector of strings (words)
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

// read in a line from stdin and parse it
// parsed results are passed back via parameter references
// return true on success, false on EOF
// aborts program on bad input (should throw exception)
bool
parseLine( std::string & proc_name, std::string & res_name, Edge & etype)
{
  char buff[4096];
  vs_t words;

  // read in a line and parse it into words
  while(1) { // loop to skip empty lines
    if( ! fgets( buff, sizeof(buff), stdin))
      return false;
    words = split(buff);
    if( words.size() != 0) break;
  }

  if( words.size() != 3) {
    printf("Bad line: %s\n", buff);
    exit( -1); // exception would be nicer
  }

  proc_name = words[0];
  res_name = words[2];
  etype = Edge::Request;

  if( words[1] == "->") {
    return true;
  }
  if( words[1] == "<-") {
    etype = Edge::Allocation;
    return true;
  }

  printf("Bad line: %s\n", buff);
  exit( -1); // exception would be nicer
};

// utility class you can use to convert words to unique integers
// get(word) returns the same number given the same word
//           the numbers will start at 0, then 1, 2, ...
//
// example:
//   Word2Int w2i
//   w2i.get("hello") = 0
//   w2i.get("world") = 1
//   w2i.get("hello") = 0
//
// HINT: this "may" help you get a bit more performance
// in your cycle finding algorithm, since indexed arrays are faster
// than hash tables... if you don't know what that means,
// safely ignore this hint :)
struct Word2Int {
  int
  get(const std::string & w) {
    auto f = myset.find(w);
    if( f == myset.end()) {
      myset[w] = counter;
	  mysetBack[counter] = w; //Easy hashtable for the backwards.
      counter ++;
      return counter - 1;
    }
    return f-> second;
  }
  std::string getString(int id) {
	auto f = mysetBack.find(id);
    if( f == mysetBack.end()) {
		return NULL;
	}
	return f->second;
  }
 private:
  int counter = 0;
  std::unordered_map<std::string,int> myset;
  std::unordered_map<int,std::string> mysetBack;
};

/**
std::string * strArray(std::unordered_map<std::string, int> input) {
	int mapSize = input.size();
	std::string
}
*/

struct Graph {

  // add your own members here
  // ...
  Word2Int namer;
  vs_t deadlockedProcesses;
  vs_t deadlockedEdges;
  //  std::unordered_map<std::string, vs_t> adj_list;
  std::unordered_map<std::string, std::list<std::string>> adj_list;
  std::unordered_map<std::string, int> out_counts;
  std::set<std::string> all_nodes;
  
  Graph() {
    // reimplement this (probably)
  }

  // add edge n1 -> n2
  void
  add( std::string n1 , std::string n2) {
    // reimplement this
    all_nodes.insert(n1);
    all_nodes.insert(n2);
    adj_list[n2].push_back(n1);
    out_counts[n1] ++;
  }
  
  /** Error, returns local variable. Don't like this problem.
  int * getArrayCounts() {
	int myArray[all_nodes.size()];
	int currentElement;
	for (const auto& elem:all_nodes) {
		currentElement = namer.get(elem);
		myArray[currentElement] = out_counts[elem];
	}
	return myArray;
  }
  */
  
  // run cycle detection
  //Current problem: Make more efficient? Using namer and arrays?
  /**
  This function finds deadlocks as quickly as posisble, without frills. For more information, a more involved function is required.
  
  ==> It works, but not fast enough. 1min 5 seconds is not good.
  */
  bool
  deadlock() {
	//Get a local copy of the graph data. Todo idea: instead of getting a copy of the number of nodes which point to it, we get an array of the same.
	std::unordered_map<std::string, int> out_counts_copy(out_counts);
	//Vector list which records all zeroes in the graph currently under consideration. Todo: Consider more efficient data structure? Test if vectors are better/worse.
	std::list<std::string> zeroList = {};
    //Find all zeroes in graph, and add it to the list. O(V).
	for( const auto & e : all_nodes) {
      if(out_counts_copy[e] == 0) {
		  zeroList.push_back(e);
	  }
    }
	//For each zero in graph, reduce count of all things that touch it. No need to actually remove. O(E), I hope. Check this.
	while (zeroList.size() > 0) {
		//Get the last item, then pop it.
		std::string currentItem = zeroList.back();
		zeroList.pop_back();
		//Attain a list of all items which point to it.
		std::list<std::string> pointsToCurrent = adj_list[currentItem];
		for (std::string name:pointsToCurrent) {
			int currentCount = -1;
			
			//TODO: This part can obviously be optimized. Consider removing the auto and the if; if that doesn't work, we're just going to need to try to gun for arrays. But... out_counts_copy[name] = out_counts_copy[name]--; is the obvious path.
			auto search = out_counts_copy.find(name);
			if (search != out_counts_copy.end()) {
				currentCount = search->second;
			}
			currentCount--;
			out_counts_copy[name] = currentCount;
			//Todo, possible optimization: Remove 0 entries from out_counts_copy. We can then do a size check as opposed to another for loop?
			if (currentCount == 0) {
				zeroList.push_back(name); //If nothing points to it now, add it to the list of zeroes. If it's negative, it's either already accounted for or not valid.
			}
		}
	}
	//Check if there are any edges left. If so, return true; there is a deadlock. O(V)
	for( const auto & e : out_counts_copy) {
	  //std::cout << "Current vertex: " << e.first << " Believed Count: " << e.second << "\n";
      if(e.second > 0)
        return true;
    }
    return false;
  }
  
  //TODO: NOT DONE! There feels like there has to be a better way...
  void setDeadlockData() {
	//Get a local copy of the graph data. Todo idea: instead of getting a copy of the number of nodes which point to it, we get an array of the same.
	std::unordered_map<std::string, std::list<std::string>> adj_list_copy(adj_list);
	std::unordered_map<std::string, int> out_counts_copy(out_counts);
	//Vector list which records all zeroes in the graph currently under consideration.
	std::list<std::string> zeroList = {};
    //Find all zeroes in graph, and add it to the list. O(n) in vertexes.
	for( const auto & e : all_nodes) {
      if(out_counts_copy[e] == 0) {
		  zeroList.push_back(e);
	  }
    }
	//For each zero in graph, reduce count of all things that touch it. No need to actually remove.
	while (zeroList.size() > 0) {
		//Get the last item, then pop it.
		std::string currentItem = zeroList.back();
		zeroList.pop_back();
		//Attain a list of all items which point to it. Remove the relevant edge.
		std::list<std::string> pointsToCurrent = adj_list[currentItem];
		for (std::string name:pointsToCurrent) {
			int currentCount = -1;
			auto search = out_counts_copy.find(name);
			if (search != out_counts_copy.end()) {
				currentCount = search->second;
			}
			currentCount--;
			out_counts_copy[name] = currentCount;
			if (currentCount == 0) {
				zeroList.push_back(name); //If nothing points to it now, add it to the list of zeroes. If it's negative, it's either already accounted for or not valid.
			}
		}
	}
	//Check if there are any edges left. If so, return true; there is a deadlock.
	for( const auto & e : out_counts_copy) {
	  //std::cout << "Current vertex: " << e.first << " Believed Count: " << e.second << "\n";
      //if(e.second > 0)
        //Need to do something.
    }
  }
  
  // report cycle
  void
  report() {
    // reimplement this
	
	/** //Turn on for debug.
    printf("Outdegrees + adjacency list (reversed) looks like this:\n");
	
    for( const std::string & n : all_nodes) {
      printf("%10s (%2d) : ", n.c_str(), out_counts[n]);
      for( const auto & s : adj_list[n]) {
        printf("%s , ", s.c_str());
      }
      printf("\n");
    }
	*/
	
	if (deadlock()) {
		setDeadlockData();
		
		std::cout << "Deadlock on edges: ";
		//std::cout << ;
		std::cout << "\n";
		
		std::cout << "Deadlock on processes: ";
		//std::cout << ;
		std::cout << "\n";
	}
	else {
		std::cout << "No deadlock.\n";
	}
  }
};

int
main()
{
  
  Graph g;
  
  while(true) {
    std::string pname, rname;
    Edge e;
    if( ! parseLine(pname, rname, e)) break;

    if( e == Edge::Request)
      g.add( "p_" + pname, "r_" + rname);
    else
      g.add( "r_" + rname, "p_" + pname);

    if( g.deadlock()) {
		std::cout << "Deadlock Detected.\n";
		break;
	}
  }

  g.report();
  
  return 0;
}


