#include <memory>
#include <string>
#include <vector>
#include <iostream>
#include "Symbol_Table_30020834.h"
#include "AST.h"

/**
Welcome. This is the semantic checker for the parser, by John Ming Ngo, 30020834

It's organized into the following sections:

1) build globals
2) proper variable scoping
3) type checking
4) everything else

And it solves these problems:

--No main declaration found.
--Multiple main declarations found.

--The main declaration can't have parameters. //Handeld by the Parser
--Break statements must be inside a while statement. //How would I implement this in a loop? Odd.
--No return statement in a non-void function.
--A void function can't return a value.
--A non-void function must return a value.
- A local declaration was not in an outermost block. 
- An identifier is redefined within the same scope.
- The number/type of arguments in a function call doesn't match the function's declaration.
- An undeclared identifier is used.
- An if- or while-condition must be of Boolean type.
-A value returned from a function has the wrong type. 
-Type mismatch for an operator (||, &&, ==, !=, =, <, >, <=, >=, +, - (unary and binary), *, /, %, !).
- The main function can't be called. ==> If it is called; error out. ==> PUT MAIN FUNCTION IN SYMBOL TABLE; CHECK IF IT IS EVER CALLED.
*/

//These globals - the most important part is the symtab itself.
struct {
	int countMain = 0;
	int loopLevel = 0;
	int scopeLevel = 0;
	int returnSighted = 0;
	symbol_table symtab;
} analysisGlobals;

//0TH CYCLE: BUILDING PRE-DEFINED FUNCTIONS
bool symTabPredef() {
	analysisGlobals.symtab.push_scope();
	analysisGlobals.scopeLevel = 0;
	analysisGlobals.loopLevel = 0;
	analysisGlobals.countMain = 0;	
	DeclData getchar{"FUNCTION", "getchar", 0, "TYPE_INT", {}};
	analysisGlobals.symtab.insert("FUNC_getchar", getchar);
	DeclData halt{"FUNCTION", "halt", 0, "TYPE_VOID", {}};
	analysisGlobals.symtab.insert("FUNC_halt", halt);
	DeclData b = {"PARAMETER", "b", 0, "TYPE_BOOLEAN", {}};
	DeclData printb{"FUNCTION", "printb", 0, "TYPE_VOID", {b}};
	analysisGlobals.symtab.insert("FUNC_printb", printb);
	DeclData c = {"PARAMETER", "c", 0, "TYPE_INT", {}};
	DeclData printc{"FUNCTION", "printc", 0, "TYPE_VOID", {c}};
	analysisGlobals.symtab.insert("FUNC_printc", printc);
	DeclData i = {"PARAMETER", "i", 0, "TYPE_INT", {}};
	DeclData printi{"FUNCTION", "printi",  0, "TYPE_VOID", {i}};
	analysisGlobals.symtab.insert("FUNC_printi", printi);
	DeclData s = {"PARAMETER", "s", 0, "TYPE_STRING", {}};
	DeclData prints{"FUNCTION", "prints", 0, "TYPE_VOID", {s}};
	analysisGlobals.symtab.insert("FUNC_prints", prints);
	return true;
}

//**FIRST CYCLE: BUILDING THE GLOBAL DECLARATIONS
//Building Global Declarations

//Add functions check for conditions and then add the relevant thing into the symbol table. Can be used in later iterations too.
//Adds variables to the table if the node is a variable declaration node.
bool addVar(ASTNode* node) {
	if (node->type != "VAR_DECLARE")  {
		return true;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* type = (childs.at(0));
	ASTNode* identifier = (childs.at(1));
	DeclData values{"VARIABLE", (identifier->val), (type->lineno), (type->type), {}};
	if (analysisGlobals.symtab.existsInScope(("VAR_" + (identifier->val)))) {
		analysisGlobals.symtab.print(std::cerr);
		std::cerr << "Identifier: " << (identifier->val) << ", Variable declaration already defined and is being redefined!\n";
		std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
		exit(1);
	}
	if (analysisGlobals.scopeLevel > 1) {
		std::cerr << "Variable declaration not in outermost block!\n";
		std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
		exit(1);
	}
	analysisGlobals.symtab.insert(("VAR_" + (identifier->val)), values);
	return true;
}
//If function declaration node, add the function to the table.
bool addFunc(ASTNode* node) {
	if (node->type != "FUNC_DECLARE")  {
		return false;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* funcHeader = childs.at(0);
	std::vector<ASTNode*> funcHeaderChildren = (funcHeader->children);
	
	ASTNode* type = funcHeaderChildren.at(0);
	ASTNode* funcDecl = funcHeaderChildren.at(1);
	std::vector<ASTNode*> funcDeclChildren = (funcDecl->children);
	
	ASTNode* identifier = funcDeclChildren.at(0);
	
	DeclData values{"FUNCTION", (identifier->val), (type->lineno), (type->type), {}};
	
	if (funcDeclChildren.size() > 1){
		ASTNode* formalParamList = funcDeclChildren.at(1);
		std::vector<ASTNode*> formParams = (formalParamList->children);
		for(auto* c : formParams) {
			std::vector<ASTNode*> formParamStuff = (c->children);
			ASTNode* type = formParamStuff.at(0);
			ASTNode* identifier = formParamStuff.at(1);
			DeclData param{"PARAMETER", (identifier->val), (type->lineno), (type->type), {}};
			values.parameters.push_back(param);
		}
	}
	
	if (analysisGlobals.symtab.existsInScope(("FUNC_" + (identifier->val)))) {
		std::cerr << "Function already defined and is being redefined!\n";
		std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
		exit(1);
	}
	analysisGlobals.symtab.insert(("FUNC_" + (identifier->val)), values);

	return true;
}
//If main, add it to the table. Necessary to avoid main function getting called.
bool addMain(ASTNode* node) {
	if (node->type != "MAIN_FUNC_DECLARE")  {
		return false;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* mainDeclarator = childs.at(0);
	ASTNode* identifier = (mainDeclarator->children).at(0);
	DeclData values{"MAIN", (identifier->val), (identifier->lineno), "", {}};
	analysisGlobals.symtab.insert(("MAIN_" + (identifier->val)), values);
	
	return true;
}
//** Key function: Executes the first step (compiling into the symbol table all global info).
bool symTabGlobals(ASTNode* ast) {
	analysisGlobals.symtab.push_scope();
	analysisGlobals.scopeLevel = 0;
	std::vector<ASTNode*> childs = (ast->children); //This should be all the global declarations, which can be variable, function, or main.
	for (auto* c:childs) {
		addVar(c);
		addFunc(c);
		addMain(c);
	}
	return true;
}

//** SECOND CYCLE: SCOPE CHECKING AND OPPORTUNISTIC TYPE CHECKING

//These two functions handle scope. Except for function parameters, that ended up needing a kludge.
bool blockScopeAdd(ASTNode* node) {
	std::string nodeType = (node->type);
	if (nodeType != "BLOCK") {
		return true;
	}
	analysisGlobals.symtab.push_scope();	
	analysisGlobals.scopeLevel++;
	return true;
}
void blockScopeMinus(ASTNode* node){
	std::string nodeType = (node->type);
	if (nodeType != "BLOCK") {
		return;
	}
	analysisGlobals.symtab.pop_scope(); //Get rid of pushScope.
	analysisGlobals.scopeLevel--;
}

//Utility function: Retrieve the type (bool, int, str) information of a type of entry (func, var) in the table.
std::string identityType(std::string identity, std::string type, int lineno) {
	bool varExists = analysisGlobals.symtab.exists((type + identity));
	if (!varExists) {
		analysisGlobals.symtab.print(std::cerr);
		std::cerr << type + "type called before it was declared in this scope!\n";
		std::cerr << "Check line/function at: " << (lineno)  << "\n";
		exit(1);
	}
	DeclData typeData = analysisGlobals.symtab.get((type + identity));
	std::string subType = typeData.subtype;
	return subType;
}
//Utility function: Given a node of type expression, identifies what the type of the node is.
std::string expressionType(ASTNode* node) {
	std::string nodeType = (node->type);
	std::unordered_map<std::string, std::string> exprType = {{"NEGATE", "TYPE_INT"}, {"*","TYPE_INT"}, {"/","TYPE_INT"}, {"%","TYPE_INT"}, {"+","TYPE_INT"}, {"-","TYPE_INT"}, {"!", "TYPE_BOOLEAN"}, {"<", "TYPE_BOOLEAN"}, {">", "TYPE_BOOLEAN"}, {"LE", "TYPE_BOOLEAN"}, {"GE", "TYPE_BOOLEAN"}, {"EQ", "TYPE_BOOLEAN"}, {"NE", "TYPE_BOOLEAN"}, {"AND", "TYPE_BOOLEAN"}, {"OR", "TYPE_BOOLEAN"}, {"ID", "TYPE_ID"}, {"NUMBER", "TYPE_INT"}, {"STRING", "TYPE_STRING"}, {"TRUE", "TYPE_BOOLEAN"}, {"FALSE", "TYPE_BOOLEAN"}, {"ASSIGNMENT", "TYPE_ASSIGNMENT"}, {"FUNC_INVOK", "TYPE_FUNC"}};
	auto iter = exprType.find(nodeType);
	std::string type = iter->second; //This should NOT error afaik.
	if (type == "TYPE_ASSIGNMENT") {
		std::vector<ASTNode*> childs = (node->children);
		ASTNode* identifier = childs.at(0);
		std::string identity = (identifier->val);
		std::string identityFound = identityType(identity, "VAR_", (node->lineno));
		return identityFound;
	}
	else if (type == "TYPE_ID") {
		std::string identity = (node->val);
		std::string identityFound = identityType(identity, "VAR_", (node->lineno));
		return identityFound;
	}
	else if (type == "TYPE_FUNC") {
		std::vector<ASTNode*> childs = (node->children);
		ASTNode* identifier = childs.at(0);
		std::string identity = (identifier->val);
		std::string identityFound = identityType(identity, "FUNC_", (node->lineno));
		return identityFound;
	}
	else {
		return type;
	}
	
}
//Test: Makes sure function invokations call a function that 1. exists, 2. is not main, 3. has the correct signature.
bool funcInvokCheck(ASTNode* node)  {
	std::string nodeType = (node->type);
	if (nodeType != "FUNC_INVOK") {
		return true;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* identifier = childs.at(0);
	bool mainCallExists = analysisGlobals.symtab.exists(("MAIN_" + (identifier->val)));
	if (mainCallExists) {
		std::cerr << "You tried to call a main function!\n";
		std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
		exit(1);
	}
	bool funcExists = analysisGlobals.symtab.exists(("FUNC_" + (identifier->val)));
	if (!funcExists) {
		std::cerr << "Function called before it was declared in this scope!\n";
		std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
		exit(1);
	}
	DeclData functionData = analysisGlobals.symtab.get(("FUNC_" + (identifier->val)));
	std::vector<DeclData> params = (functionData.parameters);

	if (childs.size() > 1) {
		ASTNode* argList = childs.at(1);
		std::vector<ASTNode*> arguments = (argList->children);//These are of type expression
		if (arguments.size() != params.size()) {
			std::cerr << "Number of parameters in a function call doesn't match!\n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
		for(int i = 0; i < arguments.size(); i++) {
			std::string cType = expressionType(arguments.at(i));
			DeclData paramData = params.at(i);
			std::string paramType = paramData.subtype;
			if (paramType != cType) {
				std::cerr << "Parameters don't match!\n";
				std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
				exit(1);
			}
		}
	}
	return true;
}
//TEST: Makes sure variable being assigned to was declared before, and that the type being assigned to it is correct.
bool assignmentCheck(ASTNode* node)  {
	std::string nodeType = (node->type);
	if (nodeType != "ASSIGNMENT") {
		return true;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* identifier = childs.at(0);
	bool varExists = analysisGlobals.symtab.exists(("VAR_" + (identifier->val))); //Wait what if we're dealing with parameters? Well crap.
	if (!varExists) {
		std::cerr << "Identifier: " << (identifier->val) << ", Variable called before it was declared in this scope!\n";
		std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
		exit(1);
	}
	DeclData functionData = analysisGlobals.symtab.get(("VAR_" + (identifier->val)));
	ASTNode* assignExpr = childs.at(1);
	std::string exprType = expressionType(assignExpr);
	if (functionData.subtype != exprType) {
		std::cerr << "Assignment attempted to assign a wrong type to the variable!\n";
		std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
		exit(1);
	}
	return true;
}
//TEST: Makes sure that the operators have inputs which are of the correct types.
bool operatorTypeCheck(ASTNode* node)  {
	std::string nodeType = (node->type);
	std::unordered_map<std::string, std::string> opTypes = {{"NEGATE", "TYPE_INT"}, {"*","TYPE_INT"}, {"/","TYPE_INT"}, {"%","TYPE_INT"}, {"+","TYPE_INT"}, {"-","TYPE_INT"}, {"!", "TYPE_BOOLEAN"}, {"<", "TYPE_BOOLEAN"}, {">", "TYPE_BOOLEAN"}, {"LE", "TYPE_BOOLEAN"}, {"GE", "TYPE_BOOLEAN"}, {"EQ", "TYPE_BOOLEAN"}, {"NE", "TYPE_BOOLEAN"}, {"AND", "TYPE_BOOLEAN"}, {"OR", "TYPE_BOOLEAN"}};
	auto iter = opTypes.find(nodeType);
	if (iter == opTypes.end()) {
		return true; //It isn't an operator otherwise.
	}
	std::string op = (node->type);
	std::string type = iter->second; //I now have the type of the operator here. 
	
	std::vector<ASTNode*> childs = (node->children);
	
	if ((op == "NEGATE") || (op == "!")) {
		ASTNode* leftInput = childs.at(0);
		std::string leftInputType = expressionType(leftInput);
		std::unordered_map<std::string, std::string> unaryAccepted = {{"NEGATE", "TYPE_INT"},{"!", "TYPE_BOOLEAN"}};
		auto iter = unaryAccepted.find(nodeType);
		if (iter == unaryAccepted.end()) {
			std::cerr << "Unary operator type mismatched! " << nodeType << " \n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);//It isn't an operator otherwise.
		}
		else if (iter->second != leftInputType) {
			std::cerr << "Unary operator type mismatched! " << nodeType << " \n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
	}
	else if ((op == "EQ") || (op == "NE")) {
		ASTNode* leftInput = childs.at(0);
		std::string leftInputType = expressionType(leftInput);
		ASTNode* rightInput = childs.at(1);
		std::string rightInputType = expressionType(rightInput);
		if ((leftInputType != rightInputType)||((leftInputType != "TYPE_BOOLEAN")&&(leftInputType != "TYPE_INT"))||((rightInputType != "TYPE_BOOLEAN")&&(rightInputType != "TYPE_INT"))) {
			std::cerr << "Equality-type input types mismatched! " << nodeType << " \n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
	}
	else {
		ASTNode* leftInput = childs.at(0);
		std::string leftInputType = expressionType(leftInput);
		ASTNode* rightInput = childs.at(1);
		std::string rightInputType = expressionType(rightInput);
		std::vector<std::string> inputs = {leftInputType, rightInputType};
		std::unordered_map<std::string, std::vector<std::string>> binaryAccepted = {{"*",{"TYPE_INT","TYPE_INT"}}, {"/",{"TYPE_INT","TYPE_INT"}}, {"%",{"TYPE_INT","TYPE_INT"}}, {"+",{"TYPE_INT","TYPE_INT"}}, {"-",{"TYPE_INT","TYPE_INT"}}, {"<", {"TYPE_INT","TYPE_INT"}}, {">", {"TYPE_INT","TYPE_INT"}}, {"LE", {"TYPE_INT","TYPE_INT"}}, {"GE", {"TYPE_INT","TYPE_INT"}}, {"AND", {"TYPE_BOOLEAN","TYPE_BOOLEAN"}}, {"OR", {"TYPE_BOOLEAN","TYPE_BOOLEAN"}}};
		auto iter = binaryAccepted.find(nodeType);
		if (iter == binaryAccepted.end()) {
			std::cerr << "Binary operator type mismatched! " << nodeType << " \n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);//It isn't an operator otherwise.
		}
		else if (iter->second != inputs) {
			std::cerr << "Binary operator type mismatched! " << nodeType << " \n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
	}
	return true;
	
}
//TEST: Make sure the conditional on the if/while is a valid boolean expression.
bool checkIfWhileCondition(ASTNode* node) {
	bool ifWhileSeen = ((node -> type) == "IF")||((node -> type) == "IF_ELSE")||((node -> type) == "WHILE");
	if (ifWhileSeen) {
		std::vector<ASTNode*> children = (node->children);
		ASTNode* expression = children.at(0); //First entry of the vector, given how I programmed it in the parser.
		std::string exprType = expressionType(expression);
		if (exprType != "TYPE_BOOLEAN") {
			std::cerr << "Non-Boolean If/While Condition!\n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
	}
	return true;
}
//Wrapper Function: Takes all the pre-traversal functions before and wraps them under one function so they can all be done by one pass.
bool preTravFuncsTwo(ASTNode* node) {
	blockScopeAdd(node);
	addVar(node);
	funcInvokCheck(node);
	assignmentCheck(node);
	
	//The next two are technically typecheck functions, but they're convenient to do within the context of scope checking.
	operatorTypeCheck(node);
	checkIfWhileCondition(node);
	
	return true;
}
//Wrapper Function: Same as pre except for post.
void postTravFuncsTwo(ASTNode* node) {
	blockScopeMinus(node);
}
//Wrapper Function: Usually this would be the function to call, but I needed to handle function parameter scoping.
bool scopeCheckCore(ASTNode* node) {
	analysisGlobals.scopeLevel = 0;
	pre_post_traversal(node, &preTravFuncsTwo, &postTravFuncsTwo);
	return true;
	
}
//Function to handle the issue of function scoping/parameter scoping.
bool funcScope(ASTNode* node){
	if (node->type != "FUNC_DECLARE")  {
		return false;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* funcHeader = childs.at(0);
	std::vector<ASTNode*> funcHeaderChildren = (funcHeader->children);
	
	ASTNode* type = funcHeaderChildren.at(0);
	ASTNode* funcDecl = funcHeaderChildren.at(1);
	std::vector<ASTNode*> funcDeclChildren = (funcDecl->children);
	
	ASTNode* identifier = funcDeclChildren.at(0);
	
	analysisGlobals.symtab.push_scope();
	analysisGlobals.symtab.pushFuncParams((identifier->val));
	scopeCheckCore(node);
	analysisGlobals.symtab.pop_scope();
	
	return true;
}
//Main doesn't have parameters, need to be less careful.
bool mainScope(ASTNode* node){
	if (node->type != "MAIN_FUNC_DECLARE")  {
		return false;
	}
	scopeCheckCore(node);
	return true;
}
//MAIN TESTING FUNCTION FOR THE SCOPE PORTION.
bool scopeCheckTest(ASTNode* ast) {
	std::vector<ASTNode*> childs = (ast->children); //This should be all the global declarations, which can be variable, function, or main.
	for (auto* c:childs) { //Those functions let us maintain parameter scoping. Sorry, it's a bit of a kludge.
		funcScope(c); //Go into scope checking for that which has layers of scopes.
		mainScope(c); //The only other thing we care about is if its main. In which case... things are easier.
	}
	return true;
}
//Type checking the functions and their returns. Much more painful than I thought.
bool returnExpected(std::string typeVal, ASTNode* node) {	
	std::vector<ASTNode*> childs = (node->children);
	if ((node->type) == "RETURN") {
		if (childs.size() != 1) {
			std::cerr << "Return found, but returns nothing!\n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
		ASTNode* returnNode = childs.at(0);
		std::string exprType = expressionType(returnNode);
		if (exprType != typeVal) {
			std::cerr << "Return types mismatched!\n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
	}	
	return true;
}
//Wrapper function: For making sure symbol table is filled in for function returns.
bool typeCheckPre(std::string typeVal, ASTNode* node) {
	blockScopeAdd(node);
	addVar(node);
	returnExpected(typeVal, node);
	return true;
}
//Weapper Function: For making sure summbol table is filled in for function returns.
void typeCheckPost(ASTNode* node) {
	blockScopeMinus(node);
}
//TEST: Making sure functions return the correct type of value.
bool correctReturn(ASTNode* node) {
	std::string nodeType = (node->type);
	if (nodeType == "FUNC_DECLARE") {
		std::vector<ASTNode*> childs = (node->children);
		ASTNode* funcHeader = childs.at(0);
		std::vector<ASTNode*> headerChildren = (funcHeader->children);
		ASTNode* funcType = headerChildren.at(0);
		std::string typeVal = (funcType->type);
		if (typeVal == "TYPE_VOID") {
			return true; //Voids returning somehting not void is actually caught later.
		}
		else if (typeVal != "TYPE_VOID") {
			pre_post_traversal_wStr(node, typeVal, &typeCheckPre, &typeCheckPost);
			return true;
		}
	}
	return true;
}
//Wrapper function: Handling function parameters.
bool funcScopeType(ASTNode* node){
	if (node->type != "FUNC_DECLARE")  {
		return false;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* funcHeader = childs.at(0);
	std::vector<ASTNode*> funcHeaderChildren = (funcHeader->children);
	
	ASTNode* type = funcHeaderChildren.at(0);
	ASTNode* funcDecl = funcHeaderChildren.at(1);
	std::vector<ASTNode*> funcDeclChildren = (funcDecl->children);
	
	ASTNode* identifier = funcDeclChildren.at(0);
	
	analysisGlobals.symtab.push_scope();
	analysisGlobals.symtab.pushFuncParams((identifier->val));
	correctReturn(node);
	analysisGlobals.symtab.pop_scope();
	
	return true;
}
//Wrapper function: Handling in the event it's main.
bool mainScopeType(ASTNode* node){
	if (node->type != "MAIN_FUNC_DECLARE")  {
		return false;
	}
	correctReturn(node);
	return true;
}
//MAIN TEST FUNCTION: Typechecking the functions.
bool typeCheckTest(ASTNode* ast) {
	std::vector<ASTNode*> childs = (ast->children); //This should be all the global declarations, which can be variable, function, or main.
	for (auto* c:childs) {
		funcScopeType(c);
		mainScopeType(c);
	}
	return true;
}
//**TEST CONDITIONS
//Non-Symbol Table Checks

//Counts the number of main function. Only for the given node!
bool isMain(ASTNode* node) {
	bool mainSeen = ((node -> type) == "MAIN_FUNC_DECLARE");
	if (mainSeen) {
		analysisGlobals.countMain++;
	}
	if (analysisGlobals.countMain > 1) {
		std::cerr << "Too many Main functions!\n";
		std::cerr << "Check line: " << (node->lineno)  << "\n";
		exit(1);
	}
	return true;
}
//Ensures that at least one main function exists.
bool existsMain() {
	if (analysisGlobals.countMain < 1) {
		std::cerr << "No main function!\n";
		exit(1);
	}
	return true;
}
//Break condition
	bool breakSatisfied(ASTNode* node) {
	std::string nodeType = (node->type);
	if ((nodeType == "BREAK") && (analysisGlobals.loopLevel <= 0)) {
		std::cerr << "Break not in while loop!\n";
		std::cerr << "Check line: " << (node->lineno)  << "\n";
		exit(1);
	}
	return true;
}
//Increments the while loop counter. It and decrement are needed to make sure break satisfied condition works.
bool incrementWhile(ASTNode* node) {
	std::string nodeType = (node->type);
	if (nodeType == "WHILE"){
			++analysisGlobals.loopLevel;
	}
	return true;
}
void decrementWhile(ASTNode* node) {
	std::string nodeType = (node->type);
	if (nodeType == "WHILE"){
		--analysisGlobals.loopLevel;
	}
}
//Test: Break loop check.
bool breakLoopCheck(ASTNode* node) {
	incrementWhile(node);
	breakSatisfied(node);
	return true;
}
//Void and non-void return conditions
bool returnsVal(ASTNode* node) {
	std::vector<ASTNode*> childs = (node->children);
	if ((node->type) == "RETURN") {
		analysisGlobals.returnSighted++;
		if (childs.size() != 1) {
			std::cerr << "Return found, but returns nothing!\n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
		return true;
	}
	for(auto* c : node->children) {
		returnsVal(c); 
	}
	return true;
}
bool notReturnsVal(ASTNode* node) {
	std::vector<ASTNode*> childs = (node->children);
	if ((node->type) == "RETURN") {
		if (childs.size() != 0) {
			std::cerr << "Return found, but returns something when it's void!\n";
			std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
			exit(1);
		}
		return true;
	}
	for(auto* c : node->children) {
		notReturnsVal(c);
	}
	return true;
}
//Makes sure that the use of returns is coherant (void has no return value; non-void must return something).
bool returnCoherant(ASTNode* node) {
	std::string nodeType = (node->type);
	if (nodeType == "FUNC_DECLARE") {
		std::vector<ASTNode*> childs = (node->children);
		ASTNode* funcHeader = childs.at(0);
		std::vector<ASTNode*> headerChildren = (funcHeader->children);
		ASTNode* funcType = headerChildren.at(0);
		std::string typeVal = (funcType->type);
		if (typeVal == "TYPE_VOID") {
			notReturnsVal(node);
		}
		else if (typeVal != "TYPE_VOID") {
			analysisGlobals.returnSighted = 0;
			returnsVal(node);
			if (analysisGlobals.returnSighted < 1) {
				std::cerr << "Return expected but does not exist!\n";
				std::cerr << "Check line/function at: " << (node->lineno)  << "\n";
				exit(1);
			}
		}
	}
	return true;
}
//Wrapper function for all non-symbol table pretraversal functions at once
bool simplePreTrav(ASTNode* node) {
	isMain(node);
	breakLoopCheck(node);
	//returnCoherant(node);
	return true;
}
void simplePostTrav(ASTNode* node) {
	decrementWhile(node);
}
//Simple tests:
bool mainSatisfied(ASTNode* ast) {
	analysisGlobals.countMain = 0;
	pre_traversal(ast, &isMain);
	existsMain();
	return true;
}
bool breakCheck(ASTNode* ast) {
	analysisGlobals.loopLevel = 0;
	pre_post_traversal(ast, &breakLoopCheck, &decrementWhile);
	return true;
}
bool returnsCheck(ASTNode* ast) {
	pre_traversal(ast, &returnCoherant);
	return true;
}
//This test does everything above. MAIN TEST FUNCTION.
bool simpleTest(ASTNode* ast) {
	analysisGlobals.countMain = 0;
	analysisGlobals.loopLevel = 0;
	pre_post_traversal(ast, &simplePreTrav, &simplePostTrav);
	existsMain();
	return true;
}
