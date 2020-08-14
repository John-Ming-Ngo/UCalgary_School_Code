#include "Driver.h"
#include <iostream>
#include <fstream>

/*This code mostly by TA NIran*/
namespace yy {
ASTNode* Driver::parse(std::istream* is) {
	m_ast = nullptr;
	m_lexer = std::make_unique<CPPLexer>(is);
	m_parser = std::make_unique<Parser>(*this);
	m_parser->parse();
	return m_ast;
}
}