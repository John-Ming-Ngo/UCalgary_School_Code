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

//-Structure to hold strings in, such as for strings and comments.
typedef struct {
	std::string string;
	long number;
	int length;
} StringHolder;

//-Initialize a holder. Basically a global variable to be used to hold stuff in.
StringHolder holder;

//-Line counting variable
int countline = 1;

//-List of tokens recognized by the program.
#define TOKEN_LIST() \
	X(TOK_COMMENT)	\
	X(TOK_ID)		\
	X(TOK_STR)		\
	X(TOK_INT)		\
	X(TOK_TRUE)		\
	X(TOK_FALSE)	\
	X(TOK_TYPE_BOOLEAN)	\
	X(TOK_TYPE_INT)		\
	X(TOK_TYPE_VOID)	\
	X(TOK_IF)		\
	X(TOK_ELSE)		\
	X(TOK_WHILE)	\
	X(TOK_BREAK)	\
	X(TOK_RETURN)	\
	X(TOK_ADD)		\
	X(TOK_SUB)		\
	X(TOK_MUL)		\
	X(TOK_DIV)		\
	X(TOK_MOD)		\
	X(TOK_LT)		\
	X(TOK_GT)		\
	X(TOK_LE)		\
	X(TOK_GE)		\
	X(TOK_ASSIGN)	\
	X(TOK_EQ)		\
	X(TOK_NEQ)		\
	X(TOK_NOT)		\
	X(TOK_AND)		\
	X(TOK_OR)		\
	X(TOK_LPARA)	\
	X(TOK_RPARA)	\
	X(TOK_LCURL)	\
	X(TOK_RCURL)	\
	X(TOK_SEMICOL)	\
	X(TOK_COMMA)	\
	X(TOK_ERROR)
//-Using TA Niran's method of enuming it above, so we can just spam it later with macros.

//-Enuming the tokens. Credit for this method: TA Niran
enum TokenTypes {
	EOF_TOKEN = 0
	
	#define X(NAME) , NAME
	
	TOKEN_LIST()
	
	#undef X
};

//-Gets the name of the token. Originally written by TA Niran.
char const* getTokenName(int tokenType) {
	switch(tokenType) {
	
#define X(NAME) case NAME: return #NAME;
	TOKEN_LIST()
#undef X
		default: return "error token";
	}
}

//-Token data bundle. containing what the token is, its contents, and where it appears. Credit TA Niran
struct Token {
	int tokenType;
	std::string tokenString;
	int lineno;
};

//-I actually have no clue what this is, took it from the tutorials.
inline std::ostream& operator<<(std::ostream& os, Token const& tok) {
		os << "Token: " << getTokenName(tok.tokenType) << " [" << tok.tokenString << "] line: " << tok.lineno;
		return os;
}

//-Main C++ Class for the lexer, needed in C++ mode.

class CPPLexer : public yyFlexLexer {
public:
	CPPLexer(std::istream* is, std::ostream* os) 
		: yyFlexLexer(is, os) 
	{}
	int yylex(); //Write it, do not declare, lex will generate the definition of this function for you.
	
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
	
};

%}

idStart [_a-zA-Z]
idValid [_a-zA-Z0-9] 
num [0-9]

%%

\n		countline++;
\r\n	countline++;

[ \t]		/*Whitespace, don't care*/

"true"		return createToken(TOK_TRUE, yytext, countline);
"false"		return createToken(TOK_FALSE, yytext, countline);
"boolean"	return createToken(TOK_TYPE_BOOLEAN, yytext, countline);
"int"		return createToken(TOK_TYPE_INT, yytext, countline);
"void"		return createToken(TOK_TYPE_VOID, yytext, countline);
"if"		return createToken(TOK_IF, yytext, countline);
"else"		return createToken(TOK_ELSE, yytext, countline);
"while"		return createToken(TOK_WHILE, yytext, countline);
"break"		return createToken(TOK_BREAK, yytext, countline);
"return"	return createToken(TOK_RETURN, yytext, countline);

"+"			return createToken(TOK_ADD, yytext, countline);
"-"			return createToken(TOK_SUB, yytext, countline);
"*"			return createToken(TOK_MUL, yytext, countline);
"/"			return createToken(TOK_DIV, yytext, countline);
"%"			return createToken(TOK_MOD, yytext, countline);
"<"			return createToken(TOK_LT, yytext, countline);
">"			return createToken(TOK_GT, yytext, countline);
"<="		return createToken(TOK_LE, yytext, countline);
">="		return createToken(TOK_GE, yytext, countline);
"="			return createToken(TOK_ASSIGN, yytext, countline);
"=="		return createToken(TOK_EQ, yytext, countline);
"!="		return createToken(TOK_NEQ, yytext, countline);
"!"			return createToken(TOK_NOT, yytext, countline);
"&&"		return createToken(TOK_AND, yytext, countline);
"||"		return createToken(TOK_OR, yytext, countline);

"("			return createToken(TOK_LPARA, yytext, countline);
")"			return createToken(TOK_RPARA, yytext, countline);
"{"			return createToken(TOK_LCURL, yytext, countline);
"}"			return createToken(TOK_RCURL, yytext, countline);
";"			return createToken(TOK_SEMICOL, yytext, countline);
","			return createToken(TOK_COMMA, yytext, countline);

{idStart}{idValid}*	return createToken(TOK_ID, yytext, countline);

"//"				{ holder.string.clear(); BEGIN(COMMENT); }
<COMMENT>"\\b"		{ holder.string += '\b'; }
<COMMENT>"\\f"		{ holder.string += '\f';  }
<COMMENT>"\\t"		{ holder.string += '\t';  }
<COMMENT>"\\r"		{ holder.string += '\r';  }
<COMMENT>"\\n"		{ holder.string += '\n';  }
<COMMENT>"\\\'"		{ holder.string += '\'';  }
<COMMENT>"\\\""		{ holder.string += '\"';  }
<COMMENT>"\\\\"		{ holder.string += '\\';  }	
<COMMENT>[^\n\r\n]	{ holder.string += yytext[0];  }
<COMMENT>\n			{ BEGIN(INITIAL); countline++; return createToken(TOK_COMMENT, holder.string, countline);}
<COMMENT>\r\n		{ BEGIN(INITIAL); countline++; return createToken(TOK_COMMENT, holder.string, countline);}
<COMMENT><<EOF>>	{ BEGIN(INITIAL); countline++; return createToken(TOK_COMMENT, holder.string, countline);}

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
<STRING>"\""	{ BEGIN(INITIAL); return createToken(TOK_STR, holder.string, countline);}
<STRING><<EOF>>	{ BEGIN(INITIAL); return createToken(TOK_ERROR, holder.string, countline);}

{num}+				return createToken(TOK_INT, yytext, countline);

.					{ holder.string = yytext[0]; holder.length = 0; BEGIN(ERROR); }
<ERROR>[^\n\"]		{ holder.string += yytext[0]; }
<ERROR>"\n"			{ BEGIN(INITIAL); return createToken(TOK_ERROR, holder.string, countline);}
<ERROR>"\r\n"		{ BEGIN(INITIAL); return createToken(TOK_ERROR, holder.string, countline);}
<ERROR><<EOF>>		{ BEGIN(INITIAL); return createToken(TOK_ERROR, holder.string, countline);}

%%

// Required by flex. 
// Tells how to behave when end of input is reached.
//New signature for yywrap, no longer a free function in comparison to C.
int yyFlexLexer::yywrap() { return 1; }

//Main function, based off tutorial code by Niran
int main(int argc, char** argv) {
	//Make sure it only takes in one argument
	if(argc != 2) {
		std::cerr << "Error! More or less arguments than 2! \n";
		return 1;
		}
		
	//Open the filestream
	std::ifstream inputFile;
	inputFile.open(argv[1]);
	
	//If it failed to open, terminate
	if(!inputFile.is_open()) {
		std::cerr << "Error! File could not be opened! Check permissions! \n";
		return 1;
		}

	//Make the lexer, feed it the filestream and where to send results out.
	CPPLexer lexer{&inputFile, &std::cout};
	
	int token;
	while((token = lexer.yylex()) != 0) {
		Token const& tok = lexer.getToken();
		
		// Error - output to standard error, and quit.
		if (tok.tokenType == TOK_ERROR) {
			std::cerr << tok << " || Error! Please check the mentioned line! \n";
			return 1;
		}
		
		// No error, just output the token.
		else {
		std::cout << tok << "\n";
		}
	}

	return 0;
}
