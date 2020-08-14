chmod +rwx * -R might be needed to unlock the files on linux.
Most of the checking code is in checkerCode.cpp. The functions I want called are in checkerCode.h. It is called in main.cpp, which contains the main function. I made edits to the symbol table as well.

the BreakInWhile.test test file shows the resultant AST that makes it past. As this milestone is focused on the errors, I focused on making a wide variety of tests that should force these errors, then showing that the checker can catch them. I did make sure that this thing works on gen.t18 from ms2 as well.

That's about all, the other important thing is that the typescript shows it in action!

In the event something doesn't work, please contact me! Everything worked in the typescript and when I had it, it must be a misplaced file or something!

-John Ming Ngo, 30020834