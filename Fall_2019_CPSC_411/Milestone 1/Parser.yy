/*Declarations*/
%skeleton "lalr1.cc"
%define "parser_class_name" {Parser}
%error-verbose

%start START

%token TOK_COMMENT
%token TOK_ID
%token TOK_STR
%token TOK_INT
%token TOK_TRUE
%token TOK_FALSE
%token TOK_TYPE_BOOLEAN
%token TOK_TYPE_INT
%token TOK_TYPE_VOID
%token TOK_IF
%token TOK_ELSE
%token TOK_WHILE
%token TOK_BREAK
%token TOK_RETURN
%token TOK_ADD
%token TOK_SUB
%token TOK_MUL
%token TOK_DIV
%token TOK_MOD
%token TOK_LT
%token TOK_GT
%token TOK_LE
%token TOK_GE
%token TOK_ASSIGN
%token TOK_EQ
%token TOK_NEQ
%token TOK_NOT
%token TOK_AND
%token TOK_OR
%token TOK_LPARA
%token TOK_RPARA
%token TOK_LCURL
%token TOK_RCURL
%token TOK_SEMICOL
%token TOK_COMMA
%token TOK_ERROR

%parse-param {class ::CPPLexer& lexer}

%{
#include "Lexer.h"
#include "AST.h"

#undef yylex
#define yylex lexer.lex

%}

/*Grammar Rules*/
%%

Start: ;

/*C/C++ Code*/
%%
void yy:Parser::error(std::string const& err) {
	std::cerr << "Found Error" << err << "\n";
	exit(1);
}