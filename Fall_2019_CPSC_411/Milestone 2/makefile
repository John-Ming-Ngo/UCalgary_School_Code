all: Parser_30020834.out

parser.source: Parser_30020834.yy
	bison Parser_30020834.yy
	bison -d Parser_30020834.yy

Scanner_30020834.yy.cc: parser.source Scanner_30020834.l
	flex -o Scanner_30020834.yy.cc Scanner_30020834.l

Parser_30020834.out: Driver.cpp Driver.h Scanner_30020834.yy.cc parser.source
	g++ -std=c++17 -o Parser_30020834.out Driver.cpp Scanner_30020834.yy.cc Parser_30020834.tab.cc

clean:
	rm *.cc *.hh *.out

