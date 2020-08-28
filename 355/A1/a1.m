//Commenting Macros/Macros Below:
define(`xValue', `x19')	 // Here we are setting up macro names for commonly used registers.
define(`yValue', `x20')	 // Their purpose should be self-explanitory.
define(`largest', `x21') // largest is the largest found value so far.
define(`xPower', `x22')	 // xPower is the value of x^n for some n, used to simplify calculations.
define(`temp',`x23')	 // Temp is a temporary storage register used to store the constants of each term.
//Author: John Ming Ngo, 30020834
//This program calculates and finds the maximum of 5x^3 - 12x^2 - 20x + 10, jumping by integer values.
//If the maximum is actually a fractional value, this won't be found.
msg:		.string	 "The current x value is %d, the current y value is %d, and the biggest value so far is %d.\n"
		.balign	 4 					//This string reports on the current status of the calculations.

finalMsg:	.string "The biggest value discovered is %d.\n"
		.balign	4					//This message reports the largest discovered value.
		
		.global	 main
main:		stp	 x29, x30, [sp, -16]!
		mov	 x29, sp 				//Standard beginning boilerplate.

prep:		mov	 largest, -9999 			//Setting up the largest known value registry to a low so we can find the largest value. Leaving it alone will leave some insane number inside.

loopSetup:	mov	 xValue, -4		 		//This registry stores the x values. Looping from -4 to 3, incrementing by one. This starts it at 4.

loopStart: 	b	 loopTest

loopCalc:	mov	 yValue, 10 				//Doing the calculations. This registry is the storage for the value of the entire expression at a given x. This just puts in the first term, right to left. +10.
		
		mov	 temp, -20				//This registry is used for temporary storage of integers for the mul operation.
		mov	 xPower, xValue				//Setup for optimizing x power usage. Currently x^1.
		madd	 yValue, xPower, temp, yValue		//Adds this second term to the overall y value, -20 * x.

		mul	 xPower, xPower, xValue	 		//Third Term -12 * x^2
		mov	 temp, -12
		madd	 yValue, xPower, temp, yValue

		mul	 xPower, xPower, xValue			//Fourth Term 5*x^3
		mov	 temp, 5
		madd	 yValue, xPower, temp, yValue

loopLargest:	cmp	 yValue, largest 			//This section changes the largest known value registry to the larger of the stored and calculated values.
		b.le	 loopPrint 				//Skips if the calculated value is smaller.
		mov	 largest, yValue

loopPrint:	adrp	 x0, msg 				//Prints the current x value, y value, and largest value.
		add	 x0, x0, :lo12:msg
		mov	 x1, xValue 				//Expects three integer inputs, as can be checked in the defined string, so here they are.
		mov	 x2, yValue
		mov	 x3, largest
		bl	 printf					//Calls the external function to print to the console.

loopIncrement:	add	 xValue, xValue, 1			//Increments the x value, and then loops.

loopTest:	cmp	 xValue, 3
		b.le	 loopCalc

finalReport:	adrp	x0, finalMsg				//Prints out the final result for largest discovered value.
		add	x0, x0, :lo12:finalMsg
		mov	x1,  largest
		bl	printf

exit:		ldp	 x29, x30, [sp], 16			//Standard program quit boilerplate.
		ret
