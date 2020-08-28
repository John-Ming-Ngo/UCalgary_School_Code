//Shorthand 'functions' for boilerplate code.

		


//Definitions



//Variables










//Author: John Ming Ngo, 30020834
//This program calculates the results of multiplication using add and shift, using the add-shift algorithm for binary numbers..

initStr:		.string "multiplier = 0x%08x (%d) multiplicand = 0x%08x (%d)\n\n"
multiDuctStr:	.string "product = 0x%08x multiplier = 0x%08x\n"
longStr:		.string "64-bit result = 0x%016lx (%ld)\n"


		.balign 4
		.global main			
main:	stp	x29, x30, [sp, -16]!		
		mov	x29, sp										//Standard Beginning Boilerplate Code

varInit:		mov w20, 252645135				//Initalize all the relevant variables.
				mov w19, 200
				mov w21, 0							//Product is relevant due to an addition operation later that requires a cleared register.
				
initPrint:		adrp x0, initStr							//Prints the initStr string with the initial multiplier and multiplicand in hex and dec values.
				add x0, x0, :lo12:initStr					//This shows the user the values of the initial inputs to the calculation.
				mov w1, w19						//Each of the inputs is duplicated because its hex and dec forms will both be shown.
				mov w2, w19
				mov w3, w20
				mov w4, w20
				bl printf
				
isNegative:		mov w23, 0						//This piece of code checks and logs if the multiplier is negative.
				cmp w19, 0							
				b.ge loopInit								//If it is greater than or equal to zero, it isn't negative, ignore.
				mov w23, 1						//Else, it is negative, so set this registry to 1 (1).
				
loopInit:		mov w22, 0									//Initialize the loop counter; do the shifting loop that will do the calculations.
				b loopTest									//Go to the test; for loop optimization.

loopBody:		tst w19, 0x1						//Apply a bitmask to the multiplier, seeing if there's anyhting at the 1s position.
				b.eq shiftPlier								//If not, ignore.
				add w21, w21, w20	//Else, add the multiplicand to the product.

shiftPlier:		asr w19, w19, 1			//Arithmetic shift it right once.
				
				tst w21, 0x1							//Apply a bitmask to the product, seeing if there's anyhting at the 1s position.
multiplierIf:	b.eq multiplierElse 						//If not, do an and operation instead.
				orr w19, w19, 0x80000000	//Else, flip the 32nd bit to a 1; the calculation's leftmost bit.
				b shiftProd									//Goto the next step.

multiplierElse:	and w19, w19, 0x7FFFFFFF	//Else step: Logical and step keeps all bits except the leftmost bit, flipping it to a zero.

shiftProd:		asr w21, w21, 1					//Arithmetic shift the product right 1.

loopIncrement:	add w22, w22, 1								//Increment the loop counter.

loopTest:		cmp w22, 32									//Check condition: i<32; loop is a for loop (for(i = 0;i < 32, i++)).
				b.lt loopBody								//Goto the next iteration of the loop.

negativeOp:		cmp w23, 0							//After the loop, if the initial input was negative, do the following:
				b.le multiDuctPrint							//Ignore if not negative.
				sub w21, w21, w20	//Else, subtract the multiplicand from the product.

multiDuctPrint:	adrp x0, multiDuctStr						//Print the multiDuctStr with the product and multiplier as it currently is.
				add x0, x0, :lo12:multiDuctStr				//This shows the hexadecimal forms of the product and multiplier.
				mov w1, w21							
				mov w2, w19						
				bl printf									

formatLong:		uxtw x25, w21						//Format the result into a 64-bit format so that it can be reasonably printed as an integer.
				and x25, x25, 0xFFFFFFFF
				lsl x25, x25, 32
				uxtw x26, w19
				and x26, x26, 0xFFFFFFFF
				add x24, x25, x26

longPrint:		adrp x0, longStr							//Print the longStr string with the results of the calculation as the numbers to be plugged in.
				add x0, x0, :lo12:longStr					//This shows the result of the calculation in terms of a 64-bit integer representation.
				mov x1, x24
				mov x2, x24
				bl printf

exit:	ldp	x29, x30, [sp], 16			
		ret												//Standard Exiting Boilerplate Code
