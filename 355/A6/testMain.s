//Register Definitions




testStr:		.string "Result: %f \n"
.balign 4
.global main
main:				stp x29, x30, [sp, -16]!
					mov x29, sp

					mov x0, 90
					scvtf d0, x0
					bl toRadians
					bl cosineExpansion
					
					adrp x0, testStr
					add x0, x0, :lo12:testStr
					bl printf
					
endMain:			ldp x29, x30, [sp], 16				//Standard function ending code.
					ret
					