#include <string>
#include <vector>
#include <iostream>
#include <functional>

#include "AST.h"

//Based off how Niran did this.
bool pre_post_traversal	(ASTNode* node
			, std::function<bool(ASTNode*)> pre
			, std::function<void(ASTNode*)> post) {
	if(!pre(node)) 
		return false;

	for(auto* c : node->children) {
		if(!pre_post_traversal(c, pre, post))
			return false;
	}

	post(node);
	return true;
}


// implement other traversals in terms of more general traversal
bool pre_traversal(ASTNode* node, std::function<bool(ASTNode*)> const& pre) {
	return pre_post_traversal(node, pre, [](auto*) {});
}

void post_traversal(ASTNode* node, std::function<void(ASTNode*)> const& post) {
	pre_post_traversal(node, [](auto*) { return true; }, post);
}

bool pre_post_traversal_wStr(ASTNode* node, std::string inputString, std::function<bool(std::string, ASTNode*)> pre, std::function<void(ASTNode*)> const& post) {
	if(!pre(inputString, node)) 
		return false;

	for(auto* c : node->children) {
		if(!pre_post_traversal_wStr(c, inputString, pre, post))
			return false;
	}
	post(node);
	return true;
}