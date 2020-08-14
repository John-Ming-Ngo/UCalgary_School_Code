#include "Driver.h"
#include <iostream>
#include <fstream>

/*This code mostly by TA NIran*/
namespace yy {
ASTNode* Driver::parse(std::istream* is) {
	m_ast = nullptr;
	m_lexer = std::make_unique<CPPLexer>(is);
	m_parser = std::make_unique<Parser>(*this);
	m_parser->parse();
	return m_ast;
}
}

/*Main Function: I made my own modifications*/
/*My modifications: Cannibalized scanner main function code to:*/
/*1. Verify file is opened. 2. Print opening file errors to Cerr*/
/*FInally, then I used his code to print out the abstract syntax tree and parse.*/
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
	
	yy::Driver driver{};
	
	std::cout << "Driver initialized\n";
	
	if (auto* ast = driver.parse(&inputFile)) {
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