John Ming Ngo, 30020834 submission.

chmod +rwx * -R might be needed to unlock the files on linux.

Most of the checking code is in checkerCode.cpp. The functions I want called are in checkerCode.h. It is called in main.cpp, which contains the main function. I made edits to the symbol table as well.

Virtually all of the code generation code is in codegen.cpp. Its main function, codeProgram, is called in main. It does not use the symbol table from checkerCode, instead calling on its own to handle any issues that show up.

The typescript file is massive, and is called FinalCodeGenResults30020834. Check that file out!

I believe I have compiled enough files to demonstrate the runtime system of printi, prints, and printb all work as expected. Furthermore, as shown in the typescript file, every test works.

All the code was used from Milestones 1-3. I did not take plan b. 

Reviewing the typescript file... holy balls it's massive. Please skip roughly to the very bottom 5% if you only need the proof it works; I printed out both the AST AND the code into the file; the result is horrifically long. The proof that the compiled files run is at the very bottom.

-John Ming Ngo, 30020834