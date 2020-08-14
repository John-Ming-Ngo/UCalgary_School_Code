#pragma once
#include <iostream>

#include <unordered_map>
#include <vector>
//This code is almost entirely TA Niran's, with small edits by me where necessary.

struct DeclData {
	std::string type;
	std::string name;
	int lineno;
	std::string subtype;
	std::vector<DeclData> parameters;
	
	void print(std::ostream& os) const{
		os << type << ", " << name << ", " << lineno << ", " << subtype << ", ";
	}
};

struct symbol_table {
	symbol_table() : m_tables() { push_scope(); }
	//This function checks if the table has the given string input name.
	bool has(std::string const& name) {
		for(int i = m_tables.size() - 1; i >= 0; --i) {
			if(m_tables[i].find(name) != m_tables[i].end())
				return true;
		}
		return false;
	}
	//This function 
	DeclData get(std::string const& name) {
		for(int i = m_tables.size() - 1; i >= 0; --i) {
			auto iter = m_tables[i].find(name);
			if(iter != m_tables[i].end())
				return iter->second;
		}
		std::cerr << name << " was not in symbol table\n";
		exit(8);
	}
	bool exists(std::string const& name) {
		for(int i = m_tables.size() - 1; i >= 0; --i) {
			auto iter = m_tables[i].find(name);
			if(iter != m_tables[i].end())
				return true;
		}
		return false;
	}
	bool existsInScope(std::string const& name) {
		int i = m_tables.size() - 1;
		auto iter = m_tables[i].find(name);
		if(iter != m_tables[i].end()){
			return true;
		}
		return false;
	}

	bool insert(std::string const& name, DeclData val) {
		auto& current = m_tables.back(); 
		return current.try_emplace(name, val).second;
	}

	DeclData set(std::string const& name, DeclData val) {
		for(int i = m_tables.size() - 1; i >= 0; --i) {
			auto iter = m_tables[i].find(name);
			if(iter != m_tables[i].end())
				return iter->second = val;
		}
		std::cerr << name << " was not in symbol table\n";
		exit(8);
	}
	
	void push_scope() { m_tables.push_back({}); }
	void pop_scope() { m_tables.pop_back(); }

	void pushFuncParams(std::string funcName) {
		int scopeNum = m_tables.size() - 1;
		for(auto i = m_tables.crbegin(); i != m_tables.crend(); ++i) {
			int numelems = 0;
			for(auto& e : *i)  {
				std::string key = e.first;
				std::string function = "FUNC_" + funcName;
				if (key.compare(0, function.length(), function) == 0) {
					DeclData funcData = e.second;
					std::vector<DeclData> param = (funcData.parameters);
					int paramSize = param.size();
					for (int j = 0; j < paramSize;  j++) {
						DeclData paramData = param.at(j);
						std::string name = (paramData.name);
						insert(("VAR_" + name), paramData);
					}
				}
			}
		}
	}

	void print(std::ostream& os) const{
		int scopeNum = m_tables.size() - 1;
		for(auto i = m_tables.crbegin(); i != m_tables.crend(); ++i) {
			os << "Scope " << scopeNum << "\n";
			int numelems = 0;
			for(auto& e : *i)  {
				os << "\t(" << e.first << ", ";
				e.second.print(os);
				os << ")\n"; 
				++numelems;
			}
			if(numelems == 0)
				os << "\t<< SCOPE " << scopeNum << " EMPTY  >>\n";
			--scopeNum;
		}
	}


	std::vector<std::unordered_map<std::string, DeclData>> m_tables;
};


std::ostream& operator<<(std::ostream& os, symbol_table const& table);