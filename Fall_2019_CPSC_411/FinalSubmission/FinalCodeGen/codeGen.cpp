#include <memory>
#include <string>
#include <vector>
#include <iostream>
#include <sstream>
#include <cassert>
#include <tuple>
#include <iomanip>
#include "Symbol_Table_30020834.h"
#include "AST.h"
#include "codeGen.h"

/**
This is the code generation code by John Ming Ngo, 30020834

It takes in an AST input for the J-- grammer (well, my AST input), and translates it into reasonable stack-based code. Note that I name things, such as blocks and variables, with numbers, so the output code admittedly isn't particularly readable. Ah well.

If you have any questions, please ask me!

Todo: Make sure wat code compiles for all of them.
Todo: Make sure each wat code does what the program is supposed to. ****
Todo: Make sure code is spat out for all

*/
//This code handles the symbol table
struct {
	int globVarCount = 0;
	int locVarCount = 0;
	int blockCount  = 20; //Start at 20 to avoid conflicts with other code?
	int scopeLevel = 0;
	std::vector<std::string> progStrings = {};
	std::unordered_map<std::string, std::tuple<int,int>> strLoc = {};
	symbol_table symtab;
	std::vector<std::string> output = {};
} genGlobals;


//Utility Functions for writing
void output(std::string line) {
	genGlobals.output.push_back(line);
}

std::ostream& operator<<(std::ostream& os, std::string line) {
    return os << line;
}

void exportOutput(std::ostream& os) {
	for (std::string line : genGlobals.output) {
		os << line;
	}
}
//Edited tree traversal functions. 
bool prePostTrav(ASTNode* node
			, std::function<bool(ASTNode*)> pre
			, std::function<void(ASTNode*)> post) {
	//std::cout << "traversing node\n";
	if(!pre(node)) 
		return true; //That is, don't go any further. Do not check past here.

	for(auto* c : node->children) {
		pre_post_traversal(c, pre, post);
		//std::cout << "Traversing children\n"; //I DO want it to check all the siblings though. This isn't erroring out.
	}
	
	post(node);
	return true;
}

// implement other traversals in terms of more general traversal
bool preTrav(ASTNode* node, std::function<bool(ASTNode*)> const& pre) {
	return prePostTrav(node, pre, [](auto*) {});
}

void postTrav(ASTNode* node, std::function<void(ASTNode*)> const& post) {
	prePostTrav(node, [](auto*) { return true; }, post);
}

//Add functions check for conditions and then add the relevant thing into the symbol table.
//That is, this code handles the symbol table.
//Adds variables to the table if the node is a variable declaration node.
//If function declaration node, add the function to the table.
bool symTabPredefGen() {
	genGlobals.symtab.push_scope();
	genGlobals.scopeLevel = 0;
	DeclData getchar{"FUNCTION", "getchar", 0, "TYPE_INT", {}};
	genGlobals.symtab.insert("FUNC_getchar", getchar);
	DeclData halt{"FUNCTION", "halt", 0, "TYPE_VOID", {}};
	genGlobals.symtab.insert("FUNC_halt", halt);
	DeclData b = {"PARAMETER", "b", 0, "TYPE_BOOLEAN", {}};
	DeclData printb{"FUNCTION", "printb", 0, "TYPE_VOID", {b}};
	genGlobals.symtab.insert("FUNC_printb", printb);
	DeclData c = {"PARAMETER", "c", 0, "TYPE_INT", {}};
	DeclData printc{"FUNCTION", "printc", 0, "TYPE_VOID", {c}};
	genGlobals.symtab.insert("FUNC_printc", printc);
	DeclData i = {"PARAMETER", "i", 0, "TYPE_INT", {}};
	DeclData printi{"FUNCTION", "printi",  0, "TYPE_VOID", {i}};
	genGlobals.symtab.insert("FUNC_printi", printi);
	DeclData s = {"PARAMETER", "s", 0, "TYPE_STRING", {}};
	DeclData prints{"FUNCTION", "prints", 0, "TYPE_VOID", {s}};
	genGlobals.symtab.insert("FUNC_prints", prints);
	return true;
}
bool addVarGen(ASTNode* node) {
	if (node->type != "VAR_DECLARE")  {
		return true;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* identifier = (childs.at(1));
	
	DeclData values;
	std::string globOrLoc;
	if (genGlobals.scopeLevel == 0) {
		globOrLoc = "Global";
		values = {"VARIABLE", (identifier->val), genGlobals.locVarCount, globOrLoc, {}};
		genGlobals.locVarCount++;
	}
	else {
		globOrLoc = "Local";
		values = {"VARIABLE", (identifier->val), genGlobals.globVarCount, globOrLoc, {}};
		genGlobals.globVarCount++;
	}
	
	genGlobals.symtab.insert(("VAR_" + (identifier->val)), values);
	return true;
}
bool addFuncGen(ASTNode* node) {
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
	
	genGlobals.symtab.insert(("FUNC_" + (identifier->val)), values);

	return true;
}
//If main, add it to the table. Necessary to avoid main function getting called. ==> Might not be needed in this section!
bool addMainGen(ASTNode* node) {
	if (node->type != "MAIN_FUNC_DECLARE")  {
		return true;
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* mainDeclarator = childs.at(0);
	ASTNode* identifier = (mainDeclarator->children).at(0);
	DeclData values{"MAIN", (identifier->val), (identifier->lineno), "", {}};
	genGlobals.symtab.insert(("MAIN_" + (identifier->val)), values);
	
	return true;
}
//Coding strings
bool takeStrings(ASTNode* node) {
	std::string nodeType = (node->type);
	if (nodeType != "STRING") {
		return true;
	}
	std::string strData = (node->val);
	genGlobals.progStrings.push_back(strData);
	return true;
}
std::string byteFormat(std::string input) {
	std::vector<char> bytes(input.begin(), input.end());
	std::string outputString = "";
	for (char c : bytes) {
		int bytes = (int)c;
		std::stringstream stream;
		stream << std::setfill ('0') << std::setw(2) << std::hex << bytes; //setw(2) - hex escape is 2 chars wide.
		std::string byteString(stream.str());
		outputString = outputString + "\\" + byteString;
	}
	return outputString;
}
bool codeProgStrings() {
	int strSizes = 0;
	for (auto const& str:genGlobals.progStrings) {
		strSizes = strSizes + str.size();
	}
	int memorySize = strSizes/64000 + 1; //64 kilobytes, each char is a byte; add in one more page just to be safe.
	output("(memory $programStrings " + std::to_string(memorySize) + ")");
	int strLoc = 0;
	int upperBound = 0;
	for (auto const& str : genGlobals.progStrings) {
		upperBound = strLoc + str.size();
		output("(data (i32.const " + std::to_string(strLoc) + ") \"" + byteFormat(str) + "\")");
		std::tuple<int,int> strLocation(strLoc, upperBound);
		genGlobals.strLoc.emplace(str, strLocation); //Register it to our string registry.
		strLoc = upperBound; //New upperbound location.
	}
	return true;
}
bool codeMemoryStrings(ASTNode* ast) {
	genGlobals.progStrings.push_back("true");
	genGlobals.progStrings.push_back("false");
	preTrav(ast, &takeStrings);
	codeProgStrings();
	return true;
}


//Coding the module's beginning
//Runtime and strings.
bool codeBegin(ASTNode* ast) {
	output("(module	 \
  (import \"host\" \"exit\" (func $halt)) \n\
  (import \"host\" \"getchar\" (func $getchar (result i32))) \n\
  (import \"host\" \"putchar\" (func $printc (param i32)))");
  output("(global $boolTemp (mut i32) (i32.const 0))");
  
  codeMemoryStrings(ast);
  output("  (func $printb		\n\
	(param $bool i32)			\n\
	(block $falsePrint			\n\
		i32.const 1			\n\
		local.get $bool			\n\
		i32.eq			\n\
		br_if $falsePrint			\n\
		i32.const 4			\n\
		i32.const 9			\n\
		call $prints			\n\
	)			\n\
	(block $truePrint			\n\
		i32.const 0			\n\
		local.get $bool			\n\
		i32.eq			\n\
		br_if $truePrint			\n\
		i32.const 0			\n\
		i32.const 4			\n\
		call $prints			\n\
	)			\n\
				\n\
  )			\n\
  			\n\
  (func $printNum (param $printNumint i32)			\n\
	(block $end			\n\
	(block $9			\n\
	(block $8			\n\
	(block $7			\n\
	(block $6			\n\
	(block $5			\n\
	(block $4			\n\
	(block $3			\n\
	(block $2			\n\
	(block $1			\n\
	(block $NUM0			\n\
	local.get $printNumint			\n\
	i32.const 0			\n\
	i32.eq			\n\
	br_if $NUM0			\n\
	local.get $printNumint			\n\
	i32.const 1			\n\
	i32.eq			\n\
	br_if $1			\n\
	local.get $printNumint			\n\
	i32.const 2			\n\
	i32.eq			\n\
	br_if $2			\n\
	local.get $printNumint			\n\
	i32.const 3			\n\
	i32.eq			\n\
	br_if $3			\n\
	local.get $printNumint			\n\
	i32.const 4			\n\
	i32.eq			\n\
	br_if $4			\n\
	local.get $printNumint			\n\
	i32.const 5			\n\
	i32.eq			\n\
	br_if $5			\n\
	local.get $printNumint			\n\
	i32.const 6			\n\
	i32.eq			\n\
	br_if $6			\n\
	local.get $printNumint			\n\
	i32.const 7			\n\
	i32.eq			\n\
	br_if $7			\n\
	local.get $printNumint			\n\
	i32.const 8			\n\
	i32.eq			\n\
	br_if $8			\n\
	local.get $printNumint			\n\
	i32.const 9			\n\
	i32.eq			\n\
	br_if $9			\n\
	)			\n\
	i32.const 48			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 49			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 50			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 51			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 52			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 53			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 54			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 55			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 56			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
	i32.const 57			\n\
	call $printc			\n\
	br $end			\n\
	)			\n\
				\n\
  )			\n\
  			\n\
  (func $printi2			\n\
	(param $intVal i32)			\n\
	(local $localIntVal i32)			\n\
	local.get $intVal			\n\
	local.set $localIntVal			\n\
	(block $printiB1			\n\
		(loop $printiL1			\n\
			local.get $localIntVal			\n\
			i32.const 0			\n\
			i32.eq			\n\
			br_if $printiB1			\n\
						\n\
			local.get $localIntVal			\n\
			i32.const 10			\n\
			i32.div_u			\n\
			call $printi2			\n\
						\n\
			local.get $localIntVal			\n\
			i32.const 10			\n\
			i32.rem_u			\n\
			call $printNum			\n\
		)			\n\
	)			\n\
  )			\n\
  			\n\
  (func $printi3			\n\
	(param $intVal i32)			\n\
	(local $localIntVal i32)			\n\
	local.get $intVal			\n\
	local.set $localIntVal			\n\
	(block $printNumZero			\n\
		local.get $localIntVal			\n\
		i32.const 0			\n\
		i32.ne			\n\
		br_if $printNumZero			\n\
					\n\
		local.get $localIntVal			\n\
		call $printNum			\n\
	)			\n\
	(block $printiB1			\n\
		(loop $printiL1			\n\
			local.get $localIntVal			\n\
			i32.const 0			\n\
			i32.eq			\n\
			br_if $printiB1			\n\
						\n\
			local.get $localIntVal			\n\
			i32.const 10			\n\
			i32.div_u			\n\
			call $printi2			\n\
						\n\
			local.get $localIntVal			\n\
			i32.const 10			\n\
			i32.rem_u			\n\
			call $printNum			\n\
		)			\n\
	)			\n\
  )			\n\
  (func $printi				\n\
	(param $intInput i32)				\n\
	(block $posVal				\n\
	(block $negVal				\n\
	local.get $intInput				\n\
	i32.const 0				\n\
	i32.ge_s				\n\
	br_if $negVal				\n\
	i32.const 45 ;;Neg symbol				\n\
	call $printc				\n\
	i32.const 0				\n\
	local.get $intInput				\n\
	i32.sub				\n\
	call $printi3				\n\
	br $posVal				\n\
	)				\n\
	local.get $intInput				\n\
	call $printi3				\n\
	)				\n\
  )			\n\
  			\n\
  			\n\
  (func $prints 			\n\
	  (param $strStart i32) 			\n\
	  (param $strEnd i32)			\n\
	  (local $strCounter i32)			\n\
	  local.get $strStart			\n\
	  local.set $strCounter			\n\
	  (block $printsB1			\n\
		(loop $printsL1			\n\
					\n\
		local.get $strCounter			\n\
		local.get $strEnd			\n\
		i32.ge_s			\n\
		br_if $printsB1			\n\
					\n\
		local.get $strCounter 			\n\
		i32.load8_u			\n\
		call $printc			\n\
					\n\
		local.get $strCounter			\n\
		i32.const 1			\n\
		i32.add			\n\
		local.set $strCounter			\n\
					\n\
		br $printsL1			\n\
		)			\n\
	  )			\n\
  )");
  return true;
}

bool codeModuleEnd() {
	output(")");
	return true;
}


// This code handles expressions in general.

//-Declaring these functions for visibility below; problem is that these functions call each other recursively...
bool codeExpr2Children(ASTNode* node);
bool codeExprChild(ASTNode* node);
bool codeExpr(ASTNode* node);
bool codeExprStackStay(ASTNode* node);
bool codeID(ASTNode* node);
bool codeAssign(ASTNode* node);
bool codeAssignValBack(ASTNode* node);
bool codeNum(ASTNode* node);
bool codeStr(ASTNode* node);
bool codeTru(ASTNode* node);
bool codeFal(ASTNode* node);
bool codeOr(ASTNode* node);
bool codeAnd(ASTNode* node);
bool codeNe(ASTNode* node);
bool codeEq(ASTNode* node);
bool codeGE(ASTNode* node);
bool codeLE(ASTNode* node);
bool codeGT(ASTNode* node);
bool codeLT(ASTNode* node);
bool codeAdd(ASTNode* node);
bool codeSub(ASTNode* node);
bool codeMod(ASTNode* node);
bool codeDiv(ASTNode* node);
bool codeMul(ASTNode* node);
bool codeNeg(ASTNode* node);
bool codeNot(ASTNode* node);
//For visibility
bool codeBlock(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock);
bool codeIf(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock);
bool codeIfElse(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock);
bool codeWhile(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock);
bool codeFuncInvok(ASTNode* node);
bool codeFuncInvokNoRet(ASTNode* node);
bool codeBreak(ASTNode* node, std::string blockName);
bool codeReturn(ASTNode* node, std::string funcBlockName, std::string returnLocName);

//Assumes the node has 2 expression type children; tells it to code them both.
bool codeExpr2Children(ASTNode* node) {
	std::vector<ASTNode*> childs = (node->children);
	codeExprStackStay(childs.at(0));
	codeExprStackStay(childs.at(1));
	return true;
}

//Assumes the node has 1 expression type child and to code it out.
bool codeExprChild(ASTNode* node) {
	std::vector<ASTNode*> childs = (node->children);
	codeExprStackStay(childs.at(0));
	return true;
}
//--This is the main function for this section. A sort of wrapper for it all.
bool codeExpr(ASTNode* node) {
	std::string nodeType = (node->type);
	if (nodeType == "ID") {
		codeID(node);
	}
	else if (nodeType == "ASSIGNMENT") {
		codeAssign(node);
	}
	else if (nodeType == "NUMBER") {
		codeNum(node);
	}
	else if (nodeType == "STRING") {
		codeStr(node);
	}
	else if (nodeType == "TRUE") {
		codeTru(node);
	}
	else if (nodeType == "FALSE") {
		codeFal(node);
	}
	else if (nodeType == "OR") {
		codeOr(node);
	}
	else if (nodeType == "AND") {
		codeAnd(node);
	}
	else if (nodeType == "NE") {
		codeNe(node);
	}
	else if (nodeType == "EQ") {
		codeEq(node);
	}
	else if (nodeType == "GE") {
		codeGE(node);
	}
	else if (nodeType == "LE") {
		codeLE(node);
	}
	else if (nodeType == ">") {
		codeGT(node);
	}
	else if (nodeType == "<") {
		codeLT(node);
	}
	else if (nodeType == "-") {
		codeSub(node);
	}
	else if (nodeType == "+") {
		codeAdd(node);
	}
	else if (nodeType == "%") {
		codeMod(node);
	}
	else if (nodeType == "*") {
		codeMul(node);
	}
	else if (nodeType == "/") {
		codeDiv(node);
	}
	else if (nodeType == "!") {
		codeNot(node);
	}
	else if (nodeType == "NEGATE") {
		codeNeg(node);
	}
	else if (nodeType == "FUNC_INVOK") {
		codeFuncInvok(node);
	}
	else {
		return true;
	}
	return false; //This set of functions handles ALL stuff related to expressions and anywhere expressions can lead to; I don't want to recurse any further beyond this.
}
//--This is the main function for this section. A sort of wrapper for it all.
bool codeExprStackStay(ASTNode* node) {
	std::string nodeType = (node->type);
	if (nodeType == "ID") {
		codeID(node);
	}
	else if (nodeType == "ASSIGNMENT") {
		codeAssignValBack(node);
	}
	else if (nodeType == "NUMBER") {
		codeNum(node);
	}
	else if (nodeType == "STRING") {
		codeStr(node);
	}
	else if (nodeType == "TRUE") {
		codeTru(node);
	}
	else if (nodeType == "FALSE") {
		codeFal(node);
	}
	else if (nodeType == "OR") {
		codeOr(node);
	}
	else if (nodeType == "AND") {
		codeAnd(node);
	}
	else if (nodeType == "NE") {
		codeNe(node);
	}
	else if (nodeType == "EQ") {
		codeEq(node);
	}
	else if (nodeType == "GE") {
		codeGE(node);
	}
	else if (nodeType == "LE") {
		codeLE(node);
	}
	else if (nodeType == ">") {
		codeGT(node);
	}
	else if (nodeType == "<") {
		codeLT(node);
	}
	else if (nodeType == "-") {
		codeSub(node);
	}
	else if (nodeType == "+") {
		codeAdd(node);
	}
	else if (nodeType == "%") {
		codeMod(node);
	}
	else if (nodeType == "*") {
		codeMul(node);
	}
	else if (nodeType == "/") {
		codeDiv(node);
	}
	else if (nodeType == "!") {
		codeNot(node);
	}
	else if (nodeType == "NEGATE") {
		codeNeg(node);
	}
	else if (nodeType == "FUNC_INVOK") {
		codeFuncInvok(node);
	}
	else {
		return true;
	}
	return false; //This set of functions handles ALL stuff related to expressions and anywhere expressions can lead to; I don't want to recurse any further beyond this.
}
bool codeID(ASTNode* node) { //THIS NEEDS SYMBOL TABLE AND IDENTIFICATION IF IT'S GLOBAL OR LOCAL
	std::string idVal = (node->val);
	DeclData idData = genGlobals.symtab.get("VAR_" + idVal);
	int varVal = idData.lineno;
	
	std::string varStr;
	std::ostringstream temp; 
	temp << varVal;
	varStr = temp.str(); 
	
	std::string locOrGlob = idData.subtype;
	if (locOrGlob == "Global") {
		output("global.get $glob" + varStr);
	}
	else {
		output("local.get $loc" + varStr);
	}
	return false;
}
bool codeAssignValBack(ASTNode* node) { //THIS NEEDS SYMBOL TABLE AND IDENTIFICATION IF IT'S GLOBAL OR LOCAL
	//Goal We need to prevent this identifier from interacting with the other identifier. This one is assignment; the other is using it.
	//std::cout << "CodeAssign Called \n";
	std::string nodeType = (node->type);
	if (nodeType != "ASSIGNMENT") {
		return true;
	}
	
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* identifier = childs.at(0);
	std::string idVal = (identifier->val);
	DeclData idData = genGlobals.symtab.get("VAR_" + idVal);
	int varVal = idData.lineno;
	
	std::string varStr;
	std::ostringstream temp; 
	temp << varVal;
	varStr = temp.str(); 
	
	ASTNode* assignExpr = childs.at(1);
	if (assignExpr->type == "ASSIGNMENT") {
		codeAssignValBack(assignExpr);
	}
	else {
		codeExpr(assignExpr);
	}
	
	std::string locOrGlob = idData.subtype;
	if (locOrGlob == "Global") {
		output("global.set $glob" + varStr);
		output("global.get $glob" + varStr);
	}
	else {
		output("local.set $loc" + varStr);
		output("local.get $loc" + varStr);
	}
	return false;
}
bool codeAssign(ASTNode* node) { //THIS NEEDS SYMBOL TABLE AND IDENTIFICATION IF IT'S GLOBAL OR LOCAL
	//Goal We need to prevent this identifier from interacting with the other identifier. This one is assignment; the other is using it.
	//std::cout << "CodeAssign Called \n";
	std::string nodeType = (node->type);
	if (nodeType != "ASSIGNMENT") {
		return true;
	}
	
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* identifier = childs.at(0);
	std::string idVal = (identifier->val);
	DeclData idData = genGlobals.symtab.get("VAR_" + idVal);
	int varVal = idData.lineno;
	
	std::string varStr;
	std::ostringstream temp; 
	temp << varVal;
	varStr = temp.str(); 
	
	ASTNode* assignExpr = childs.at(1);
	if (assignExpr->type == "ASSIGNMENT") {
		codeAssignValBack(assignExpr);
	}
	else {
		codeExpr(assignExpr);
	}
	
	std::string locOrGlob = idData.subtype;
	if (locOrGlob == "Global") {
		output("global.set $glob" + varStr);
	}
	else {
		output("local.set $loc" + varStr);
	}
	return false;
}
bool codeNum(ASTNode* node) {
	std::string numVal = (node->val);
	output("(i32.const "+ numVal + " )");
	return true;
}

bool codeStr(ASTNode* node) {
	std::string strVal = (node->val);
	std::tuple<int,int> strLocs = genGlobals.strLoc.at(strVal);
	int startLoc = std::get<0>(strLocs);
	int endLoc = std::get<1>(strLocs);
	//Assumption: This results to a call to an appropriate string handling function; no strings anywhere else.
	output("i32.const " +  std::to_string(startLoc));
	output("i32.const " +  std::to_string(endLoc));
	return true;
}
bool codeTru(ASTNode* node) {
	output("(i32.const 1)");
	return true;
}
bool codeFal(ASTNode* node) {
	output("(i32.const 0)");
	return true;
}
bool codeOr(ASTNode* node) { 
	std::vector<ASTNode*> childs = (node->children);
	//Block start
	int blockID = genGlobals.blockCount;
	genGlobals.blockCount++;
	output("(block $" + std::to_string(blockID));
	//Check first child
	codeExpr(childs.at(0));
	//Short circuiting code here.
	output("i32.const 1");
	output("i32.eq");
	output("global.set $boolTemp");
	output("global.get $boolTemp");
	output("br_if $" + std::to_string(blockID));
	codeExpr(childs.at(1));
	//First is false, result is equivalent to the second.
	output("global.set $boolTemp");
	//Block close code here
	output(")");
	//Result of the computation here.
	output("global.get $boolTemp");
	return true;
}
bool codeAnd(ASTNode* node) {
	std::vector<ASTNode*> childs = (node->children);
	//Block start
	int blockID = genGlobals.blockCount;
	genGlobals.blockCount++;
	output("(block $" + std::to_string(blockID));
	//Check first child
	codeExpr(childs.at(0));
	//Short circuiting code here.
	output("i32.const 0");
	output("i32.eq");
	output("i32.const 0");
	output("global.set $boolTemp");
	output("br_if $" + std::to_string(blockID));
	//First is true, result is equivalent to the second.
	codeExpr(childs.at(1));
	output("global.set $boolTemp");
	//Block close code here
	output(")");
	//Result of the computation here.
	output("global.get $boolTemp");
	return true;
}
bool codeNe(ASTNode* node) {
	codeExpr2Children(node); //The two children's values are on the stack now.
	//Then we do the check and give a final result.
	output("i32.ne");
	return true;
}
bool codeEq(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.eq");
	return true;
}
bool codeGE(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.ge_s");
	return true;
}
bool codeLE(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.le_s");
	return true;
}
bool codeGT(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.gt_s");
	return true;
}
bool codeLT(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.lt_s");
	return true;
}
bool codeAdd(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.add");
	return true;
}
bool codeSub(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.sub");
	return true;
}
bool codeMod(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.rem_s");
	return true;
}
bool codeDiv(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.div_s");
	return true;
}
bool codeMul(ASTNode* node) {
	codeExpr2Children(node);
	output("i32.mul");
	return true;
}
bool codeNeg(ASTNode* node) {
	output("i32.const 0");
	codeExprChild(node);
	output("i32.sub");
	return true;
}
bool codeNot(ASTNode* node) {
	codeExprChild(node);
	output("i32.const 1");
	output("i32.add");
	output("i32.const 2");
	output("i32.rem_s");
	return true;
}

//This code handles variable declarations
bool codeVar(ASTNode* node) {
	if (node->type != "VAR_DECLARE")  {
		return true; //Keep going.
	}
	//Gather data such as the variable's name. 
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* type = childs.at(0);
	ASTNode* identifier = childs.at(1);
	
	//Determine if the declaration is global or local, by checking out symbol table.
	std::string idVal = (identifier->val);
	DeclData idData = genGlobals.symtab.get("VAR_" + idVal);
	int varVal = idData.lineno;
	
	std::string varStr;
	std::ostringstream temp; 
	temp << varVal;
	varStr = temp.str(); 
	
	std::string locOrGlob = idData.subtype;
	if (locOrGlob == "Global") {
		output("(global $glob" + varStr + " (mut i32) (i32.const 0))");
	}
	else {
		output("(local $loc" + varStr + " i32)");
	}
	return false; //Don't go beyond this.
}
bool codeParam(ASTNode* node) {
	if (node->type != "FORM_PARAM")  { 
		return true; //Keep going.
	}
	//Gather data such as the variable's name. 
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* type = childs.at(0);
	ASTNode* identifier = childs.at(1);
	//Just treat parameters like local variables; they're called in the same way anyways.
	DeclData values;
	std::string id = (identifier->val);
	int paramID = genGlobals.locVarCount;
	values = {"VARIABLE", (identifier->val), paramID, "LOCAL", {}};
	genGlobals.symtab.insert(("VAR_" + (identifier->val)), values);
	genGlobals.locVarCount++;
	//Output relevant param declaration.
	output("(param $loc" + std::to_string(paramID) + " i32)"); 
	
	return true; //Don't go beyond this. Well, there should be no children to this tree but best be safe.
}

bool handleVars(ASTNode* node) {
	addVarGen(node);
	codeVar(node);
	return true;
}
//This code handles functions declarations and calls. TODO Check Validity
bool codeFunc(ASTNode* node) {
	if (node->type != "FUNC_DECLARE")  {
		return true; //Keep going.
	}
	//Gather the data
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* funcHeader = childs.at(0);
	ASTNode* block = childs.at(1);
	
	std::vector<ASTNode*> funcHeaderChildren = (funcHeader->children);
	ASTNode* funcDeclarator = funcHeaderChildren.at(1);
	
	std::vector<ASTNode*> funcDeclaratorChildren = (funcDeclarator->children);
	ASTNode* identifier = funcDeclaratorChildren.at(0);
	
	std::string funcName = (identifier->val);
	
	ASTNode* funcTypeNode = funcHeaderChildren.at(0);
	std::string funcType = (funcTypeNode->type);
	
	//Begin the function.
	
	output("(func $" + funcName);
	
	//Pretraversal, coding out all the parameters.
	genGlobals.symtab.push_scope();
	genGlobals.scopeLevel++;
	preTrav(funcHeader, &codeParam);
	//Coding the return parameter
	int returnParam = genGlobals.locVarCount;
	if (funcType != "TYPE_VOID") {
		genGlobals.locVarCount++;
		output("(result i32)");
		output("(local $ret" + std::to_string(returnParam) + " i32)");
	}
	//Pretraversal, the block, coding out all the variables
	genGlobals.symtab.push_scope();
	genGlobals.scopeLevel++;
	preTrav(block, &handleVars);
	
	//Pretraversal, coding out the block
	int blockName = genGlobals.blockCount;
	genGlobals.blockCount++;
	output("(block $" + std::to_string(blockName));
	
	std::vector<ASTNode*> blockStatements = (block->children);
	int hasStatements = blockStatements.size();
	if (hasStatements >= 1) {
		ASTNode* blockStatementGroup = blockStatements.at(0);
		codeBlock(blockStatementGroup, std::to_string(blockName), "ret" + std::to_string(returnParam), "");
	}
	output(")");
	if (funcType != "TYPE_VOID") {
		output("(local.get $ret" + std::to_string(returnParam) + ")");
	}
	//Close the function
	output(")");
	//Pop the symbol table scope.
	genGlobals.symtab.pop_scope();
	genGlobals.scopeLevel--;
	//Pop the symbol table scope.
	genGlobals.symtab.pop_scope();
	genGlobals.scopeLevel--;
	return false; //Keep this if I don't trust the pre-post traversal functions. Will need to have handled function close.
}
// This code handles block items
bool codeStatements(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock) {
	codeBlock(node, funcBlockName, returnLocName, currentBlock);
	codeIf(node, funcBlockName, returnLocName, currentBlock);
	codeIfElse(node, funcBlockName, returnLocName, currentBlock);
	codeReturn(node, funcBlockName, returnLocName);
	codeWhile(node, funcBlockName, returnLocName, currentBlock);
	codeFuncInvok(node);
	codeAssign(node);
	codeBreak(node, currentBlock);
	return false;
}
//This function handles blocks in general.
bool codeBlock(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock) {
	//std::cout << "CodeBlock Called \n";
	if (node->type == "BLOCK")  {
		ASTNode* statementBlock = (node->children).at(0);
		//std::cout << "WasBlock Called \n";
		return codeBlock(statementBlock, funcBlockName, returnLocName, currentBlock); //Keep going.
	}
	if (node->type != "BLK_STATEMENTS")  {
		return true; //Keep going.
	}
	
	//std::cout << "Block statement confirmed.\n";
	
	std::vector<ASTNode*> childs = (node->children);
	genGlobals.scopeLevel++;
	genGlobals.symtab.push_scope();
	int blockName = genGlobals.blockCount;
	genGlobals.blockCount++;
	
	std::string locBloc = std::to_string(blockName);
	output("(block $" + locBloc);
	
	for (auto* c:childs) {
		codeBlock(c, funcBlockName, returnLocName, currentBlock);
		codeIf(c, funcBlockName, returnLocName, currentBlock);
		codeIfElse(c, funcBlockName, returnLocName, currentBlock);
		codeReturn(c, funcBlockName, returnLocName);
		codeWhile(c, funcBlockName, returnLocName, currentBlock);
		codeFuncInvokNoRet(c);
		codeAssign(c);
		codeBreak(c, currentBlock);
		//codeVar(c); We want variables to be coded out BEFORE here...
	}
	
	output(")");
	genGlobals.symtab.pop_scope();
	genGlobals.scopeLevel--;
	return false;
}

bool codeIf(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock) {
	//std::cout << "CodeIf Called \n";
	if (node->type != "IF")  {
		return true; //Keep going.
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* expr = childs.at(0);
	ASTNode* statement = childs.at(1);
	
	int blockID = genGlobals.blockCount;
	genGlobals.blockCount++;
	output("(block $" + std::to_string(blockID));
	codeExpr(expr);
	
	//This part does a value flip; true to false and false to true. The idea is to skip if false.
	output("i32.const 1");
	output("i32.add");
	output("i32.const 2");
	output("i32.rem_s");
	
	output("br_if $" + std::to_string(blockID));
	codeStatements(statement, funcBlockName, returnLocName, currentBlock);
	output(")");
	return true;
}
bool codeIfElse(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock) {
	//std::cout << "CodeIfElse Called \n";
	if (node->type != "IF_ELSE")  {
		return true; //Keep going.
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* expr = childs.at(0);
	ASTNode* statement = childs.at(1);
	ASTNode* elseStatement =  childs.at(2);
	
	int blockIDIf = genGlobals.blockCount;
	genGlobals.blockCount++;
	int blockIDElse = genGlobals.blockCount;
	genGlobals.blockCount++;
	
	output("(block $" + std::to_string(blockIDElse));
	output("(block $" + std::to_string(blockIDIf));
	codeExpr(expr);
	//This part does a value flip; true to false and false to true. The idea is to skip if false.
	output("i32.const 1");
	output("i32.add");
	output("i32.const 2");
	output("i32.rem_s");
	
	output("br_if $" + std::to_string(blockIDIf));
	codeStatements(statement, funcBlockName, returnLocName, currentBlock);
	output("br $" + std::to_string(blockIDElse));
	output(")");
	codeStatements(elseStatement, funcBlockName, returnLocName, currentBlock);
	output(")");
	return true;
}
bool codeWhile(ASTNode* node, std::string funcBlockName, std::string returnLocName, std::string currentBlock) {
	//std::cout << "CodeWhile Called \n";
	if (node->type != "WHILE")  {
		return true; //Keep going.
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* expr = childs.at(0);
	ASTNode* statement = childs.at(1);
	
	int whileBlock = genGlobals.blockCount;
	genGlobals.blockCount++;
	int whileLoop = genGlobals.blockCount;
	genGlobals.blockCount++;
	
	output("(block $" + std::to_string(whileBlock));
	output("(loop $" + std::to_string(whileLoop));
	
	codeExpr(expr);
	
	//This part does a value flip; true to false and false to true. The idea is to skip if false.
	output("i32.const 1");
	output("i32.add");
	output("i32.const 2");
	output("i32.rem_s");
	
	output("br_if $" + std::to_string(whileBlock));
	
	codeStatements(statement, funcBlockName, returnLocName, std::to_string(whileBlock));
	
	output("br $" + std::to_string(whileLoop));
	output(")");
	output(")");
	return true;
}
bool codeFuncInvok(ASTNode* node) {
	//std::cout << "CodeFuncInvok Called \n";
	if (node->type != "FUNC_INVOK") {
		//std::cout << "FuncInvokNot, Returned. \n";
		return true; //Keep going.
	}
	//std::cout << "Passed nodeTypeCheck \n";
	std::vector<ASTNode*> childs = (node->children);
	//std::cout << "PreChildSize \n";
	int childSize = childs.size();
	//std::cout << "PostChildSize \n";
	if (childSize == 1) {
		ASTNode* identifier = childs.at(0);
		std::string identity = (identifier->val);
		output("call $"+identity);
	}
	else {
		ASTNode* identifier = childs.at(0);
		ASTNode* argList = childs.at(1);
		
		std::vector<ASTNode*> args = (argList->children);
		for (auto c:args) { //NOTE: I assume all of the args are of type expression; I can't actually confirm that.
			//std::cout << "Coding expression pre in funcInvok\n";
			codeExprStackStay(c);
			//std::cout << "Coding expression post.\n";
		}
		
		std::string identity = (identifier->val);
		output("call $"+ identity);
	}
	return true;
}
void dropIfNotVoid(std::string type) {
	if (type != "TYPE_VOID") {
		output("drop");
	}
}
bool codeFuncInvokNoRet(ASTNode* node) { //TODO: NOT DONE! Oi. I need to check the called function type, and then call drop IFF it's not void...
	//std::cout << "CodeFuncInvok Called \n";
	if (node->type != "FUNC_INVOK") {
		//std::cout << "FuncInvokNot, Returned. \n";
		return true; //Keep going.
	}
	//std::cout << "Passed nodeTypeCheck \n";
	std::vector<ASTNode*> childs = (node->children);
	//std::cout << "PreChildSize \n";
	int childSize = childs.size();
	//std::cout << "PostChildSize \n";
	//Gather symbol table data on the function.
	ASTNode* identifier = childs.at(0);
	std::string identity = (identifier->val);
	DeclData idData = genGlobals.symtab.get("FUNC_" + identity);
	std::string type = (idData.subtype);
	if (childSize == 1) {
		output("call $"+identity);
		dropIfNotVoid(type);
	}
	else {
		ASTNode* argList = childs.at(1);
		
		std::vector<ASTNode*> args = (argList->children);
		for (auto c:args) { //NOTE: I assume all of the args are of type expression; I can't actually confirm that.
			//std::cout << "Coding expression pre in funcInvok\n";
			codeExprStackStay(c);
			//std::cout << "Coding expression post.\n";
		}
		output("call $"+ identity);
		dropIfNotVoid(type);
	}
	return true;
}
bool codeBreak(ASTNode* node, std::string blockName) {
	//std::cout << "CodeBreak Called \n";
	if (node->type != "BREAK")  {
		return true; //Keep going.
	}
	output("br $" + blockName);
	return true;
}
bool codeReturn(ASTNode* node, std::string funcBlockName, std::string returnLocName) {
	//std::cout << "CodeReturn Called \n";
	if (node->type != "RETURN")  {
		return true; //Keep going.
	}
	std::vector<ASTNode*> childs = (node->children);
	//std::cout << "Before size check";
	int numReturns = childs.size();
	//std::cout <<  "After size check";
	if (numReturns == 0) {
		output("br $" + funcBlockName);
	}
	else {
		ASTNode* returnExpr = childs.at(0);
		codeExprStackStay(returnExpr);
		output("local.set $" + returnLocName);
		output("br $" + funcBlockName);
	}
	return true;
}
//This code handles the main function
bool codeMain(ASTNode* node) {
	//std::cout << "CodeMain Called \n";
	if (node->type != "MAIN_FUNC_DECLARE")  {
		return true; //Keep going.
	}
	std::vector<ASTNode*> childs = (node->children);
	ASTNode* mainDecl = childs.at(0);
	ASTNode* mainBlock = childs.at(1);
	
	std::vector<ASTNode*> declChilds = (mainDecl->children);
	ASTNode* mainIDNode = declChilds.at(0);
	std::string mainID = (mainIDNode->val);
	
	output("(func $" + mainID);
	int funcBlock = genGlobals.blockCount;
	genGlobals.blockCount++;
	
	//Pretraversal, coding out all the parameters.
	genGlobals.symtab.push_scope();
	genGlobals.scopeLevel++;
	//Pretraversal, the block, coding out all the variables
	genGlobals.symtab.push_scope();
	genGlobals.scopeLevel++;
	preTrav(mainBlock, &handleVars);
	
	std::string funcBlockName = std::to_string(funcBlock);
	output("(block $" + funcBlockName);
	
	//Code the main block. There is no return parameter.
	codeBlock(mainBlock, std::to_string(funcBlock), "", "");
	
	output(")");  //close main function block
	output(")"); //close main function
	
	output("(start $" + mainID + ")");
	//Pop the symbol table scope.
	genGlobals.symtab.pop_scope();
	genGlobals.scopeLevel--;
	//Pop the symbol table scope.
	genGlobals.symtab.pop_scope();
	genGlobals.scopeLevel--;
	return true;
}

//Function that runs it all.
std::vector<std::string> codeProgram(ASTNode* ast){ //, std::ostream& os) {
	codeBegin(ast);
	std::vector<ASTNode*> globalDecls = (ast->children);
	symTabPredefGen();
	for (auto* c : globalDecls) {
		addVarGen(c);
		codeVar(c);
	}
	for (auto* c : globalDecls) {
		addFuncGen(c);
		addMainGen(c);
	}
	for (auto* c : globalDecls) {
		codeFunc(c);
		codeMain(c);
	}
	codeModuleEnd();
	return genGlobals.output;
}