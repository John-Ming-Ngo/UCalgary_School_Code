%option  c++
%option yyclass="lexer"

%{
#include <iostream>
#include <fstream>
#include <string>

#include "lexer.h"

%}


%%

"void"      { return yy::parser::token::VOID; }


"int" 		{ return yy::parser::token::INT; }
[0-9]+      { m_val->iVal = std::stoi(yytext); return yy::parser::token::ICONST; }

"bool"	    { return yy::parser::token::BOOL; }
"true"	    { m_val->bVal = true;  return yy::parser::token::BCONST; }
"false"	    { m_val->bVal = false; return yy::parser::token::BCONST; }

"fun"       { return yy::parser::token::FUN; }
"->"        { return yy::parser::token::ARROW; }
"if"        { return yy::parser::token::IF; }
"return"    { return yy::parser::token::RETURN; }

"("			{ return yy::parser::token::LPAREN; }
")"			{ return yy::parser::token::RPAREN; }

"{"			{ return yy::parser::token::LSQUIG; }
"}"			{ return yy::parser::token::RSQUIG; }

"+"			{ return yy::parser::token::ADD; }
"="		    { return yy::parser::token::ASSIGN; }

"<="        { return yy::parser::token::LE; }
"=="	    { return yy::parser::token::EQ; }

";"		    { return yy::parser::token::SEMI; }
","		    { return yy::parser::token::COMMA; }

[a-zA-Z_][0-9a-zA-Z_]*  { m_val->strVal = new std::string{yytext}; return yy::parser::token::ID; }
[ \t\r]			/* ignore */
\n			++m_lineno;

. 			{ std::cerr << "Lexer error on '" << yytext << "' on line " << m_lineno << "\n"; exit(1); }

%%

int yyFlexLexer::yywrap() { return 1; }
