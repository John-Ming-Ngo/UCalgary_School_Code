#include <iostream>
#include <fstream>
#include "Driver.h"
#include "checkerCode.h"
/*Main function for the compiler as a whole*/
/*This main function proceeds in steps*/
/*If you're looking for lexer information, look at Scanner_30020834.l*/
/*If you're here for the parser, Parser_30020834.yy*/
/*If you're here for the semantic checker functions, look up checkerCode.cpp*/
int main(int argc, char** argv) {
	//Make sure it only takes in one argument
	if(argc != 2) {
		std::cerr << "Error! More or less arguments than 2! \n";
		return 1;
		}
		
	//Open the filestream
	std::ifstream inputFile;
	inputFile.open(argv[1]);
	
	//If it failed to open, terminate
	if(!inputFile.is_open()) {
		std::cerr << "Error! File could not be opened! Check permissions! \n";
		return 1;
		}
	std::cout << "------------------------------------------------ \n";
	std::cout << "Files Successfully Opened.\n";
	std::cout << "Input File Name: " << argv[1] << "\n";
	
	//Driver initiated. 
	yy::Driver driver{};
	std::cout << "Driver initialized\n";
	
	//What to do if the driver is initiated.
	auto* ast = driver.parse(&inputFile);
	
	//Test the AST now:
	std::cout << "------------------------------------------------ \n";
	std::cout << "Semantic Checker Errors (If any): \n";
	
	symTabPredef();
	symTabGlobals(ast);
	scopeCheckTest(ast);
	typeCheckTest(ast);
	simpleTest(ast);
	
	std::cout << "------------------------------------------------ \n";
	
	//Print out the AST if it passes the tests.
	if (ast) {
		std::cout << "Success\n";
		std::cout << *ast << "\n";
		std::cout << "------------------------------------------------ \n";

	} else {
		std::cerr << "------------------------------------------------ \n";
		std::cerr << "Failed parsing\n";
		std::cerr << "Reason: Not syntax error or parse error. Something is strange with the file itself\n";
		std::cerr << "Possibly it has no tokens to parse?\n";
		std::cerr << "------------------------------------------------ \n";
		return 1;
	}
	
	return 0;
}