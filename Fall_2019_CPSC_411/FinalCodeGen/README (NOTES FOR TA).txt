chmod +rwx * -R might be needed to unlock the files on linux.
Most of the checking code is in checkerCode.cpp. The functions I want called are in checkerCode.h. It is called in main.cpp, which contains the main function. I made edits to the symbol table as well.

Virtually all of the code generation code is in codegen.cpp. Its main function, codeProgram, is called in main. It does not use the symbol table from checkerCode, instead calling on its own to handle any issues that show up.

-John Ming Ngo, 30020834