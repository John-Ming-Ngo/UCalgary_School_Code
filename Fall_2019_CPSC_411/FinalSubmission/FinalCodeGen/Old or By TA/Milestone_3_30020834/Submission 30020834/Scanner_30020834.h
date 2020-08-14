#pragma once
#include <string>
#include <iostream>

#include "Parser_30020834.tab.hh"

#ifndef yyFlexLexerOnce 
#include <FlexLexer.h>
#endif

/*By: John Ming Ngo, 30020834. Various data structures and classes used by the lexer... AND PARSER*/

//-Structure to hold strings in, such as for strings and comments.
typedef struct {
	std::string string;
	long number;
	int length;
} StringHolder;

//-Token data bundle. containing what the token is, its contents, and where it appears. Credit TA Niran
struct Token {
	int tokenType;
	std::string tokenString;
	int lineno;
};

//-Main C++ Class for the lexer, needed in C++ mode.

class CPPLexer : public yyFlexLexer {
public:
	CPPLexer(std::istream* is = nullptr, std::ostream* os = nullptr) 
		: yyFlexLexer(is, os) 
	{}
	using TokenType = yy::Parser::semantic_type;
	int yylex();
	int lex(TokenType* semval) {
		m_val  = semval;
		return yylex();
	}
	
	//Write it, do not declare, lex will generate the definition of this function for you.
	//This function returns the internally stored token that is an attribute.
	//In this archetecture, only one token is stored at a time! 
	//Control flow: lexer.yylex() advances to find the next token, getToken returns the current token. One does not so much unget the token as much as get the token and don't advance to the next one if it's not what you need.
	Token const& getToken() const { return m_tok; }

private:
	int createToken(int type, std::string str, int lineno) {
		m_tok = Token{type, std::move(str), lineno};
		return type;
	}
	Token m_tok;
	TokenType* m_val;
	
};