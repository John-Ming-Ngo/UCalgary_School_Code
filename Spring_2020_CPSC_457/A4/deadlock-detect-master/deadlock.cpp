#include <stdio.h>
#include <ctype.h>
#include <vector>
#include <string>
#include <cassert>
#include <unordered_map>
#include <set>
#include <list>
#include <iostream>
#include <algorithm>
#include <iterator>

/**
Given input as specified in the assignment, find and report on deadlocks.
John Ming Ngo, 30020834
*/

//Code is prof's code unless I labelled it.
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
	//John Ming Ngo, function to handle adding new entries to the struct's data structures.
	void add(const std::string & w)  {
		myset[w] = counter;
		mysetBack[counter] = w; //Easy hashtable for the backwards.
		counter++;
	}
  int
  get(const std::string & w) {
    auto f = myset.find(w);
    if( f == myset.end()) {
      add(w);
      return counter - 1;
    }
    return f-> second;
  }
  //John Ming Ngo, returns the string corresponding to its integer ID.
  std::string getString(int id) {
	auto f = mysetBack.find(id);
    if( f == mysetBack.end()) {
		return NULL;
	}
	return f->second;
  }
  //John Ming Ngo, returns its size.
  int size() {
	  return counter;
  }
 private:
  int counter = 0;
  std::unordered_map<std::string,int> myset;
  //Second hash table for operational efficiency sake. John Ming Ngo.
  std::unordered_map<int,std::string> mysetBack;
};

//Prints comma separated list. Quick, dirty, ugly code.
void printList(std::list<std::string> inputList) {
	bool first = true;
	for (const std::string & value:inputList) {
		if (first) {
			std::cout << value;
			first = false;
			continue;
		}
		std::cout << ", " << value;
	}
}

//A safe constant number given the premise. Meant for the size of the integer arrays. John Ming Ngo. May feel slightly like a copout, but I am using the 10000 edges assumption, which puts an upper bound of 20000 vertexes, and then I added 1000 just to be on the safe side. Should the number of edges exceed 10000, this MAX value might be too low, leading to wrong results or crashes! But luckily, we are explicitly allowed to assume it. 
#define MAX 21000
struct Graph {

  //For translating names into integers for the fast algorithm. John Ming Ngo, 30020834
  Word2Int namer;
  //For array form. John Ming Ngo, 30020834
  int out_counts_arr[MAX];
  std::unordered_map<int, std::list<int>> adj_list_int;
  
  //For report. John Ming Ngo, 30020834
  std::string lastEntry;
  
  //Original data structure;
  std::unordered_map<std::string, std::list<std::string>> adj_list;
  std::unordered_map<std::string, int> out_counts;
  std::set<std::string> all_nodes;
  
  Graph() {} //Nothing needs to change.

  // add edge n1 -> n2
  void
  add( std::string n1 , std::string n2) {
    // reimplement this
    all_nodes.insert(n1);
    all_nodes.insert(n2);
    adj_list[n2].push_back(n1);
    out_counts[n1] ++;
	
	//For the integer representation format. John Ming Ngo, 30020834
	int name1 = namer.get(n1);
	int name2 = namer.get(n2); 
	adj_list_int[name2].push_back(name1);
	out_counts_arr[name1]++;
	
	//Identify last entry. John Ming Ngo, 30020834
	std::string strName1(n1);
	std::string strName2(n2);
	strName1.erase(0, 2);
	strName2.erase(0, 2);
	std::string rightArrow = " -> ";
	std::string leftArrow = " <- ";
	if (n1.at(0) == 'p') {
		lastEntry = strName1 + rightArrow + strName2;
	}
	else {
		lastEntry = strName2 + leftArrow + strName1;
	}
  }
  
  //Array based implementation of the deadlock algorithm. John Ming Ngo, 30020834
  //Holy crap this is insanely faster. I guess iterating through advanced data structures just takes forever.
  bool deadlock() {
	//Get a local copy of the graph data.
	int out_counts_arr_copy[MAX];
	std::copy(std::begin(out_counts_arr), std::end(out_counts_arr), std::begin(out_counts_arr_copy));
	int numVertexes = namer.size();
	//List which records all zeroes in the graph currently under consideration. 
	std::list<int> zeroList = {};
	//Find all zeroes in graph, and add it to the list. O(V). Todo: Optimize this??? O(V) is actually the bigger problem?
	for(int i = 0; i < numVertexes; i++) {
      if(out_counts_arr_copy[i] == 0) {
		  zeroList.push_back(i);
	  }
    }
	//For each zero in graph, reduce count of all things that touch it. No need to actually remove. O(E), I hope. Check this.
	while (zeroList.size() > 0) {
		//Attain a list of all items which point to it.
		std::list<int> pointsToCurrent = adj_list_int[zeroList.back()];
		zeroList.pop_back();
		for (int name:pointsToCurrent) {
			out_counts_arr_copy[name]--;
			if (out_counts_arr_copy[name] == 0) {
				zeroList.push_back(name); //If nothing points to it now, add it to the list of zeroes. If it's negative, it's either already accounted for or not valid.
			}
		}
	}
	//Check if there are any edges left. If so, return true; there is a deadlock. O(V)
	for(int i = 0; i < numVertexes; i++) {
      if(out_counts_arr_copy[i] > 0) {
		  return true;
	  }
	}
    return false;
  }
  
  //This function returns the actual data, as opposed to merely telling you if a deadlock happened.
  std::list<std::string> deadlockData() {
	//Get a local copy of the graph data.
	int out_counts_arr_copy[MAX];
	std::copy(std::begin(out_counts_arr), std::end(out_counts_arr), std::begin(out_counts_arr_copy));
	int numVertexes = namer.size();
	std::unordered_map<int, std::list<int>> adj_list_int_copy(adj_list_int);
	//List which records all zeroes in the graph currently under consideration. 
	std::list<int> zeroList = {};
	//Find all zeroes in graph, and add it to the list. O(V). Todo: Optimize this??? O(V) is actually the bigger problem?
	for(int i = 0; i < numVertexes; i++) {
      if(out_counts_arr_copy[i] == 0) {
		  zeroList.push_back(i);
	  }
    }
	//For each zero in graph, reduce count of all things that touch it. No need to actually remove. O(E), I hope. Check this.
	int remainingElements = zeroList.size();
	while (remainingElements > 0) {
		//Attain a list of all items which point to it.
		//std::cout << "Current Consideration: " << namer.getString(zeroList.back()) << "\n";
		std::list<int> pointsToCurrent = adj_list_int_copy[zeroList.back()];
		//std::cout << "Number of elements: " << pointsToCurrent.size() << "\n";
		zeroList.pop_back();
		for (int name:pointsToCurrent) {
			out_counts_arr_copy[name]--;
			if (out_counts_arr_copy[name] == 0) {
				zeroList.push_back(name); 
				//std::cout << "Zeroed: " << namer.getString(name) << "\n";
				//If nothing points to it now, add it to the list of zeroes. If it's negative, it's either already accounted for or not valid.
			}
		}
		remainingElements = zeroList.size();
	}
	
	//Alright, now I should have an adj list containing the only remaining processes and edges. I just need to record them, package them up, and return it.
	std::list<std::string> remainingProcesses;
	
	//Get all remaining processes.
	for(int i = 0; i < numVertexes; i++) {
      if (out_counts_arr_copy[i] > 0) {
		  std::string processOrResource = namer.getString(i);
		  if (processOrResource.at(0) == 'p') {
			  processOrResource.erase(0, 2);
			  remainingProcesses.push_back(processOrResource);
		  }
	  }
    }
	
	return remainingProcesses;
  }
  
  /**
  This function finds deadlocks as quickly as posisble, without frills. For more information, a more involved function is required.
  By: John Ming Ngo, 30020834
  ==> This function utilizes significantly slower data structures than the integerized edition above.
  */
  
  /**
  bool
  deadlock() {
	//Get a local copy of the graph data.
	std::unordered_map<std::string, int> out_counts_copy(out_counts);
	
	//List which records all zeroes in the graph currently under consideration. 
	std::list<std::string> zeroList = {};
	
    //Find all zeroes in graph, and add it to the list. O(V). Todo: Optimize this??? O(V) is actually the bigger problem?
	for( const auto & e : all_nodes) {
      if(out_counts_copy[e] == 0) {
		  zeroList.push_back(e);
		  out_counts_copy.erase(e);
	  }
    }
	
	//For each zero in graph, reduce count of all things that touch it. No need to actually remove. O(E), I hope. Check this.
	while (zeroList.size() > 0) {
		//Attain a list of all items which point to it.
		std::list<std::string> pointsToCurrent = adj_list[zeroList.back()];
		zeroList.pop_back();
		for (std::string name:pointsToCurrent) {
			out_counts_copy[name]--;
			if (out_counts_copy[name] == 0) {
				zeroList.push_back(name); //If nothing points to it now, add it to the list of zeroes. If it's negative, it's either already accounted for or not valid.
				out_counts_copy.erase(name);
			}
		}
	}
	//Check if there are any edges left. If so, return true; there is a deadlock. O(V)
	if (out_counts_copy.size() > 0) return true;
    return false;
  }
  */
  
  /**
  Report Cycle - John Ming Ngo, 30020834
  */
  void
  report() {
	
	/**
	//Turn on for debug.
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
		std::list<std::string> remainingProcesses = deadlockData();
		
		std::cout << "Deadlock on edge: ";
		std::cout << lastEntry;
		std::cout << "\n";
		
		std::cout << "Deadlocked Processes: ";
		printList(remainingProcesses);
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
    if(!parseLine(pname, rname, e)) break;

    if( e == Edge::Request)
      g.add( "p_" + pname, "r_" + rname);
    else
      g.add( "r_" + rname, "p_" + pname);

    if(g.deadlock()) {
		//std::cout << "Deadlock Detected.\n";
		break;
	}
  }

  g.report();
  
  return 0;
}


