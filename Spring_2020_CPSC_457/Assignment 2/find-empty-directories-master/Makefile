all: a.out

a.out: myfind.cpp Makefile
	g++ -O2 -Wall findEmptyDirs.cpp

clean:
	rm -f *~ a.out

test: a.out
	./create.sh
	(cd dir1 && ../a.out)
