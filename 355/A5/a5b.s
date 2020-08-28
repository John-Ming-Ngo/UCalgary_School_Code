//TODO: Cleanup Code
//Author: John Ming Ngo, 30020834.

//For number output formatting, because the string array method seemed even worse.
st:				.string "st" 							//Numbers 1, 21, 31
nd:				.string "nd" 							//Numbers 2, 22
rd:				.string "rd" 							//Numbers 3, 23
th:				.string "th" 							//all else
	
usageMsg:		.string "usage: a5b mm dd yyyy\n"			//The two possible messages this program can display.
dateFormat:		.string "%s %i%s, %i\n"






				.balign 4
				.global main
main:			stp x29, x30, [sp, -16]!			//Standard function starting code.
				mov x29, sp
				
saveArgs:		mov x27, x0
				mov x28, x1
				
checkArguments:	cmp w0, 4								//Check to see if there are exactly three command line arguments passed. (first reserved by program name)
				b.eq beginProcess
				
printUsage:		adrp x0, usageMsg						//If an issue comes up, we print the error message and end the program.
				add x0, x0, :lo12:usageMsg
				bl printf
				b mainEnd
				
beginProcess:	ldr x19, [x28, 8]		//Loading the pointers to each command line argument string in three separate registers.
				ldr x20, [x28, 16]
				ldr x21, [x28, 24]
				
				mov x0, x19								//Processing each of the three from strings into integers.
				bl atoi									//First string.
				mov w19, w0
				
				mov x0, x20								//Second String.
				bl atoi
				mov w20, w0
				
				mov x0, x21								//Third String.
				bl atoi
				mov w21, w0
				
processMonth:	cmp w19, 1								//Check: If the value of the month is less than 1 (January), there's an issue.
				b.lt printUsage
				
				cmp w19, 12								//Check: If the value of the month is greater than 12 (December), there's an issue.
				b.gt printUsage

				add w19, w19, -1						//Array is indexed from 0.
				adrp x22, month							//Load the correct number to month string equivalent into register x1, 
				add x22, x22, :lo12:month				//thereby moving the pointer to the correct month string into the first parameter for printing.
				ldr x1, [x22, w19, sxtw 3]
				
processDate:	mov w2, w20								//Load the date number into the second parameter register.

				cmp w20, 1								//Begin comparing and sorting the date number to get a sense of what ending (st, nd, etc) belong to it.
				b.lt printUsage							//If the date < 1, it's not a real date and is an issue.
				b.eq processOnes						//If date == 1, go to the process that puts on the appropriate ending.
				
				cmp w20, 21								//If date == 21, go to the process that puts on the appropriate ending.
				b.eq processOnes
				
				cmp w20, 31								//If date == 31, go to the process that puts on the appropriate ending.
				b.gt printUsage							//If date > 31, it's not a real date, and is an issue.
				b.eq processOnes
				
				cmp w20, 2								//If date == 2, go to the process that puts on the appropriate ending.
				b.eq processTwos
				
				cmp w20, 22								//If date == 22, go to the process that puts on the appropriate ending.
				b.eq processTwos
				
				cmp w20, 3								//If date == 3, go to the process that puts on the appropriate ending.
				b.eq processThrees
				
				cmp w20, 23								//If date == 23, go to the process that puts on the appropriate ending.
				b.eq processThrees
				
				b processRest							//If it's any other date, goto the process that puts on the appropriate ending.
			
processOnes:	adrp x3, st								//Load the string ending st into the third parameter and then skip to processing the year.
				add x3, x3, :lo12:st
				b processYear

processTwos:	adrp x3, nd								//Load the string ending nd into the third parameter and then skip to processing the year.
				add x3, x3, :lo12:nd
				b processYear

processThrees:	adrp x3, rd								//Load the string ending rd into the third parameter and then skip to processing the year.
				add x3, x3, :lo12:rd
				b processYear

processRest:	adrp x3, th								//Load the string ending th into the third parameter and then skip to processing the year.	
				add x3, x3, :lo12:th
			
processYear:	cmp w21, 0								//Check: Is the year count bigger than 0? If not, we have an issue since we can't factor in CE/BCE at the moment.
				b.lt printUsage
				
				mov w22, 9999
				cmp w21, w22							//Check: Is the year count a four digit number at most? We aren't living in Warhammer 40k after all. It isn't the 10th milleneum yet.
				b.gt printUsage
				
				mov w4, w21								//Set the fourth parameter to be the integer value for the year.
				
printResult:	adrp x0, dateFormat						//If all goes well, load the dateFormat message, which displays the successfully formatted message.
				add x0, x0, :lo12:dateFormat
				bl printf								//Then print it with the relevant parameters.
				
mainEnd:		ldp x29, x30, [sp], --16			//Standard function ending code.
				ret
				