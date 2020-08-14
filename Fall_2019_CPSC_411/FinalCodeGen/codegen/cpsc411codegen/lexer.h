#pragma once
#include <fstream>

#include "parser.h"


#ifndef yyFlexLexerOnce
#include <FlexLexer.h>
#endif

class lexer : public yyFlexLexer { 
public:
	lexer(std::istream* is, std::ostream* os) 
		: yyFlexLexer(is, os) {}
	int yylex();
	int lex(yy::parser::semantic_type* val, yy::parser::location_type* loc) { 
		m_val = val;
		*loc = yy::location{yy::position{nullptr, m_lineno, 1}, yy::position{nullptr, m_lineno, 1}};
		return yylex(); 
	}
	
private:
	int m_lineno = 1;
	yy::parser::semantic_type* m_val;
};
