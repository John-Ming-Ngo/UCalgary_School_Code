/*Parser for J-- Compiler, John Ming Ngo, 30020834*/
/*Credits to TA Niran for most of the boilerplate at the minimum.*/

/*Begin: Initial Code and Preliminaries*/

/*Declarations*/
%skeleton "lalr1.cc"
%define "parser_class_name" {Parser}
%error-verbose

/*Data Types declaration*/
%union {
	std::string* strVal;
	struct ASTNode* nodeVal;
}

/*Initial include code*/
%{
#include <iostream>
#include "Scanner_30020834.h"
#include "AST.h"
#include "Driver.h"

#undef yylex
#define yylex driver.m_lexer->lex
%}

/*Start Token*/
%start START

/*List of tokens my parser recognizes.*/
%token	<strVal>	 TOK_ID						"ID"
%token	<strVal>	 TOK_STR					"STRING"
%token	<strVal>	 TOK_INT					"NUMBER"
%token	<strVal>	 TOK_TRUE					"TRUE"
%token	<strVal>	 TOK_FALSE					"FALSE"
%token	<strVal>	 TOK_TYPE_BOOLEAN			"BOOLEAN"
%token	<strVal>	 TOK_TYPE_INT				"INT"
%token	<strVal>	 TOK_TYPE_VOID				"VOID"
%token	<strVal>	 TOK_IF						"IF"
%token	<strVal>	 TOK_ELSE					"ELSE"
%token	<strVal>	 TOK_WHILE					"WHILE"
%token	<strVal>	 TOK_BREAK					"BREAK"
%token	<strVal>	 TOK_RETURN					"RETURN"
%token	<strVal>	 TOK_ADD					"+"
%token	<strVal>	 TOK_SUB					"-"
%token	<strVal>	 TOK_MUL					"*"
%token	<strVal>	 TOK_DIV					"/"
%token	<strVal>	 TOK_MOD					"%"
%token	<strVal>	 TOK_LT						"<"
%token	<strVal>	 TOK_GT						">"
%token	<strVal>	 TOK_LE						"LE"
%token	<strVal>	 TOK_GE						"GE"
%token	<strVal>	 TOK_ASSIGN					"="
%token	<strVal>	 TOK_EQ						"EQ"
%token	<strVal>	 TOK_NEQ					"NE"
%token	<strVal>	 TOK_NOT					"!"
%token	<strVal>	 TOK_AND					"AND"
%token	<strVal>	 TOK_OR						"OR"
%token	<strVal>	 TOK_LPARA					"("
%token	<strVal>	 TOK_RPARA					")"
%token	<strVal>	 TOK_LCURL					"{"
%token	<strVal>	 TOK_RCURL					"}"
%token	<strVal>	 TOK_SEMICOL				";"
%token	<strVal>	 TOK_COMMA					","
%token	<strVal>	 TOK_ERROR

/*List of return types for the grammar. It's literally just all nodeVal*/
%type				<nodeVal>					literal
%type				<nodeVal>					globaldeclarations 
%type				<nodeVal>					globaldeclaration 
%type				<nodeVal>					type 
%type				<nodeVal>					variabledeclaration 
%type				<nodeVal>					identifier
%type				<nodeVal>					functiondeclaration
%type				<nodeVal>					functionheader
%type				<nodeVal>					functiondeclarator
%type				<nodeVal>					formalparameterlist
%type				<nodeVal>					formalparameter
%type				<nodeVal>					mainfunctiondeclaration
%type				<nodeVal>					mainfunctiondeclarator
%type				<nodeVal>					block
%type				<nodeVal>					blockstatements
%type				<nodeVal>					blockstatement
%type				<nodeVal>					statement
%type				<nodeVal>					statementexpression
%type				<nodeVal>					primary
%type				<nodeVal>					argumentlist
%type				<nodeVal>					functioninvocation
%type				<nodeVal>					postfixexpression
%type				<nodeVal>					unaryexpression
%type				<nodeVal>					multiplicativeexpression
%type				<nodeVal>					additiveexpression
%type				<nodeVal>					relationalexpression
%type				<nodeVal>					equalityexpression
%type				<nodeVal>					conditionalandexpression
%type				<nodeVal>					conditionalorexpression
%type				<nodeVal>					assignmentexpression
%type				<nodeVal>					assignment
%type				<nodeVal>					expression

/*THe driver struct can be found in driver.h, and the main running function in driver.cpp.*/
%parse-param {struct Driver& driver}

/*Begin: Grammar Rules*/
/* Grammars ENBF */
/* Rule format 
name-of-rule: tokens 
	| other case
	;
*/

%%

START           : /* empty */													
                | globaldeclarations											{driver.m_ast = $1;} //Top of the tree, return it to the driver.
                ;

literal         : "NUMBER"														{$$ = new ASTNode{"NUMBER", {}}; auto* valNode = new ASTNode{driver.m_lexer->getToken().tokenString, {}}; $$->children.push_back(valNode);} //We got a number token, like 123234. We want to append to the tree that we found a NUMBER, then append to that node another node containing that number.
                | "STRING"														{$$ = new ASTNode{"STRING", {}}; auto* valNode = new ASTNode{driver.m_lexer->getToken().tokenString, {}}; $$->children.push_back(valNode);} //Similar to numbers, except with a string.
                | "TRUE"														{$$ = new ASTNode{"TRUE", {}}; auto* valNode = new ASTNode{driver.m_lexer->getToken().tokenString, {}}; $$->children.push_back(valNode);} //Similar to above. Appending the written true/false is probably redundent, but I did it just to be safe.
                | "FALSE"														{$$ = new ASTNode{"FALSE", {}}; auto* valNode = new ASTNode{driver.m_lexer->getToken().tokenString, {}}; $$->children.push_back(valNode);} //Similar to above.
                ;

type            : "BOOLEAN"														{$$ = new ASTNode{"BOOLEAN", {}};} //Append to the tree that a BOOLEAN type declaration was seen.
                | "INT"															{$$ = new ASTNode{"INT", {}};} //Similar to before, except for int.
                ;

globaldeclarations      : globaldeclaration										{$$ = new ASTNode{"GLOB_DECLARE", {$1}};}
                        | globaldeclarations globaldeclaration					{auto* returnNode = new ASTNode{"GLOB_DECLARE", {$2}}; for(auto* c : $1->children) {returnNode->children.push_back(c);} $$ = returnNode;}
                        ;

globaldeclaration       : variabledeclaration									{$$ = $1;} //It doesn't really matter that it's a global declaration, only that it's a variable, function, or main declaration.
                        | functiondeclaration									{$$ = $1;}
                        | mainfunctiondeclaration								{$$ = $1;}
                        ;

variabledeclaration     : type identifier ";"									{$$ = new ASTNode{"VAR_DECLARE", {$1, $2}};} //Label variable declaration here with type and id.
                        ;

identifier              : "ID"													{$$ = new ASTNode{"ID", {}}; auto* valNode = new ASTNode{driver.m_lexer->getToken().tokenString, {}}; $$->children.push_back(valNode);} //Label ID declaration as well as what the ID is here.
                        ;

functiondeclaration     : functionheader block									{$$ = new ASTNode{"FUNC_DECLARE", {$1, $2}};} //Structure of a function: A header and a relevant block of code.
                        ;

functionheader          : type functiondeclarator								{$$ = new ASTNode{"FUNC_HEAD", {$1, $2}};} //Declare function type and name here.
                        | "VOID" functiondeclarator								{$$ = new ASTNode{"FUNC_HEAD", {$2}}; auto* valNode = new ASTNode{"void", {}}; $$->children.push_back(valNode);}
                        ;

functiondeclarator      : identifier "(" formalparameterlist ")"				{$$ = new ASTNode{"FUNC_DEC", {$1, $3}};} //Declare the function name and its parameters here.
                        | identifier "(" ")"									{$$ = new ASTNode{"FUNC_DEC", {$1}};}
                        ;

formalparameterlist     : formalparameter										{$$ = new ASTNode{"FORM_PARAM_LST", {$1}};} //Declare function parameters here.
                        | formalparameterlist "," formalparameter				{auto* returnNode = new ASTNode{"FORM_PARAM_LST", {$3}}; for(auto* c : $1->children) {returnNode->children.push_back(c);} $$ = returnNode;}
                        ;

formalparameter         : type identifier										{$$ = new ASTNode{"FORM_PARAM", {$1, $2}};} //Each parameter must be declared with type and name.
                        ;

mainfunctiondeclaration : mainfunctiondeclarator block							{$$ = new ASTNode{"MAIN_FUNC_DECLARE", {$1, $2}};} //If the main function is identified, it is noted here.
                        ;

mainfunctiondeclarator  : identifier "(" ")"									{$$ = new ASTNode{"MAIN_FUNC", {$1}};} //Main function is just an identifier and no parameters. No type declaration needed.
                        ;

block                   : "{" blockstatements "}"								{$$ = new ASTNode{"BLOCK", {$2}};} //A block of statements enclosed in braces... or no statements at all.
                        | "{" "}"												{$$ = new ASTNode{"BLOCK", {}};}
                        ;

blockstatements         : blockstatement										{$$ = new ASTNode{"BLK_STATEMENTS", {$1}};} //A block of statements, or many blocks of statements, they belong together in the same level of the tree.
                        | blockstatements blockstatement						{auto* returnNode = new ASTNode{"BLK_STATEMENTS", {$2}}; for(auto* c : $1->children) {returnNode->children.push_back(c);} $$ = returnNode;} //This code ensures that all the block statements are at the same level of the tree.
                        ;

blockstatement          : variabledeclaration									{$$ = $1;} //A block statement can be a variable declaration... or a statement.
                        | statement												{$$ = $1;}
                        ;

statement               : block													{$$ = $1;}	//Here are the different type of statements. Blocks are handled before, we don't need to specify them here.
                        | ";"													{$$ = new ASTNode{"EMPTY_STATEMENT", {}};} //Empty statements are a thing we need to note.
                        | statementexpression ";"								{$$ = $1;} // The specific types are more important - see later for assignment and function invocation.
                        | "BREAK" ";"											{$$ = new ASTNode{"BREAK", {}};} //Break is a keyword, code needs to be aware of this.
                        | "RETURN" expression ";"								{$$ = new ASTNode{"RETURN", {$2}};} //RETURN is a keyword, code needs to be aware of this.
                        | "RETURN" ";"											{$$ = new ASTNode{"RETURN", {}};} //Return is a keyword, code needs to be aware of this.
                        | "IF" "(" expression ")" statement						{$$ = new ASTNode{"IF", {$3, $5}};} //If statement, logical
                        | "IF" "(" expression ")" statement "ELSE" statement	{$$ = new ASTNode{"IF_ELSE", {$3, $5, $7}};} //If-else. Note that this leads to the dangling else.
                        | "WHILE" "(" expression ")" statement					{$$ = new ASTNode{"WHILE", {$3, $5}};} //While - like an if statement, but a loop.
                        ;

statementexpression     : assignment											{$$ = $1;} //The notifications for these types were handled elsewhere, no need for another node in the tree.
                        | functioninvocation									{$$ = $1;}
                        ;

primary                 : literal												{$$ = $1;}	//Handled in specifics - Num, String, True, False, above. No need for a general node designating its type.
                        | "(" expression ")"									{$$ = new ASTNode{"(EXPRESSION)", {$2}};} //Indicates it's a paranthesized expression and needs to be a higher precedence.
                        | functioninvocation									{$$ = $1;} //Handled later.
                        ;

argumentlist            : expression											{$$ = new ASTNode{"ARG_LST", {$1}};} //Some sort of expression for the argument
                        | argumentlist "," expression							{auto* returnNode = new ASTNode{"ARG_LST", {$3}}; for(auto* c : $1->children) {returnNode->children.push_back(c);} $$ = returnNode;} //We want these arguments to all be at the same level of the tree.
                        ;

functioninvocation      : identifier "(" argumentlist ")"						{$$ = new ASTNode{"FUNC_INVOK", {$1, $3}};} //Designates the details of function invocation.
                        | identifier "(" ")"									{$$ = new ASTNode{"FUNC_INVOK", {$1}};}
                        ;

postfixexpression       : primary												{$$ = $1;} //Handled before, no need for another node here.
                        | identifier											{$$ = $1;}
                        ;

unaryexpression         : "-" unaryexpression									{$$ = new ASTNode{"NEGATE", {$2}};} //Unary operators have some of the... highest precedence it appears. Just, it's easy to fail to match, so it won't override 2-place operators.
                        | "!" unaryexpression									{$$ = new ASTNode{"!", {$2}};}
                        | postfixexpression										{$$ = $1;}
                        ;

multiplicativeexpression: unaryexpression										{$$ = $1;}
                        | multiplicativeexpression "*" unaryexpression			{$$ = new ASTNode{"*", {$1, $3}};} 
                        | multiplicativeexpression "/" unaryexpression			{$$ = new ASTNode{"/", {$1, $3}};}
                        | multiplicativeexpression "%" unaryexpression			{$$ = new ASTNode{"%", {$1, $3}};}
                        ;

additiveexpression      : multiplicativeexpression								{$$ = $1;}
                        | additiveexpression "+" multiplicativeexpression		{$$ = new ASTNode{"+", {$1, $3}};}
                        | additiveexpression "-" multiplicativeexpression		{$$ = new ASTNode{"-", {$1, $3}};}
                        ;

relationalexpression    : additiveexpression									{$$ = $1;}
                        | relationalexpression "<" additiveexpression			{$$ = new ASTNode{"<", {$1, $3}};}
                        | relationalexpression ">" additiveexpression			{$$ = new ASTNode{">", {$1, $3}};}
                        | relationalexpression "LE" additiveexpression			{$$ = new ASTNode{"LE", {$1, $3}};}
                        | relationalexpression "GE" additiveexpression			{$$ = new ASTNode{"GE", {$1, $3}};}
                        ;

equalityexpression      : relationalexpression									{$$ = $1;}
                        | equalityexpression "EQ" relationalexpression			{$$ = new ASTNode{"EQ", {$1, $3}};}
                        | equalityexpression "NE" relationalexpression			{$$ = new ASTNode{"NE", {$1, $3}};}
                        ;

conditionalandexpression: equalityexpression									{$$ = $1;}
                        | conditionalandexpression "AND" equalityexpression		{$$ = new ASTNode{"AND", {$1, $3}};}
                        ;

conditionalorexpression : conditionalandexpression								{$$ = $1;}
                        | conditionalorexpression "OR" conditionalandexpression	{$$ = new ASTNode{"OR", {$1, $3}};}
                        ;

assignmentexpression    : conditionalorexpression								{$$ = $1;} //Handled before, no need for another node here.
                        | assignment											{$$ = $1;}
                        ;

assignment              : identifier "=" assignmentexpression					{$$ = new ASTNode{"ASSIGNMENT", {$1, $3}};}
                        ;

expression              : assignmentexpression									{$$ = $1;}
                        ;

%%
/* C/C++ code */

// Error handling code!
//This code is invoked whenever the parser stumbles into an error. I print out what the parser thinks
//Then, I consult my lexer to find the current token this parser was dealing with.
//This token contains text AND linecount data, making debug easy.
void yy::Parser::error(std::string const& str) {
	std::cerr << "------------------------------------------------ \n";
	std::cerr << "Error: " << str << "\n";
	std::cerr << "Occurred at line: " << driver.m_lexer->getToken().lineno << "\n";
	std::cerr << "Occurred with : " << driver.m_lexer->getToken().tokenString << "\n";
	std::cerr << "------------------------------------------------ \n";
	exit(1);
}