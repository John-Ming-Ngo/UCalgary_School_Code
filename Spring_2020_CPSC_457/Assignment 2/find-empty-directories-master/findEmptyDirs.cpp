//
// recursively find and print all directories and files in the
// current directory
//

/**
New version only finds empty directories.
John Ming Ngo, original code by Prof. Pavol Federl
30020834
*/

#include <stdio.h>
#include <string>
#include <vector>
#include <sys/types.h>
#include <dirent.h>

int main()
{
  std::vector<std::string> stack;
  stack.push_back(".");
  int fileCount;
  while(!stack.empty()) {
	  
	fileCount = 0; //How many things are in this directory, set it to 0 because we haven't found anything yet.
	
    auto dirname = stack.back();
    stack.pop_back();
    //printf("Current dir: %s\n", dirname.c_str()); //Don't need this.
    DIR * dir = opendir( dirname.c_str());
	
	while(dir != NULL) { //If this program can open the current directory. If not, just go to the next file. No biggie.
		dirent * de = readdir( dir);
		//printf("FileCount: %i\n", fileCount);
		if(! de){ //If no more valid files.
			if (fileCount == 0) {
				printf("%s\n", dirname.c_str()); //If there's no more valid files in the directory, and we found no files before, print its name.
			}
			break;
		} //If the next entry is null, we are done.
		std::string name = de-> d_name;
		if( name == "." || name == ".."){
			continue; 
		}// Don't add itself to the stack.
		else {
			fileCount++; //There must have been a file. Increment the counter.
		}
		std::string path = dirname + "/" + de-> d_name;
		stack.push_back( path);
    }
    closedir(dir);
  }

  return 0;
}
