//Register Definitions





		
	





				.data
cosineResult:	.double 0r0
sineResult:		.double 0r0
errorStartMsg:	.string "Error: Wrong number of arguments or failure to open the file.\n"
resBeginMsg:	.string "Cosine:				Sine:\n"
errorResMsg:	.string "Error: Angle is not between 0 and 90 degrees.\n"
resultsMsg:		.string "%.10f 		%.10f.\n"
				.text
				.balign 4
				.global main
main:			stp x29, x30, [sp, (-(16 + 4 + 8 + 8) & -16)]!
				mov x29, sp
			
processArgs:	str w0, [x29, 16]
				str x1, [x29, 16 + 4]
				
				ldr w0, [x29, 16]
				cmp w0, 2
				b.eq loadFile
				
				adrp x0, errorStartMsg
				add x0, x0, :lo12:errorStartMsg
				bl printf
				b endmain

loadFile:		mov w0, -100				//1st arg (cwd)
				ldr x1, [x29, 16 + 4]			//2nd arg
				ldr x1, [x1, 8]
				mov w2, 0						//3rd arg (read only)
				mov w3, 0						//4th arg (unused)
				mov x8, 56						//openat I/O request
				svc 0							//call system function
				
				mov w19, w0
				cmp w19, 0
				b.ge loadSuccess
				
				adrp x0, errorStartMsg
				add x0, x0, :lo12:errorStartMsg
				bl printf
				b endmain
			
loadSuccess:	adrp x0, resBeginMsg
				add x0, x0, :lo12:resBeginMsg
				bl printf
				
readLoopBody:	mov w0, w19						//1st arg (fd)
				add x1, x29, (16 + 4 + 8)
				mov w2, 8					//3rd arg (n)
				mov x8, 63						//read I/O request
				svc 0
				mov x20, x0
				
				ldr d0, [x29, (16 + 4 + 8)]
				adrp x0, resultsMsg
				add x0, x0, :lo12:resultsMsg
				fmov d1, d0
				bl printf
/*
				bl toRadians
				bl cosineExpansion
				
				adrp x0, cosineResult
				add x0, x0, :lo12:cosineResult
				str s0, [x0]
				
				add x1, x29, (16 + 4 + 8)
				ldr d0, [x1]
				bl toRadians
				bl sineExpansion
				
				adrp x0, sineResult
				add x0, x0, :lo12:sineResult
				str s0, [x0]
			
				adrp x0, resultsMsg
				add x0, x0, :lo12:resultsMsg
				adrp x1, cosineResult
				add x1, x1, :lo12:cosineResult
				ldr d0, [x1]
				adrp x2, sineResult
				add x2, x2, :lo12:sineResult
				ldr d1, [x2]
				bl printf
*/
readLoopTest:	cmp x20, 8						//if nread != 8 then
				b.eq readLoopBody						//read failed so exit loop (end of file)

endmain:		ldp x29, x30, [sp], -(-(16 + 4 + 8 + 8) & -16)
				ret
				