//Commenting Macros/Macros Below:
	 // Here we are setting up macro names for commonly used registers.
	 // Their purpose should be self-explanitory.
 // x21 is the x21 found value so far.
	 // x22 is the value of x^n for some n, used to simplify calculations.
	 // Temp is a temporary storage register used to store the constants of each term.
//Author: John Ming Ngo, 30020834
//This program calculates and finds the maximum of 5x^3 - 12x^2 - 20x + 10, jumping by integer values.
//If the maximum is actually a fractional value, this won't be found.
msg:		.string	 "The current x value is %d, the current y value is %d, and the biggest value so far is %d.\n"
		.balign	 4 					//This string reports on the current status of the calculations.

finalMsg:	.string "The biggest value discovered is %d.\n"
		.balign	4					//This message reports the x21 discovered value.
		
		.global	 main
main:		stp	 x29, x30, [sp, -16]!
		mov	 x29, sp 				//Standard beginning boilerplate.

prep:		mov	 x21, -9999 			//Setting up the x21 known value registry to a low so we can find the x21 value. Leaving it alone will leave some insane number inside.

loopSetup:	mov	 x19, -4		 		//This registry stores the x values. Looping from -4 to 3, incrementing by one. This starts it at 4.

loopStart: 	b	 loopTest

loopCalc:	mov	 x20, 10 				//Doing the calculations. This registry is the storage for the value of the entire expression at a given x. This just puts in the first term, right to left. +10.
		
		mov	 x23, -20				//This registry is used for temporary storage of integers for the mul operation.
		mov	 x22, x19				//Setup for optimizing x power usage. Currently x^1.
		madd	 x20, x22, x23, x20		//Adds this second term to the overall y value, -20 * x.

		mul	 x22, x22, x19	 		//Third Term -12 * x^2
		mov	 x23, -12
		madd	 x20, x22, x23, x20

		mul	 x22, x22, x19			//Fourth Term 5*x^3
		mov	 x23, 5
		madd	 x20, x22, x23, x20

loopLargest:	cmp	 x20, x21 			//This section changes the x21 known value registry to the larger of the stored and calculated values.
		b.le	 loopPrint 				//Skips if the calculated value is smaller.
		mov	 x21, x20

loopPrint:	adrp	 x0, msg 				//Prints the current x value, y value, and x21 value.
		add	 x0, x0, :lo12:msg
		mov	 x1, x19 				//Expects three integer inputs, as can be checked in the defined string, so here they are.
		mov	 x2, x20
		mov	 x3, x21
		bl	 printf					//Calls the external function to print to the console.

loopIncrement:	add	 x19, x19, 1			//Increments the x value, and then loops.

loopTest:	cmp	 x19, 3
		b.le	 loopCalc

finalReport:	adrp	x0, finalMsg				//Prints out the final result for x21 discovered value.
		add	x0, x0, :lo12:finalMsg
		mov	x1,  x21
		bl	printf

exit:		ldp	 x29, x30, [sp], 16			//Standard program quit boilerplate.
		ret
