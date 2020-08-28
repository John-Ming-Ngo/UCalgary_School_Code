define(`start',`
		.balign 4
		.global main			
main:	stp	x29, x30, [sp, -16]!		
		mov	x29, sp										//Standard Beginning Boilerplate Code')
		
define(`stop',`
exit:	ldp	x29, x30, [sp], 16			
		ret												//Standard Exiting Boilerplate Code')

define(`i',`x19')
define(`sum',`x20')
		
start
initialize:		mov i, 0
				mov sum, 0
loopStart:		b loopTest
loopBody:		add sum, sum, i
loopIncrement: 	add i, i, 1
loopTest:		cmp i, 100
				b.lt loopBody
print:			adrp x0, result							//Print the longStr string with the results of the calculation as the numbers to be plugged in.
				add x0, x0, :lo12:result				//This shows the result of the calculation in terms of a 64-bit integer representation.
				mov x1, sum
				bl printf
stop