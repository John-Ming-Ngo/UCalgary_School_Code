#pragma once

#include <string>
#include <vector>

#include <functional>

#include <iostream>

#include "location.hh"

// Macros to generate the names of the different types of nodes quickly
#define NODE_TYPES()  \
    X(NODE_SCOPE)     \
    X(NODE_DECL)      \
    X(NODE_FUN_DECL)  \
    X(NODE_FUN_ARGS)  \
    X(NODE_ARG_DECL)  \
    X(NODE_FUNC_BODY) \
                      \
    X(NODE_IF)        \
    X(NODE_RETURN)    \
                      \
    X(NODE_LE)        \
    X(NODE_EQ)        \
                      \
    X(NODE_ADD)       \
    X(NODE_ASSIGN)    \
    X(NODE_ID)        \
                      \
    X(NODE_ICONST)    \
    X(NODE_BCONST)    \
    X(NODE_CALL)      \
    X(NODE_EXPR_LIST) \
    X(NODE_DECL_LIST)

enum ast_node_types {

#define X(NAME) NAME,
    NODE_TYPES()
#undef X
        TOTAL_NODES
};

inline char const* getName(int val) {
    switch (val) {
#define X(NAME) \
    case NAME:  \
        return #NAME;
        NODE_TYPES()
#undef X
        default:
            return "";
    }
}

#undef NODE_TYPES

enum prog_value_types { INT, BOOL, VOID, FUNC_TYPE };
inline std::string get_type_name(prog_value_types type) {
    switch (type) {
        case INT:
            return "int";
        case BOOL:
            return "bool";
        case VOID:
            return "void";
        case FUNC_TYPE:
            return "func";
        default:
            return "UNKNOWN";
    }
}

struct ast_decl_list {
    static const auto node_type = NODE_DECL_LIST;
};

struct ast_scope {
    int type = 0;
    static const auto node_type = NODE_SCOPE;
};
struct ast_decl {
    int type;
    std::string name;
    static const auto node_type = NODE_DECL;
};
struct ast_fun_decl {
    std::string name;
    int return_type;
    static const auto node_type = NODE_FUN_DECL;
};
struct ast_fun_args {
    static const auto node_type = NODE_FUN_ARGS;
};
struct ast_arg_decl {
    int type;
    std::string name;
    static const auto node_type = NODE_ARG_DECL;
};
struct ast_if {
    static const auto node_type = NODE_IF;
};
struct ast_return {
    static const auto node_type = NODE_RETURN;
};
struct ast_le {
    static const auto node_type = NODE_LE;
};
struct ast_eq {
    static const auto node_type = NODE_EQ;
};
struct ast_add {
    static const auto node_type = NODE_ADD;
};
struct ast_assign {
    std::string name;
    static constexpr auto node_type = NODE_ASSIGN;
};
struct ast_id {
    std::string name;
    static constexpr auto node_type = NODE_ID;
};
struct ast_iconst {
    int value;
    static constexpr auto node_type = NODE_ICONST;
};
struct ast_bconst {
    bool value;
    static constexpr auto node_type = NODE_BCONST;
};
struct ast_call {
    std::string name;
    static constexpr auto node_type = NODE_CALL;
};
struct ast_expr_list {
    static constexpr auto node_type = NODE_EXPR_LIST;
};

struct ast_func_body {
    static constexpr auto node_type = NODE_FUNC_BODY;
};

struct node_data {
    ast_node_types type;
    void* data;
};

template <class T>
node_data make_data(T val) {
    return node_data{T::node_type, new T{val}};
}
template <class T>
T* data_is(node_data data) {
    if (T::node_type == data.type) {
        return (T*)data.data;
    }
    return nullptr;
}

// A type to store all the information about a declaration in a node
// Covers three cases of a declaration
// 0: no declaration
// 1: an id in isolation
// 2: a declaration with a type

// Function to print declarations, used in the generic function print_ast
inline std::ostream& operator<<(std::ostream& os, node_data const& decl) {
    os << "node_type: " << getName(decl.type);
    if (auto* n = data_is<ast_decl>(decl)) {
        os << ", name: " << n->name;
        os << ", type: ";
        if (n->type == INT)
            os << "int";
        else
            os << "bool";
    } else if (auto* n = data_is<ast_fun_decl>(decl)) {
        os << ", name: " << n->name;
        os << ", return_type: ";
        if (n->return_type == INT)
            os << "int";
        else
            os << "bool";
    } else if (auto* n = data_is<ast_assign>(decl)) {
        os << ", name: " << n->name;
    } else if (auto* n = data_is<ast_id>(decl)) {
        os << ", name: " << n->name;
    } else if (auto* n = data_is<ast_iconst>(decl)) {
        os << ", value: " << n->value;
    } else if (auto* n = data_is<ast_bconst>(decl)) {
        os << ", value: " << n->value;
    } else if (auto* n = data_is<ast_call>(decl)) {
        os << ", name: " << n->name;
    }
    return os;
}

// Templated node type with some data as it's child type
template <class Data>
struct node_impl {
    Data data;
    std::vector<node_impl<Data>*> children;
    yy::location loc;
};

// As node is being used in the parser, it requires them to be in the
// namespace yy
namespace yy {
// alias node_impl<Decl> as node
using node = node_impl<node_data>;
}  // namespace yy

// Generic function to print ast information
template <class T>
inline void print_ast(node_impl<T>* n, int depth = 0) {
    for (int i = 0; i < depth; ++i)
        std::cout << "    ";
    std::cout << "{ ";
    std::cout << n->data;
    std::cout << " }\n";

    for (auto* c : n->children) {
        print_ast(c, depth + 1);
    }
}

// return value is only used during the pre-traversal to break out early!
// when pre returns false, stop traversal
// when pre returns true, continue traversal
template <class Data, class PreFunc, class PostFunc>
bool pre_post_traversal(node_impl<Data>* node, PreFunc pre, PostFunc post) {
    if (!pre(node))
        return false;

    for (auto* c : node->children) {
        if (!pre_post_traversal(c, pre, post))
            return false;
    }

    post(node);
    return true;
}

// implement other traversals in terms of more general traversal
template <class Data, class Func>
bool pre_traversal(node_impl<Data>* node, Func pre) {
    return pre_post_traversal(node, pre, [](auto*) {});
}
template <class Data, class Func>
void post_traversal(node_impl<Data>* node, Func post) {
    pre_post_traversal(
        node, [](auto*) { return true; }, post);
}

