

facStr:					.string "6! = %d\n"
						.balign 4
						.global main
factorial:				stp x30, x29, [sp, -(16 + 8) & -16]!
						mov x29, sp
						
						mov w19, 1
						str w19, [x29, 16]
						
						cmp w0, wzr
						b.le endFactorial
						
						str w0, [x29, 16 + 4]
						add w0, w0, -1
						bl factorial
						
						ldr w1, [x29, 16 + 4]
						mul w0, w0, w1
						str w0, [x29, 16]
						
endFactorial:			ldr w0, [x29, 16]
						
						ldp	x30, x29, [sp], -(-(16 + 8) & -16)
						ret
						
main:					stp x30, x29, [sp, -(16 + 0) & -16]!
						mov x29, sp
						
						mov w1, 6
						bl factorial
						
						mov w1, w0
						adrp x0, facStr
						add x0, x0, :lo12:facStr
						bl printf
						
						ldp x30, x29, [sp], -(-(16 + 0) & -16)
						ret
						