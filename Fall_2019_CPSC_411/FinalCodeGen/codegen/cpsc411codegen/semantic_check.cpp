#include "semantic_check.h"

#include <cassert>
#include <sstream>

#include "location.hh"
#include "symtab.h"

bool globals_pre(semantic_context& ctx, yy::node* node);
void globals_post(semantic_context& ctx, yy::node* node);

bool decls_pre(semantic_context& ctx, yy::node* node);
void decls_post(semantic_context& ctx, yy::node* node);

bool type_pre(semantic_context& ctx, yy::node* node);
void type_post(semantic_context& ctx, yy::node* node);

bool print_pre(semantic_context& ctx, int& depth, yy::node* node) {
    for (int i = 0; i < depth; ++i) {
        std::cout << "    ";
    }

    std::cout << "{ " << node->data << " } ";
    auto* ent = ctx.assoc[node];
    if (ent)
        std::cout << *ent;
    std::cout << "\n";
    depth += 1;

    return true;
}
void print_post(semantic_context& ctx, int& depth, yy::node* node) {
    --depth;
}
void print_annotated(semantic_context& ctx, yy::node* node) {
    int depth = 0;
    pre_post_traversal(
        node,
        [&ctx, &depth](yy::node* node) -> bool {
            return print_pre(ctx, depth, node);
        },
        [&ctx, &depth](yy::node* node) -> void {
            return print_post(ctx, depth, node);
        });
}

void add_defaults(symbol_table& symtab) {
    symtab.insert("putchar", new entry{{FUNC_TYPE, INT, VOID}});  // void(int)
    symtab.insert("getchar", new entry{{FUNC_TYPE, INT}});        // int()
}

void semantic_error(std::string const& message, yy::location const& loc) {
    std::cerr << "Semantic error: " << message << " at " << loc << "\n";
    exit(8);
}
void insert_or_fail(semantic_context& ctx,
                    void* node,
                    std::string const& name,
                    entry* entry,
                    yy::location const& loc) {
    if (!ctx.symtab.insert(name, entry)) {
        semantic_error("Redefinition of symbol: '" + name + "'", loc);
    }

    ctx.assoc[node] = entry;
}

void expect_type(entry const& type,
                 entry const& expect,
                 std::string const& message,
                 yy::location const& loc) {
    if (type.type != expect.type) {
        std::stringstream ss;
        ss << "Expected " << expect << " in " << message;
        std::cerr << "Got type: " << type << "\n";
        semantic_error(ss.str(), loc);
    }
}

entry* lookup_or_fail(semantic_context& ctx,
                      void* node,
                      std::string const& name,
                      yy::location const& loc) {
    if (!ctx.symtab.has(name)) {
        semantic_error("Use of undefined symbol: '" + name + "'", loc);
    }

    entry* ent = ctx.symtab.get(name);
    ctx.assoc[node] = ent;
    return ent;
}

#define GLOBAL_SCOPE 2
#define FUNC_SCOPE 3

semantic_context semantic_check(yy::node* node) {
    semantic_context ctx;
    add_defaults(ctx.symtab);

    // clang-format off
    pre_post_traversal(
        node,
        [&ctx](yy::node* n) -> bool { return globals_pre(ctx, n); } ,
        [&ctx](yy::node* n) -> void { globals_post(ctx, n);  }
    );

    pre_post_traversal(
        node,
        [&ctx](yy::node* n) -> bool { return decls_pre(ctx, n); } ,
        [&ctx](yy::node* n) -> void { decls_post(ctx, n);  }
    );

    pre_post_traversal(
        node,
        [&ctx](yy::node* n) -> bool { return type_pre(ctx, n); } ,
        [&ctx](yy::node* n) -> void { type_post(ctx, n);  }
    );
    // clang-format on

    if (ctx.main_count == 0) {
        semantic_error("No main function found", node->loc);
    } else if (ctx.main_count != 1) {
        semantic_error("Multiple main functions found", node->loc);
    }

    return ctx;
}

bool globals_pre(semantic_context& ctx, yy::node* node) {
    if (ctx.symtab.get_scope_count() == GLOBAL_SCOPE) {
        if (auto* n = data_is<ast_decl>(node->data)) {
            insert_or_fail(ctx, node, n->name, new entry{{n->type}, true},
                           node->loc);
        } else if (auto* n = data_is<ast_fun_decl>(node->data)) {
            auto* nentry = new entry{};

            nentry->type.push_back(FUNC_TYPE);
            for (auto* child : node->children[0]->children) {
                auto* child_data = data_is<ast_arg_decl>(child->data);
                assert(child_data);

                nentry->type.push_back(child_data->type);
            }
            nentry->type.push_back(n->return_type);

            insert_or_fail(ctx, node, n->name, nentry, node->loc);

            if (n->name == "main") {
                ++ctx.main_count;
                expect_type(*nentry, {{FUNC_TYPE, VOID}}, "main", node->loc);
            }

            ctx.symtab.push_scope();
        }
    }

    if (auto* n = data_is<ast_decl_list>(node->data)) {
        ctx.symtab.push_scope();  // add the global scope
    } else if (auto* n = data_is<ast_scope>(node->data)) {
        ctx.symtab.push_scope();
    }

    return true;
}
void globals_post(semantic_context& ctx, yy::node* node) {
    if (auto* n = data_is<ast_scope>(node->data)) {
        ctx.symtab.pop_scope();
    } else if (auto* n = data_is<ast_fun_decl>(node->data)) {
        ctx.symtab.pop_scope();
    }
}

bool decls_pre(semantic_context& ctx, yy::node* node) {
    if (auto* n = data_is<ast_scope>(node->data)) {
        ctx.symtab.push_scope();
    } else if (auto* n = data_is<ast_decl>(node->data)) {
        auto cscope = ctx.symtab.get_scope_count();
        // std::cout << "cscope " << cscope << "\n";
        if (cscope == GLOBAL_SCOPE) {
            // Do nothing
        } else if (cscope == FUNC_SCOPE) {
            insert_or_fail(ctx, node, n->name, new entry{{n->type}}, node->loc);
        } else {
            semantic_error(
                "Local '" + n->name + "' must be declared in outer most blocks",
                node->loc);
        }
    } else if (auto* n = data_is<ast_fun_decl>(node->data)) {
        ctx.symtab.push_scope();
        for (auto* child : node->children[0]->children) {
            auto* child_data = data_is<ast_arg_decl>(child->data);
            insert_or_fail(ctx, child, child_data->name,
                           new entry{{child_data->type}}, child->loc);
        }
    } else if (auto* n = data_is<ast_id>(node->data)) {
        lookup_or_fail(ctx, node, n->name, node->loc);
    } else if (auto* n = data_is<ast_call>(node->data)) {
        lookup_or_fail(ctx, node, n->name, node->loc);
    } else if (auto* n = data_is<ast_iconst>(node->data)) {
        ctx.assoc[node] = new entry{{INT}};
    } else if (auto* n = data_is<ast_bconst>(node->data)) {
        ctx.assoc[node] = new entry{{BOOL}};
    } else if (auto* n = data_is<ast_assign>(node->data)) {
        lookup_or_fail(ctx, node, n->name, node->loc);
    } else if (auto* n = data_is<ast_return>(node->data)) {
        auto cscope = ctx.symtab.get_scope_count();
        if (cscope != FUNC_SCOPE) {
            semantic_error("return statements must be in outermost block",
                           node->loc);
        }
    }

    return true;
}
void decls_post(semantic_context& ctx, yy::node* node) {
    if (auto* n = data_is<ast_fun_decl>(node->data)) {
        ctx.symtab.pop_scope();
    } else if (auto* n = data_is<ast_scope>(node->data)) {
        ctx.symtab.pop_scope();
    }
}

bool type_pre(semantic_context& ctx, yy::node* node) {
    if (auto* n = data_is<ast_fun_decl>(node->data)) {
        ctx.current_func_type = ctx.assoc[node];
        assert(ctx.current_func_type);
    }

    return true;
}

void type_post(semantic_context& ctx, yy::node* node) {
    if (auto* n = data_is<ast_fun_decl>(node->data)) {
        ctx.current_func_type = nullptr;
    } else if (auto* n = data_is<ast_if>(node->data)) {
        auto* conditional = ctx.assoc[node->children[0]];
        assert(conditional);
        expect_type(*conditional, {{BOOL}}, "if-conditional", node->loc);
    } else if (auto* n = data_is<ast_assign>(node->data)) {
        auto* lhs = ctx.assoc[node];
        auto* rhs = ctx.assoc[node->children[0]];
        assert(lhs);
        assert(rhs);

        expect_type(*rhs, *lhs, "assignment", node->loc);
    } else if (auto* n = data_is<ast_return>(node->data)) {
        auto* ret_type = ctx.current_func_type;
        auto* rhs = ctx.assoc[node->children[0]];

        assert(ret_type);
        assert(rhs);

        expect_type(*rhs, {{ret_type->type.back()}}, "return statement",
                    node->loc);

        ctx.assoc[node] = rhs;

    } else if (auto* n = data_is<ast_le>(node->data)) {
        auto* lhs = ctx.assoc[node->children[0]];
        auto* rhs = ctx.assoc[node->children[1]];
        assert(lhs);
        assert(rhs);

        expect_type(*lhs, {{INT}}, "<= expression", node->loc);
        expect_type(*rhs, {{INT}}, "<= expression", node->loc);

        ctx.assoc[node] = new entry{{BOOL}};
    } else if (auto* n = data_is<ast_eq>(node->data)) {
        auto* lhs = ctx.assoc[node->children[0]];
        auto* rhs = ctx.assoc[node->children[1]];
        assert(lhs);
        assert(rhs);

        expect_type(*lhs, *rhs, "equality expression", node->loc);
        ctx.assoc[node] = new entry{{BOOL}};

    } else if (auto* n = data_is<ast_add>(node->data)) {
        auto* lhs = ctx.assoc[node->children[0]];
        auto* rhs = ctx.assoc[node->children[1]];
        assert(lhs);
        assert(rhs);

        expect_type(*lhs, {{INT}}, "add expression", node->loc);
        expect_type(*rhs, {{INT}}, "add expression", node->loc);

        ctx.assoc[node] = new entry{{INT}};

    } else if (auto* n = data_is<ast_call>(node->data)) {
        auto* func_type = ctx.assoc[node];
        assert(func_type);
        if (func_type->type[0] != FUNC_TYPE) {
            semantic_error(n->name + " was not a function type", node->loc);
        }

        if (node->children.size() != func_type->type.size() - 2) {
            std::stringstream ss;
            ss << n->name << " expects " << func_type->type.size()
               << " arguments but got " << node->children.size();
            semantic_error(ss.str(), node->loc);
        }

        int idx = 1;
        for (auto* child : node->children) {
            auto* child_type = ctx.assoc[child];
            assert(child_type);

            std::stringstream ss;
            ss << "argument " << idx;
            expect_type(*child_type, {{func_type->type[idx]}}, ss.str(),
                        node->loc);
            ++idx;
        }

        ctx.assoc[node] = new entry{{func_type->type.back()}};
    }
}
