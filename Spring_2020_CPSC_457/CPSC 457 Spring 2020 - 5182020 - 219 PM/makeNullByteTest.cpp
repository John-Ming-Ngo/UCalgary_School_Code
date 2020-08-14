#include <memory>
#include <string>
#include <vector>
#include <sstream>
#include <cassert>
#include <tuple>
#include <iostream>
#include <fstream>
int main(int argc, char** argv) {
	//Divert the code into its own output file.
	std::string outputFileName = "nullTest.txt";
	std::ofstream outputFileStream(outputFileName, std::ofstream::out);
	outputFileStream << "abcd \0\0 ana\0 something" << "\n";
	
	return 0;
}