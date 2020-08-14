/**********************************************
 * Last Name:   Ngo
 * First Name:  Ming (legally; but I prefer to be called John)
 * Student ID:  30020834
 * Course:      CPSC 457
 * Tutorial:    T03
 * Assignment:  1
 *
 * File name: myWc.cpp
 *********************************************/
// Method used: Like the stream method, except I'm writing my own getchar, as suggested in the lecture.
#include <stdio.h>
#include <unistd.h>
#include <ctype.h>
#include <cstdint>
#include <iostream> //used for debugging purposes

/**
Detecting end of file is hard. In particular:

	   "On files that support seeking, the read operation commences at the
       file offset, and the file offset is incremented by the number of
       bytes read.  If the file offset is at or past the end of file, no
       bytes are read, and read() returns zero." 
	   
	   According to the linux manual. So, EOF is running into read() returning 0 then. Except null bytes can actually mess this up...
	   
	   Consider if I only checked 1 byte per read. When i run into end of file, it returns the null byte and the read function returns 0. Except it's possible for someone to write a text file that has a null byte in between! Oi! The best I can think of is to check for that up to the read size of my program; hopefully that is sufficient, because they can put null bytes (\0) in between their words, or within their words, and it gets weird or silly because of that.
	   
	   Alright, so here's my final problem and results: Whenever I call read, when it runs into the actual end of file, it does NOT!!! have an EOF token in the buffer at the right position. It just instead pads the buffer with zeroes the entire time. However, it CAN distinguish between its own 0-byte paddings and users trying to screw with them by throwing in a "Hello \00 there" situation for... some reason. So long as I reinsert in the EOF manually, everything fixes itself.
*/

//My code, depends on read();

//Constants: Sets up the reading buffer.
const int READ_SIZE = 1048576; //One megabyte
char readBuffer[READ_SIZE];
int readPos = READ_SIZE + 1; //Current reading position; want to set to say 'we haven't read anything yet'

//My getchar function, uses the global constants above.
char myGetchar(int fd) {
	char retChar; //Assumes data is already loaded into the buffer
	if (readPos < READ_SIZE) {
		
		//std::cout << "Getting\n";
		
		retChar = readBuffer[readPos];
		readPos++;
	}
	else { //End of buffer, load next part into buffer.
		
		//std::cout << "Reading\n";
		
		readPos = 0;
		int bytesRead = read(fd, readBuffer, READ_SIZE);
		if (bytesRead < READ_SIZE) {
			readBuffer[bytesRead] = EOF; //Detect EOF by inserting an EOF token. Unfortunately, for unknown reasons, whenever I try to run my program, it doesn't actually insert in an EOF on its own, so I get into an infinite loop, so I need to account for it myself.
		}
		retChar = readBuffer[readPos];
		readPos++;
	}
	if (retChar == EOF) {
		return EOF;
	}
	return retChar;
}

//Most of this code by Prof. Pavol Federl.
int main( int, char **)
{
  int fd = STDIN_FILENO; // input will be standard input //Taken from Prof's other code; it's just a global constant, probably in a library.
  // our boolean mini-state, true = we are in a middle of a word
  bool inside_word = false;
  // setup 3 counters
  int word_count = 0;
  int line_count = 0;
  int char_count = 0;
  
  while(1) {
    // read in a single character
    char c = myGetchar(fd); //MY GETCHAR RIGHT HERE!!
	//std::cout << "Char:" << c << "\n"; // For debugging purposes
    if( c == EOF) break; // quit loop on EOF
    // count every character
    char_count ++;
    // count new lines
    if( c == '\n') {
      line_count ++;
    }
    // update our state
    if( isspace(c)) {
      inside_word = false;
    }
    else {
      // update word count if starting a new word
      if( ! inside_word) word_count ++;
      inside_word = true;
    }
  }

  // print results
  printf( "%7d %7d %7d\n",
	  line_count,
	  word_count,
	  char_count
	  );

  return 0;
}