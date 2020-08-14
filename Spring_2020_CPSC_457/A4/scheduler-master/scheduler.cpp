#include <string>
#include <iostream>

#include <iostream>
#include <fstream>

#include <vector>
#include <list>
#include <utility>
#include <algorithm>    // std::min

/**
This takes in an input list of processes, the number of computations and their arrival times, and outputs the order by which the given scheduling algorithm handles it. John Ming Ngo, 30020834
*/

using namespace std;

//Prints comma separated list. Quick, dirty, ugly code. John Ming Ngo, 30020834
void printList(list<string> inputList) {
	bool first = true;
	for (const string & value:inputList) {
		if (first) {
			cout << value;
			first = false;
			continue;
		}
		cout << ", " << value;
	}
}

// split string p_line into vector of strings (words)
// the delimiters are 1 or more whitespaces. Prof. Federl's code.
vector<string> split( const std::string & p_line) {
	auto line = p_line + " ";
	vector<string> res;
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

//This function reads the input file into a string list of lines. John Ming Ngo, 30020834
list<string> readFile(string file) {
	
	list<string> result;
	
	fstream inputFile;
	inputFile.open(file, ios::in);
	if (inputFile.is_open()){
		string line;
		while(getline(inputFile, line)){
			result.push_back(line);	//TODO: Slightly worried that I'll be pushing in the same reference and the string keeps getting overwritten?	
		}
		inputFile.close();
	}
	else {
		std::cout << "Failed to open config file!\n";
		inputFile.close();
		exit(1);
	}
	
	return result;
}
//Data structure to handle tasks. John Ming Ngo, 30020834
struct task {
	string name;
	long long arrivalTime;
	long long taskLength;
};

//Process the lines into a data structure that can handle the process' name, arrival time, and task length. John Ming Ngo, 30020834
list<task> processTasks(list<string> lines) {
	long long processNumber = 0; //Start naming them from 0;
	list<task> result;
	
	for (const string & line:lines)	{
		//Split the string by whitespace.
		vector<string> arrivalAndLength = split(line);
		//Extract the arrival time and task length.
		std::string arrival = arrivalAndLength.at(0);
		std::string length = arrivalAndLength.at(1);
		
		long long arrivalTime = atoll(arrival.c_str());
		long long taskLength = atoll(length.c_str());
		//Name the task.
		string name = "P";
		name += to_string(processNumber);
		//Make the task, append it to the results.
		task newTask = {name, arrivalTime, taskLength};
		result.push_back(newTask);
		//Increment the process number
		processNumber++;
	}
	
	return result;
}

/**
Algorithm to program  (roughly):

curr_time = 0
jobs_remaining = size of job queue
while(1) {
    if jobs_remaining == 0 break
    if process in cpu is done
        mark process done
        set CPU idle
        jobs_remaining --
        continue
    if a new process arriving
        add new process to RQ
        continue
    if cpu is idle and RQ not empty
        move process from RQ to CPU
        continue
    execute one burst of job on CPU
    curr_time ++
}

*/

// Use this along with list sort to sort task lengths.
bool shorterTask(const task & task1, const task & task2) {
	return (task1.taskLength < task2.taskLength);
}
//Simulate round robin, John Ming Ngo, 30020834
list<string> RR_Sim(string input, long long burstLength) {
	task NOTASK{"NOTASK", 0, 0}; //Exploiting the fact that I will be naming all other tasks with P_ naming.
	
	list<task> tasks = processTasks(readFile(input));
	list<task> ongoingTasks;
	long long currentTime = 0;
	list<string> taskHistory;
	task currentTask = NOTASK;
	while ((tasks.size() > 0) || (ongoingTasks.size() > 0) || (currentTask.name != "NOTASK")) {
		if (currentTask.name == "NOTASK") { //Null only if there are no ongoing tasks!
			//Get arrival time of next task.
			long long nextArrivalTime = tasks.front().arrivalTime;
			//If arrival time is bigger than current time, record that the CPU was doing nothing.
			//If they're identical, then the CPU jumps to this task immediately, no need to record anything.
			if (currentTime < nextArrivalTime) {
				taskHistory.push_back("-");
			}
			//Remove next task from list of all tasks, set as current task.
			currentTask = tasks.front();
			tasks.pop_front();
			//Set current task to the first element of task history.
			currentTime = nextArrivalTime;
		}
		else  {
			long long currentTaskLength = currentTask.taskLength;
			long long nextTimeIncrement = min(currentTaskLength, burstLength);
			currentTime += nextTimeIncrement; //Increment the time counter.
			currentTask.taskLength -= nextTimeIncrement; //Decrement current task by how much we're going to do for it.
			//Add the next tasks, EXCEPT for that which arrives at the exact same time as the current time.
			while ((tasks.size() > 0) && (tasks.front().arrivalTime < currentTime)) {
				ongoingTasks.push_back(tasks.front());
				tasks.pop_front();
			}
			if (nextTimeIncrement != currentTaskLength) {//Task not completed, send it to the back of the queue.
				ongoingTasks.push_back(currentTask);
			}
			if ((tasks.size() > 0) && (tasks.front().arrivalTime <= currentTime)) {
				ongoingTasks.push_back(tasks.front());
				tasks.pop_front();
			}			
			//Replace completed task with new task. If no new task, set to NULL.
			if (ongoingTasks.size() <= 0) {
				taskHistory.push_back(currentTask.name);
				currentTask = NOTASK;
			}
			else {
				if (ongoingTasks.front().name != currentTask.name) { //Needed in the event that we have 1 task of 10000, burst 3, no other tasks, it's going to do itself repeatedly after each 'switch'.
					taskHistory.push_back(currentTask.name);
				}
				currentTask = ongoingTasks.front();
				ongoingTasks.pop_front();
			}
		}
	}
	return taskHistory;
}
//Simulate Shortest Job First, John Ming Ngo, 30020834
list<string> SJF_Sim(string input) {
	task NOTASK{"NOTASK", 0, 0};
	
	list<task> tasks = processTasks(readFile(input));
	list<task> ongoingTasks;
	long long currentTime = 0;
	list<string> taskHistory;
	task currentTask = NOTASK;
	while ((tasks.size() > 0) || (ongoingTasks.size() > 0) || (currentTask.name != "NOTASK")) {
		
		if (currentTask.name == "NOTASK") { //Null only if there are no ongoing tasks!
			//Get arrival time of next task.
			long long nextArrivalTime = tasks.front().arrivalTime;
			
			//cout << "Task Length: " << nextArrivalTime << "\n";
			
			//If arrival time is bigger than current time, record that the CPU was doing nothing.
			//If they're identical, then the CPU jumps to this task immediately, no need to record anything.
			if (currentTime < nextArrivalTime) {
				taskHistory.push_back("-");
			}
			//Remove next task from list of all tasks, set as current task.
			currentTask = tasks.front();
			tasks.pop_front();
			//Set current task to the first element of task history.
			currentTime = nextArrivalTime;
		}
		else  {
			//Finish the current task.
			currentTime += currentTask.taskLength;
			//Record that this current task was done.
			taskHistory.push_back(currentTask.name);
			//Add the next tasks
			while ((tasks.size() > 0) && (tasks.front().arrivalTime <= currentTime)) {
				ongoingTasks.push_back(tasks.front());
				tasks.pop_front();
			}
			ongoingTasks.sort(shorterTask);
			//Replace completed task with new task. If no new task, set to NULL.
			if (ongoingTasks.size() <= 0) {
				currentTask = NOTASK;
			}
			else {
				currentTask = ongoingTasks.front();
				ongoingTasks.pop_front();
			}
		}
		
		
	}
	return taskHistory;
}

int main( int argc, char ** argv) {
	string configFile;
	string schedulingType;
	//Input error checking. John Ming Ngo, 30020834
	if ((argc < 3) || (argc > 4)) {
		cout << "I require 2 to 3 inputs!\n";
		exit(-1);
	}
	configFile = argv[1];
	schedulingType = argv[2];
	if ((schedulingType == "SJF") && (argc == 4)) {
		cout << "SJF does not accept timeslice.\n";
		exit(-1);
	}
	//Execute the simulation and report on the results. John Ming Ngo, 30020834
	if (schedulingType == "SJF") {
		list<string> output = SJF_Sim(configFile);
		cout << "Seq: ";
		printList(output);
		cout << "\n";
	}
	else if (schedulingType == "RR") {
		long long burstLength = atoll(argv[3]); //TODO: MAKE SURE THAT THIS IS A NUMBER! IDIOT CAN SEND IN A CHAR OR STR!
		if (burstLength == 0) {
			cout << "Error! Burst length is 0, or it is incomprehensible!\n";
			exit(1);
		}
		list<string> output = RR_Sim(configFile, burstLength);
		cout << "Seq: ";
		printList(output);
		cout << "\n";
	}
	else {
		cout << "Correct number of arguments, but scheduling type is incomprehensible!\n";
		exit(-1);
	}
}