
		




		

		.balign 4
		.global main			
main:	stp	x29, x30, [sp, -16]!		
		mov	x29, sp										//Standard Beginning Boilerplate Code
initialize:		mov x19, 0
				mov x20, 0
loopStart:		b loopTest
loopBody:		add x20, x20, x19
loopIncrement: 	add x19, x19, 1
loopTest:		cmp x19, 100
				b.lt loopBody
print:			adrp x0, result							//Print the longStr string with the results of the calculation as the numbers to be plugged in.
				add x0, x0, :lo12:result				//This shows the result of the calculation in terms of a 64-bit integer representation.
				mov x1, x20
				bl printf

exit:	ldp	x29, x30, [sp], 16			
		ret												//Standard Exiting Boilerplate Code