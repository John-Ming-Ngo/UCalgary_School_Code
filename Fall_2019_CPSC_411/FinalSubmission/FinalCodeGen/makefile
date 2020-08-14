all: Parser_30020834.out

parser.source: Parser_30020834.yy
	bison Parser_30020834.yy
	bison -d Parser_30020834.yy

Scanner_30020834.yy.cc: parser.source Scanner_30020834.l
	flex -o Scanner_30020834.yy.cc Scanner_30020834.l

Parser_30020834.out: Driver.cpp Driver.h Scanner_30020834.yy.cc parser.source
	g++ -std=c++17 -o Compiler_toWAT_3002034.out AST.cpp checkerCode.cpp Symbol_Table_30020834.cpp Driver.cpp main.cpp Scanner_30020834.yy.cc Parser_30020834.tab.cc codeGen.cpp

clean:
	rm *.cc *.hh *.out

