//Shorthand 'functions' for boilerplate code.
define(`start',`
		.balign 4
		.global main			
main:	stp	x29, x30, [sp, -16]!		
		mov	x29, sp										//Standard Beginning Boilerplate Code')
		
define(`stop',`
exit:	ldp	x29, x30, [sp], 16			
		ret												//Standard Exiting Boilerplate Code')

//Definitions
define(`true',`1')
define(`false',`0')

//Variables
define(`multiplier_r',`w19')
define(`multiplicand_r',`w20')
define(`product_r',`w21')
define(`i_r',`w22')
define(`negative_r',`w23')
define(`result_r',`x24')
define(`temp1_r',`x25')
define(`temp2_r',`x26')


//Author: John Ming Ngo, 30020834
//This program calculates the results of multiplication using add and shift, using the add-shift algorithm for binary numbers..

initStr:		.string "multiplier = 0x%08x (%d) multiplicand = 0x%08x (%d)\n\n"
multiDuctStr:	.string "product = 0x%08x multiplier = 0x%08x\n"
longStr:		.string "64-bit result = 0x%016lx (%ld)\n"

start

varInit:		mov multiplicand_r, -559087616				//Initalize all the relevant variables.
				mov multiplier_r, 40
				mov product_r, 0							//Product is relevant due to an addition operation later that requires a cleared register.
				
initPrint:		adrp x0, initStr							//Prints the initStr string with the initial multiplier and multiplicand in hex and dec values.
				add x0, x0, :lo12:initStr					//This shows the user the values of the initial inputs to the calculation.
				mov w1, multiplier_r						//Each of the inputs is duplicated because its hex and dec forms will both be shown.
				mov w2, multiplier_r
				mov w3, multiplicand_r
				mov w4, multiplicand_r
				bl printf
				
isNegative:		mov negative_r, false						//This piece of code checks and logs if the multiplier is negative.
				cmp multiplier_r, 0							
				b.ge loopInit								//If it is greater than or equal to zero, it isn't negative, ignore.
				mov negative_r, true						//Else, it is negative, so set this registry to true (1).
				
loopInit:		mov i_r, 0									//Initialize the loop counter; do the shifting loop that will do the calculations.
				b loopTest									//Go to the test; for loop optimization.

loopBody:		tst multiplier_r, 0x1						//Apply a bitmask to the multiplier, seeing if there's anyhting at the 1s position.
				b.eq shiftPlier								//If not, ignore.
				add product_r, product_r, multiplicand_r	//Else, add the multiplicand to the product.

shiftPlier:		asr multiplier_r, multiplier_r, 1			//Arithmetic shift it right once.
				
				tst product_r, 0x1							//Apply a bitmask to the product, seeing if there's anyhting at the 1s position.
multiplierIf:	b.eq multiplierElse 						//If not, do an and operation instead.
				orr multiplier_r, multiplier_r, 0x80000000	//Else, flip the 32nd bit to a 1; the calculation's leftmost bit.
				b shiftProd									//Goto the next step.

multiplierElse:	and multiplier_r, multiplier_r, 0x7FFFFFFF	//Else step: Logical and step keeps all bits except the leftmost bit, flipping it to a zero.

shiftProd:		asr product_r, product_r, 1					//Arithmetic shift the product right 1.

loopIncrement:	add i_r, i_r, 1								//Increment the loop counter.

loopTest:		cmp i_r, 32									//Check condition: i<32; loop is a for loop (for(i = 0;i < 32, i++)).
				b.lt loopBody								//Goto the next iteration of the loop.

negativeOp:		cmp negative_r, 0							//After the loop, if the initial input was negative, do the following:
				b.le multiDuctPrint							//Ignore if not negative.
				sub product_r, product_r, multiplicand_r	//Else, subtract the multiplicand from the product.

multiDuctPrint:	adrp x0, multiDuctStr						//Print the multiDuctStr with the product and multiplier as it currently is.
				add x0, x0, :lo12:multiDuctStr				//This shows the hexadecimal forms of the product and multiplier.
				mov w1, product_r							
				mov w2, multiplier_r						
				bl printf									

formatLong:		uxtw temp1_r, product_r						//Format the result into a 64-bit format so that it can be reasonably printed as an integer.
				and temp1_r, temp1_r, 0xFFFFFFFF
				lsl temp1_r, temp1_r, 32
				uxtw temp2_r, multiplier_r
				and temp2_r, temp2_r, 0xFFFFFFFF
				add result_r, temp1_r, temp2_r

longPrint:		adrp x0, longStr							//Print the longStr string with the results of the calculation as the numbers to be plugged in.
				add x0, x0, :lo12:longStr					//This shows the result of the calculation in terms of a 64-bit integer representation.
				mov x1, result_r
				mov x2, result_r
				bl printf
stop
