/* ==Declarations Section== */
/*By: John Ming Ngo, 30020834, with code based on the tutorials*/

/*Declaring C++ mode, and name of lexer class.*/
%option c++ 
%option yyclass="CPPLexer"

/*Modes I want the pattern matchng to dip into.*/
%x STRING
%x COMMENT
%x ERROR

%{
/*Preliminary Code Start*/
#include <iostream>
#include <fstream>
#include <string>

/*Include Files*/
#include "Scanner_30020834.h"
#include "Parser_30020834.tab.hh"

//-Initialize a holder. Basically a global variable to be used to hold stuff in.
StringHolder holder;

//-Line counting variable
int countline = 1;

//-Gets the name of the token. Originally written by TA Niran.
char const* getTokenName(int tokenType) {
	switch(tokenType) {
case		 		 yy::Parser::token::TOK_ID				: return		"ID";
case		 		 yy::Parser::token::TOK_STR				: return		"STRING";
case				 yy::Parser::token::TOK_INT				: return		"NUMBER";
case		 		 yy::Parser::token::TOK_TRUE			: return		"TRUE";
case		 		 yy::Parser::token::TOK_FALSE			: return		"FALSE";
case		 		 yy::Parser::token::TOK_TYPE_BOOLEAN	: return		"BOOLEAN";
case		 		 yy::Parser::token::TOK_TYPE_INT		: return		"INT";
case		 		 yy::Parser::token::TOK_TYPE_VOID		: return		"VOID";
case		 		 yy::Parser::token::TOK_IF				: return		"IF";
case		 		 yy::Parser::token::TOK_ELSE			: return		"ELSE";
case		 		 yy::Parser::token::TOK_WHILE			: return		"WHILE";
case		 		 yy::Parser::token::TOK_BREAK			: return		"BREAK";
case		 		 yy::Parser::token::TOK_RETURN			: return		"RETURN";
case		 		 yy::Parser::token::TOK_ADD				: return		"+";
case		 		 yy::Parser::token::TOK_SUB				: return		"-";
case		 		 yy::Parser::token::TOK_MUL				: return		"*";
case		 		 yy::Parser::token::TOK_DIV				: return		"/";
case		 		 yy::Parser::token::TOK_MOD				: return		"%";
case		 		 yy::Parser::token::TOK_LT				: return		"<";
case		 		 yy::Parser::token::TOK_GT				: return		">";
case		 		 yy::Parser::token::TOK_LE				: return		"LE";
case		 		 yy::Parser::token::TOK_GE				: return		"GE";
case		 		 yy::Parser::token::TOK_ASSIGN			: return		"=";
case		 		 yy::Parser::token::TOK_EQ				: return		"EQ";
case		 		 yy::Parser::token::TOK_NEQ				: return		"NE";
case		 		 yy::Parser::token::TOK_NOT				: return		"!";
case		 		 yy::Parser::token::TOK_AND				: return		"AND";
case		 		 yy::Parser::token::TOK_OR				: return		"OR";
case		 		 yy::Parser::token::TOK_LPARA			: return		"(";
case		 		 yy::Parser::token::TOK_RPARA			: return		")";
case		 		 yy::Parser::token::TOK_LCURL			: return		"{";
case		 		 yy::Parser::token::TOK_RCURL			: return		"}";
case		 		 yy::Parser::token::TOK_SEMICOL			: return		";";
case		 		 yy::Parser::token::TOK_COMMA			: return		",";
case		 		 yy::Parser::token::TOK_ERROR			: return		"Error";
		default: return "error token";
	}
}

//-I actually have no clue what this is, took it from the tutorials.
inline std::ostream& operator<<(std::ostream& os, Token const& tok) {
		os << "Token: " << getTokenName(tok.tokenType) << " [" << tok.tokenString << "] line: " << tok.lineno;
		return os;
}

%}

idStart [_a-zA-Z]
idValid [_a-zA-Z0-9] 
num [0-9]

%%

\n		countline++;
\r\n	countline++;

[ \t]		/*Whitespace, don't care*/

"true"		return createToken(yy::Parser::token::TOK_TRUE, yytext, countline);
"false"		return createToken(yy::Parser::token::TOK_FALSE, yytext, countline);
"boolean"	return createToken(yy::Parser::token::TOK_TYPE_BOOLEAN, yytext, countline);
"int"		return createToken(yy::Parser::token::TOK_TYPE_INT, yytext, countline);
"void"		return createToken(yy::Parser::token::TOK_TYPE_VOID, yytext, countline);
"if"		return createToken(yy::Parser::token::TOK_IF, yytext, countline);
"else"		return createToken(yy::Parser::token::TOK_ELSE, yytext, countline);
"while"		return createToken(yy::Parser::token::TOK_WHILE, yytext, countline);
"break"		return createToken(yy::Parser::token::TOK_BREAK, yytext, countline);
"return"	return createToken(yy::Parser::token::TOK_RETURN, yytext, countline);

"+"			return createToken(yy::Parser::token::TOK_ADD, yytext, countline);
"-"			return createToken(yy::Parser::token::TOK_SUB, yytext, countline);
"*"			return createToken(yy::Parser::token::TOK_MUL, yytext, countline);
"/"			return createToken(yy::Parser::token::TOK_DIV, yytext, countline);
"%"			return createToken(yy::Parser::token::TOK_MOD, yytext, countline);
"<"			return createToken(yy::Parser::token::TOK_LT, yytext, countline);
">"			return createToken(yy::Parser::token::TOK_GT, yytext, countline);
"<="		return createToken(yy::Parser::token::TOK_LE, yytext, countline);
">="		return createToken(yy::Parser::token::TOK_GE, yytext, countline);
"="			return createToken(yy::Parser::token::TOK_ASSIGN, yytext, countline);
"=="		return createToken(yy::Parser::token::TOK_EQ, yytext, countline);
"!="		return createToken(yy::Parser::token::TOK_NEQ, yytext, countline);
"!"			return createToken(yy::Parser::token::TOK_NOT, yytext, countline);
"&&"		return createToken(yy::Parser::token::TOK_AND, yytext, countline);
"||"		return createToken(yy::Parser::token::TOK_OR, yytext, countline);

"("			return createToken(yy::Parser::token::TOK_LPARA, yytext, countline);
")"			return createToken(yy::Parser::token::TOK_RPARA, yytext, countline);
"{"			return createToken(yy::Parser::token::TOK_LCURL, yytext, countline);
"}"			return createToken(yy::Parser::token::TOK_RCURL, yytext, countline);
";"			return createToken(yy::Parser::token::TOK_SEMICOL, yytext, countline);
","			return createToken(yy::Parser::token::TOK_COMMA, yytext, countline);

{idStart}{idValid}*	return createToken(yy::Parser::token::TOK_ID, yytext, countline);

"//"				{ holder.string.clear(); BEGIN(COMMENT); }
<COMMENT>"\\b"		{ holder.string += '\b'; }
<COMMENT>"\\f"		{ holder.string += '\f';  }
<COMMENT>"\\t"		{ holder.string += '\t';  }
<COMMENT>"\\r"		{ holder.string += '\r';  }
<COMMENT>"\\n"		{ holder.string += '\n';  }
<COMMENT>"\\\'"		{ holder.string += '\'';  }
<COMMENT>"\\\""		{ holder.string += '\"';  }
<COMMENT>"\\\\"		{ holder.string += '\\';  }	
<COMMENT>[^\n\r\n]	{ holder.string += yytext[0]; }
<COMMENT>\n			{ BEGIN(INITIAL); countline++;}
<COMMENT>\r\n		{ BEGIN(INITIAL); countline++;}
<COMMENT><<EOF>>	{ BEGIN(INITIAL); countline++;}

"\""			{ holder.string.clear() ; holder.length = 0; BEGIN(STRING); }	
<STRING>"\\b"	{ holder.string += '\b';  }
<STRING>"\\f"	{ holder.string += '\f';  }
<STRING>"\\t"	{ holder.string += '\t';  }
<STRING>"\\r"	{ holder.string += '\r';  }
<STRING>"\\n"	{ holder.string += '\n';  }
<STRING>"\\\'"	{ holder.string += '\'';  }
<STRING>"\\\""	{ holder.string += '\"';  }
<STRING>"\\\\"	{ holder.string += '\\';  }	
<STRING>[^\n\"]	{ holder.string += yytext[0];  }
<STRING>\n		{ countline++; }
<STRING>\r\n	{ countline++; }
<STRING>"\""	{ BEGIN(INITIAL); return createToken(yy::Parser::token::TOK_STR, holder.string, countline);}
<STRING><<EOF>>	{ BEGIN(INITIAL); return createToken(yy::Parser::token::TOK_ERROR, holder.string, countline);}

{num}+				return createToken(yy::Parser::token::TOK_INT, yytext, countline);

.					{ holder.string = yytext[0]; holder.length = 0; BEGIN(ERROR); }
<ERROR>[^\n\"]		{ holder.string += yytext[0]; }
<ERROR>"\n"			{ BEGIN(INITIAL); return createToken(yy::Parser::token::TOK_ERROR, holder.string, countline);}
<ERROR>"\r\n"		{ BEGIN(INITIAL); return createToken(yy::Parser::token::TOK_ERROR, holder.string, countline);}
<ERROR><<EOF>>		{ BEGIN(INITIAL); return createToken(yy::Parser::token::TOK_ERROR, holder.string, countline);}

%%

// Required by flex. 
// Tells how to behave when end of input is reached.
//New signature for yywrap, no longer a free function in comparison to C.
int yyFlexLexer::yywrap() { return 1; }