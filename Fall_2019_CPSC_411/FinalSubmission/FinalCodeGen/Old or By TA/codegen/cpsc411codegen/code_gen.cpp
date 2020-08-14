#include "code_gen.h"

#include <cassert>
#include <sstream>

void insert_tabs(int depth, std::ostream& os) {
    for (int i = 0; i < depth; ++i)
        os << "    ";
}
struct decorate {
    std::function<void(yy::node*)> pre;
    std::function<void(yy::node*)> post;
};

struct gen_context {
    struct tc_impl {};
    struct line_impl {
        int tab_depth;
        std::string message;
    };
    struct add_impl {
        std::string message;
    };
    int tab_depth = 0;
    std::unordered_map<yy::node*, decorate> decorations;

    add_impl add(std::string const& message, bool firstSpace = true) {
        if (firstSpace)
            return add_impl{" " + message};
        return add_impl{message};
    }

    add_impl add_name(std::string const& name) { return add("$" + name); }
    add_impl add_iconst(int val) {
        std::stringstream ss;
        ss << val;
        return add(ss.str());
    }
    add_impl add_bconst(bool val) {
        std::stringstream ss;
        ss << val;
        return add(ss.str());
    }

    add_impl add_param(std::string const& name) {
        std::stringstream ss;
        ss << "(param $" << name << " i32)";
        return add(ss.str());
    }
    add_impl add_local(std::string const& name) {
        std::stringstream ss;
        ss << "(local $" << name << " i32)";
        return add(ss.str());
    }

    tc_impl indent() {
        ++tab_depth;
        return {};
    }
    tc_impl dedent() {
        --tab_depth;
        return {};
    }

    // generates a new line tabbed in
    line_impl line(std::string const& content) { return {tab_depth, content}; }
};

std::ostream& operator<<(std::ostream& os, gen_context::line_impl const& gen) {
    os << "\n";
    insert_tabs(gen.tab_depth, os);
    return os << gen.message;
}
std::ostream& operator<<(std::ostream& os, gen_context::add_impl const& gen) {
    return os << gen.message;
}
std::ostream& operator<<(std::ostream& os, gen_context::tc_impl const& gen) {
    return os;
}

bool code_pre(gen_context& gc,
              semantic_context& ctx,
              yy::node* node,
              std::ostream& output);
void code_post(gen_context& gc,
               semantic_context& ctx,
               yy::node* node,
               std::ostream& output);

void code_gen(semantic_context& sc, yy::node* ast, std::ostream& output) {
    gen_context gc;

    pre_post_traversal(
        ast,
        [&](yy::node* node) -> bool { return code_pre(gc, sc, node, output); },
        [&](yy::node* node) { code_post(gc, sc, node, output); });
}

bool code_pre(gen_context& gc,
              semantic_context& sc,
              yy::node* node,
              std::ostream& os) {
    auto iter = gc.decorations.find(node);
    if (iter != gc.decorations.end()) {
        iter->second.pre(node);
    }

    if (auto* n = data_is<ast_decl_list>(node->data)) {
        os << gc.add("(module", false) << gc.indent();
        os << gc.line(
            R"((import "host" "putchar" (func $putchar (param i32))))");
        os << gc.line(
            R"((import "host" "getchar" (func $getchar (result i32))))");
    } else if (auto* n = data_is<ast_fun_decl>(node->data)) {
        std::stringstream ss;
        ss << "(func $" << n->name;
        os << gc.line(ss.str());
        for (auto* arg : node->children[0]->children) {
            auto* arg_data = data_is<ast_arg_decl>(arg->data);
            assert(arg_data);
            os << gc.add_param(arg_data->name);
        }

        auto* ent = sc.assoc[node];
        if (ent->type.back() != VOID)
            os << gc.add("(result i32)");

        for (auto* local : node->children[1]->children) {
            auto* local_data = data_is<ast_decl>(local->data);
            if (!local_data)
                continue;
            os << gc.add_local(local_data->name);
        }
        os << gc.indent();
    } else if (auto* n = data_is<ast_decl>(node->data)) {
        auto* ent = sc.assoc[node];
        assert(ent);
        if (ent->is_global)
            os << gc.line("(global") << gc.add_name(n->name)
               << gc.add("(mut i32)") << gc.add("(i32.const 0)") << gc.add(")");

    } else if (auto* n = data_is<ast_if>(node->data)) {
        os << gc.line("(if") << gc.indent();
        gc.decorations[node->children[0]] = {
            [&os, &gc](yy::node*) {
                os << gc.line("(block (result i32)") << gc.indent();
            },
            [&os, &gc](yy::node*) { os << gc.dedent() << gc.line(")"); }};

        gc.decorations[node->children[1]] = {
            [&os, &gc](yy::node*) { os << gc.line("(then ") << gc.indent(); },
            [&os, &gc](yy::node*) { os << gc.dedent() << gc.line(")"); }};
    }

    return true;
}

void code_post(gen_context& gc,
               semantic_context& sc,
               yy::node* node,
               std::ostream& os) {
    if (auto* n = data_is<ast_decl_list>(node->data)) {
        os << gc.line("(start $main)") << gc.dedent() << gc.line(")");
    } else if (auto* n = data_is<ast_fun_decl>(node->data)) {
        os << gc.dedent() << gc.line(")");
    } else if (auto* n = data_is<ast_assign>(node->data)) {
        auto* entry = sc.assoc[node];
        assert(entry);
        if (entry->is_global) {
            os << gc.line("") << "global.set" << gc.add_name(n->name);
        } else {
            os << gc.line("") << "local.set" << gc.add_name(n->name);
        }
    } else if (auto* n = data_is<ast_iconst>(node->data)) {
        os << gc.line("") << "i32.const" << gc.add_iconst(n->value);
    } else if (auto* n = data_is<ast_bconst>(node->data)) {
        os << gc.line("") << "i32.const" << gc.add_bconst(n->value);
    } else if (auto* n = data_is<ast_add>(node->data)) {
        os << gc.line("") << "i32.add";
    } else if (auto* n = data_is<ast_le>(node->data)) {
        os << gc.line("") << "i32.le_s";
    } else if (auto* n = data_is<ast_eq>(node->data)) {
        os << gc.line("") << "i32.eq";
    } else if (auto* n = data_is<ast_id>(node->data)) {
        auto* entry = sc.assoc[node];
        assert(entry);
        if (entry->is_global) {
            os << gc.line("") << "global.get" << gc.add_name(n->name);
        } else {
            os << gc.line("") << "local.get" << gc.add_name(n->name);
        }
    } else if (auto* n = data_is<ast_call>(node->data)) {
        os << gc.line("") << "call" << gc.add_name(n->name);
    } else if (auto* n = data_is<ast_if>(node->data)) {
        os << gc.dedent() << gc.line(")");
    }

    auto iter = gc.decorations.find(node);
    if (iter != gc.decorations.end()) {
        iter->second.post(node);
    }
}
