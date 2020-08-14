#include <memory>
#include <string>
#include <vector>
#include <iostream>
#include "Symbol_Table_30020834.h"
#include "AST.h"
bool symTabPredef();
bool symTabGlobals(ASTNode* ast);
bool scopeCheckTest(ASTNode* ast);
bool typeCheckTest(ASTNode* ast);
bool simpleTest(ASTNode* ast);