// Author: John Ming Ngo, 30020834.
// This program finds the largest value of the equation 5x^3 - 12x^2 - 20x + 10.
msg:		.string	 "The current x value is %d, the current y value is %d, and the biggest value so far is %d.\n"
		.balign	 4 				//This string reports on the current status of the calculations.

finalMsg:	.string "The largest discovered value was: %d.\n"
		.balign 4

		.global	 main

main:		stp	 x29, x30, [sp, -16]!
		mov	 x29, sp 			//Standard beginning boilerplate.

prep:		mov	 x21, -9999	 		//Setting up the biggest known value registry so we can find the biggest value.

loopStart:	mov	 x19, -4		 	//This registry stores the x values. Looping from -4 to 3, incrementing by one. This starts it at 4.

loopPretest:	cmp	 x19, 3 			//Breaks out of loop if greater than 3; pretest loop.
		b.gt	 finalReport

loopCalc:	mov	 x20, 10 			//Doing the calculations. This registry is the storage for the value of the entire expression at a given x. This just puts in the first x22, right to left. +10.
		
		mov	 x23, -20 			//This registry is used for temporary storage of integers for the mul operation. This temporary value is the coefficients of the terms.
		mul	 x22, x19, x23 			//The first registry stores the value of the term, the second the x value, the third the temporary value.
		add	 x20, x20, x22 			// This is the second term in the expression, going from right to left, -20 * x

		mul	 x22, x19, x19 			//Third Term -12 * x^2
		mov	 x23, -12
		mul	 x22, x22, x23
		add	 x20, x20, x22

		mul	 x22, x19, x19 			//Fourth Term 5*x^3
		mul	 x22, x22, x19
		mov	 x23, 5
		mul	 x22, x22, x23
		add	 x20, x20, x22

loopLargest:	cmp	 x20, x21 			//This section changes the biggest known value registry to the larger of the stored and calculated values.
		b.le	 loopPrint 			//Skips if the calculated value is smaller.
		mov	 x21, x20

loopPrint:	adrp	 x0, msg 			//Prints the current x value, y value, and x21 value.
		add	 x0, x0, :lo12:msg
		mov	 x1, x19 			//Expects three integer inputs, as can be checked in the defined string, so here they are.
		mov	 x2, x20
		mov	 x3, x21
		bl 	printf				//Calls the external function to print to the console.

loopRepeat:	add 	x19, x19, 1			//Increments the x value, and then loops.
		b 	loopPretest

finalReport:	adrp	x0, finalMsg			//Prints out the largest discovered value at the end.
		add	x0, x0, :lo12:finalMsg
		mov	x1, x21
		bl	printf

exit:		ldp 	x29, x30, [sp], 16		//Standard program quit boilerplate.
		ret
