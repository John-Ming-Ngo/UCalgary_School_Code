//Author: John Ming Ngo, 30020834
//These are the functions utilized by the calculator simulator to perform its actions.

//Constants Definitions







/*Global Variables*/
			.data
			.global sp
sp:			.word 0											//Define global variable int sp.
			.global val
val:		.skip 100*4							//Define global variable int val[Maxval]
			.text

pushMsg:	.string	"error: stack full"
			.balign 4
			.global	push
//Function <push()>
		
			.global push
push:		stp x29, x30, [sp, -16]!					//Standard function initialization.
			mov x29, sp
			
pushParams:	mov w14, w0										//Store the parameter int f
			
			adrp x0, sp										//Load the global variable sp into register w0
			add x0, x0, :lo12:sp
			ldr w0, [x0]
			
			cmp w0, 100									//Compare the value in w0 (sp) to zero.
			b.lt pushIf
			
pushElse:	adrp x0, pushMsg								//Load the pushMsg message into register x0 and print it out. (Print the error message).
			add x0, x0, :lo12:pushMsg
			bl printf
			bl clear										//Clear it.
			mov w0, wzr										//Return the integer value 0.
			b pushStop
			
pushIf:		adrp x0, sp										//Load the global variable sp into register w0
			add x0, x0, :lo12:sp
			ldr w0, [x0]
			
			add w2, w0, 1									//Increment and store the incremented sp value.
			adrp x1, sp					
			add x1, x1, :lo12:sp
			str w2, [x1]
			
			adrp x1, val									//Store the first parameter into the global variable val[sp] at location sp.
			add x1, x1, :lo12:val	
			mov w3, w14
			str	w3, [x1, w0, sxtw 2]

			ldr w0, [x1, w0, sxtw 2]						//Return the value of val[sp].
			
pushStop:	ldp x29, x30, [sp], --16					//Standard function end.
			ret

//Function <pop()>

popMsg:		.string "error: stack empty\n"
			.balign 4
			.global pop
pop:		stp x29, x30, [sp, -16]!					//Standard function initialization.
			mov x29, sp
			
			adrp x0, sp										//Load sp into register w0.
			add x0, x0, :lo12:sp
			ldr w0, [x0]
			
			cmp w0, wzr										//Compare w0 with 0.
			b.gt popIf										//If it's greater than, do the stuff in the if block.

popElse:	adrp x0, popMsg									//Print the pop function error message.
			add x0, x0, :lo12:popMsg
			bl printf
			bl clear										//Clear it.
			mov w0, wzr										//Return 0 as the result.
			b popStop
			
popIf:		adrp x0, sp										//Load sp into register w0.
			add x0, x0, :lo12:sp
			ldr w1, [x0]
			
			add w1, w1, -1									//Decrement the value in w0, and store it in sp again.
			str w1, [x0]
			
			adrp x0, val									//Load the pointer to the global array val into register x0.
			add x0, x0, :lo12:val	
			
			ldr w0, [x0, w1, sxtw 2]						//Return the value of the array val at the location of w0.

popStop:	ldp x29, x30, [sp], --16					//Standard function end.
			ret		


//Function <clear()>
			
			.global clear
clear:		stp x29, x30, [sp, -16]!					//Standard function initialization.
			mov x29, sp
			
			adrp x9, sp										//Load the address of the global variable sp into x9.
			add x9, x9, :lo12:sp
			
			str wzr, [x9]									//Set sp (address in x9) to zero.
			
clearStop:	ldp x29, x30, [sp], --16					//Standard function end.
			ret

//Function <int getop(char,int)>





				.global getop
getop:			stp x29, x30, [sp, (-(16 + 4 + 4+ 8+ 4) & -16)]!				//Standard function initialization.
				mov x29, sp

strArgs:		str x0, [x29, 16 + 4 + 4]						//Store the arguments to the function in memory, since later function calls will overwrite them.
				str w1, [x29, 16 + 4 + 4 + 8]
				
whileGetch:		bl getch									//Call getch and store the result in c
				str w0, [x29, 16 + 4]
				
				cmp w0, ' '									//Check the loop conditions. If what was returned by getch is one of the following three, loop again.
				b.eq whileGetch								//Loop again on input ' '
				
				cmp w0, '\t'
				b.eq whileGetch								//Loop again on input '\t'
				
				cmp w0, '\n'
				b.eq whileGetch								//Loop again on input '\n'
				
ifRet:			cmp w0, '0'									//If the input is a number, return that number. That is, if it's within 0 to 9.
				b.lt returnC
				
				cmp w0, '9'
				b.gt returnC
				
				b doOps										//Else, go on to do some other calculations.
				
returnC:		ldr w0, [x29, 16 + 4]							//Return the value of c and be done.
				b getopStop				

doOps:			ldr w0, [x29, 16 + 4]							//Store the value of c as the first charecter
				ldr x1, [x29, 16 + 4 + 4]
				strb w0, [x1]
	
forStart:		mov w0, 1									//Initialize i to 1, and then start the loop.
				str w0, [x29, 16]
				b forTest
				
forBody:		ldr w0, [x29, 16]							//Load variables for the comparison.
				ldr w1, [x29, 16 + 4 + 4 + 8]
				
				cmp w0, w1									//If i is less than 16 + 4 + 4 + 8.
				b.ge forIncrement
				
				ldr w0, [x29, 16 + 4]							//Set the value of the char in the char array s at position i to c.
				ldr x1, [x29, 16 + 4 + 4]
				ldr w2, [x29, 16]
				strb w0, [x1, w2, sxtw 0]

forIncrement:	ldr w0, [x29, 16]							//Increment i by 1.
				add w0, w0, 1
				str w0, [x29, 16]
				
forTest:		bl getchar									//Get a char, and store the result in c.
				str w0, [x29, 16 + 4]
				
				cmp w0, '0'									//Check this char, if it is less than ASCII 0 or greater than ASCII 9, break out of the loop.
				b.lt iflim
				
				cmp w0, '9'
				b.gt iflim
				
				b forBody									//Else, continue the loop.
iflim:			ldr w0, [x29, 16]							//After breaking out of the loop, check to see if i < 16 + 4 + 4 + 8.
				ldr w1, [x29, 16 + 4 + 4 + 8]
				cmp w0, w1
				
				b.lt ifBody									//if it is, do the if statements. Else, go on to execute the else statements.

ifElse:			b elseLoopTest

elseLoopBody:	bl getchar									//Get a char and store it in c.
				str w0, [x29, 16 + 4]

elseLoopTest:	ldr w0, [x29, 16 + 4]							//Check to see what is inside c: if it is '\n' or -1, break out of the loop. Else, keep looping.
				
				cmp w0, '\n'
				b.eq elseOps
				
				cmp w0, -1
				b.ne elseLoopBody
	
	
elseOps:		ldr w0, [x29, 16 + 4 + 4 + 8]							//Store '\0' in the char array s at the position 16 + 4 + 4 + 8-1.
				add w0, w0, -1
				ldr x1, [x29, 16 + 4 + 4]
				mov w2, wzr									// '\0' doesn't evaluate properly! Used wzr instead.
				strb w2, [x1, w0, sxtw 0]
				
				mov w0, '9'								//Return the constant '9'.
				
				b getopStop									//End the function.
ifBody:			ldr w0, [x29, 16 + 4]							//Ungetch(c).
				bl ungetch
				
				ldr w0, [x29, 16]							//Set the value of the array s at the location i to be '\0'
				ldr x1, [x29, 16 + 4 + 4]
				mov w2, wzr									// '\0' doesn't evaluate properly! I have no idea why it specifically breaks here, but it does.
				strb w2, [x1, w0, sxtw 0]					//So, checking the ASCII table, it is equivalent to zero. So it is used.
				mov w0, '0'	
getopStop:		ldp	x29, x30, [sp], -(-(16 + 4 + 4+ 8+ 4) & -16)
				ret

/* Global Variables */

			.data
			.global buf
buf:		.skip 100*1									//Define the global variable char array buf.
			.global bufp
bufp:		.word 0											//Define the global variable integer bufp with an initial value of zero.
			.text
		
			.global getch


//Function <void getch()>
getch:		stp x29, x30, [sp, -16]!					//Standard function initialization.
			mov x29, sp
			
			adrp x9, bufp									//Load the address of the variable bufp into x9
			add x9, x9, :lo12:bufp
			ldr w10, [x9]									//Load the value of bufp into w10.
			
			cmp w10, wzr									//Check if w10 (bufp) is greater than zero.
getchIf:	b.le getchElse									//If it's greater than or equal to, do the if. Else, go to else.
			
			add w10, w10, -1								
			str w10, [x9]									//Decrement w10 and store it in bufp.
			
			adrp x9, buf									//Load the address of the global variable buf into x9
			add x9, x9, :lo12:buf
			ldrb w0, [x9, w10, sxtw 0]						//Store the current first parameter result into buf.
			
			b getchStop										//Skip over the else.

getchElse:	bl getchar										//Simply call the getChar function. It will return a value into x0, which incidentally will also be returned by this function.
		
getchStop:	ldp x29, x30, [sp], --16					//Standard function end.
			ret
				
				.data
ungetchMsg:		.string "ungetch: too many characters\n"
				.balign 4
				.text
				.global ungetch
				

//Function <ungetch>
ungetch:		stp x29, x30, [sp, -16]!			//Standard function initialization.
				mov x29, sp
			
ungetchParam:	mov w14, w0
				
ungetchIf:		adrp x9, bufp								//Load the address of the variable bufp into x9
				add x9, x9, :lo12:bufp
				ldr w10, [x9]								//Load the value of bufp into w10.
				
				cmp w10, 100							//Compare to see if bufp > 100
				b.le ungetchElse							//If yes, ignore the rest of this block of code.
				
				adrp x0, ungetchMsg							//Else, load the ungetch message's address into x0.
				add x0, x0, :lo12:ungetchMsg
				bl printf									//Then print it out.
				b ungetchStop								//Then skip to the end.
				
ungetchElse:	adrp x9, bufp								//Load the address of the variable bufp into x9
				add x9, x9, :lo12:bufp
				ldr w10, [x9]								//Load the value of bufp into w10.
				
				adrp x9, buf								//Load the address of the global variable buf into x9
				add x9, x9, :lo12:buf
				strb w14, [x9, w10, sxtw 0]					//Store the current first parameter result into buf.
				
				adrp x9, bufp								//Load the address of the variable bufp into x9
				add x9, x9, :lo12:bufp
				
				add w10, w10, 1								//Increment w10, the value of bufp as previously loaded.
				str w10, [x9]								//Store the incremented bufp into bufp.
				
				
ungetchStop:	ldp x29, x30, [sp], --16			//Standard function end.
				ret

				