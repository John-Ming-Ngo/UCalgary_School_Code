//Register Definitions
define(fp,x29)
define(lr,x30)


testStr:		.string "Result: %f \n"
.balign 4
.global main
main:				stp fp, lr, [sp, -16]!
					mov fp, sp

					mov x0, 90
					scvtf d0, x0
					bl toRadians
					bl cosineExpansion
					
					adrp x0, testStr
					add x0, x0, :lo12:testStr
					bl printf
					
endMain:			ldp fp, lr, [sp], 16				//Standard function ending code.
					ret
					