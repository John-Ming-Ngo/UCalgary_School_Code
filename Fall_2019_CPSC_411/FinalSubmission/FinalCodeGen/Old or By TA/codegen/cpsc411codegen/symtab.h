#pragma once
#include <iostream>

#include <unordered_map>
#include <vector>

#include "ast.h"

struct entry {
    std::vector<int> type;
    bool is_global = false;
};
inline std::ostream& operator<<(std::ostream& os, entry const& table) {
    os << "<";
    bool first = true;
    for (auto t : table.type) {
        if (!first)
            os << ",";
        switch (t) {
            case INT:
                os << "int";
                break;
            case BOOL:
                os << "bool";
                break;
            case VOID:
                os << "void";
                break;
            case FUNC_TYPE:
                os << "func";
                break;
            default:
                os << "UNKNOWN";
                break;
        }
        first = false;
    }
    os << ">";
    if (table.is_global)
        os << " global";
    return os;
}

struct symbol_table {
    using entry_t = entry*;
    symbol_table() : m_tables() { push_scope(); }

    bool has(std::string const& name) {
        for (int i = m_tables.size() - 1; i >= 0; --i) {
            if (m_tables[i].find(name) != m_tables[i].end())
                return true;
        }
        return false;
    }

    entry_t get(std::string const& name) {
        for (int i = m_tables.size() - 1; i >= 0; --i) {
            auto iter = m_tables[i].find(name);
            if (iter != m_tables[i].end())
                return iter->second;
        }
        std::cerr << name << " was not in symbol table\n";
        exit(8);
    }

    bool insert(std::string const& name, entry_t val) {
        auto& current = m_tables.back();
        return current.try_emplace(name, val).second;
    }

    bool set(std::string const& name, entry_t val) {
        for (int i = m_tables.size() - 1; i >= 0; --i) {
            auto iter = m_tables[i].find(name);
            if (iter != m_tables[i].end())
                return iter->second = val;
        }
        std::cerr << name << " was not in symbol table\n";
        exit(8);
    }

    void push_scope() { m_tables.push_back({}); }
    void pop_scope() { m_tables.pop_back(); }

    size_t get_scope_count() const { return m_tables.size(); }

    void print(std::ostream& os) const {
        int scopeNum = m_tables.size() - 1;
        for (auto i = m_tables.crbegin(); i != m_tables.crend(); ++i) {
            os << "Scope " << scopeNum << "\n";
            int numelems = 0;
            for (auto& e : *i) {
                os << "\t(" << e.first << ", " << *e.second << ")\n";
                ++numelems;
            }
            if (numelems == 0)
                os << "\t<< SCOPE " << scopeNum << " EMPTY  >>\n";
            --scopeNum;
        }
    }

    std::vector<std::unordered_map<std::string, entry_t>> m_tables;
};

inline std::ostream& operator<<(std::ostream& os, symbol_table const& table) {
    table.print(os);
    return os;
}
