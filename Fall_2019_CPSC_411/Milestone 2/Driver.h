#pragma once
#include <memory>

#include "AST.h"
#include "Scanner_30020834.h"
#include "Parser_30020834.tab.hh"

/*This code is entirely by TA Niran*/
namespace yy {
struct Driver {
	Driver() = default;
	Driver(Driver const&) = delete;

	std::unique_ptr<CPPLexer> m_lexer;
	std::unique_ptr<Parser> m_parser;
	ASTNode* m_ast;

	ASTNode* parse(std::istream* is);
};

}
