#include <iostream>

#include <unordered_map>
#include <vector>
#include "Symbol_Table_30020834.h"
std::ostream& operator<<(std::ostream& os, symbol_table const& table) {
	table.print(os);
	return os;
}