#pragma once
#include <string>
#include <vector>
#include <iostream>
#include <functional>

/*Abstract Syntax Tree Code*/
/*This code mostly by TA Niran. Added in namespace yy to make it work easily.*/

namespace yy {
struct ASTNode {
	std::string type;
	std::string val;
	int lineno;
	std::vector<ASTNode*> children;
};
}

using ASTNode = yy::ASTNode;
//These two functions print out the abstract syntax tree. RELATIVE TO THE EXAMPLE TEST CASES It prints out right to left branches!
inline void printAstNode (std::ostream& os, ASTNode const& node, int tabDepth){
	for(int i = 0; i < tabDepth; ++i)
		os << "|\t";

	os << "| " << node.type << "," << node.val << "\n";
	
	for(auto* n : node.children) {
		printAstNode(os, *n, tabDepth + 1);
	}
}

inline std::ostream& operator<<(std::ostream& os, ASTNode const& node){
	printAstNode(os, node, 0);
	return os;
}

//Based off how Niran did this.
bool pre_post_traversal	(ASTNode* node
			, std::function<bool(ASTNode*)> pre
			, std::function<void(ASTNode*)> post);
			
// implement other traversals in terms of more general traversal
bool pre_traversal(ASTNode* node, std::function<bool(ASTNode*)> const& pre);

void post_traversal(ASTNode* node, std::function<void(ASTNode*)> const& post);

bool pre_post_traversal_wStr(ASTNode* node, std::string inputString, std::function<bool(std::string, ASTNode*)> pre, std::function<void(ASTNode*)> const& post);