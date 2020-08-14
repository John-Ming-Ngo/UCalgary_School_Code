all: compiler.out

compiler.out: lex.yy.cc parser.tab.hh parser.tab.cc semantic_check.cpp ast.cpp main.cpp code_gen.cpp
	g++ -std=c++17 -o compiler.out *.cc *.cpp -Wno-register


parser.tab.hh parser.tab.cc &: parser.yy ast.h
	bison parser.yy
	bison -d parser.yy

lex.yy.cc: lex.flex
	flex -o lex.yy.cc lex.flex

clean: 
	rm *.cc *.hh *.out
