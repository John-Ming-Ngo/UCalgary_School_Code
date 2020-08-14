#pragma once

#include <unordered_map>

#include "ast.h"
#include "symtab.h"

struct semantic_context {
    std::unordered_map<void*, entry*> assoc = {};
    symbol_table symtab = {};

    entry* current_func_type = nullptr;
    int main_count = 0;
};

extern void print_annotated(semantic_context& ctx, yy::node* node);

extern semantic_context semantic_check(yy::node* node);
