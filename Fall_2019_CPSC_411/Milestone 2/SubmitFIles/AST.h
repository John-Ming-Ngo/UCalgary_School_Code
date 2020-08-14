#pragma once
#include <string>
#include <vector>
#include <iostream>

/*Abstract Syntax Tree Code*/
/*This code mostly by TA Niran. Added in namespace yy to make it work easily.*/

namespace yy {
struct ASTNode {
	std::string val;
	std::vector<ASTNode*> children;
};
}

using ASTNode = yy::ASTNode;
//These two functions print out the abstract syntax tree. RELATIVE TO THE EXAMPLE TEST CASES It prints out right to left branches!
inline void printAstNode (std::ostream& os, ASTNode const& node, int tabDepth){
	for(int i = 0; i < tabDepth; ++i)
		os << "|\t";

	os << "| " << node.val << "\n";
	
	for(auto* n : node.children) {
		printAstNode(os, *n, tabDepth + 1);
	}
}
inline std::ostream& operator<<(std::ostream& os, ASTNode const& node) {
	printAstNode(os, node, 0);
	return os;
}
