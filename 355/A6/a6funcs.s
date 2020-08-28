//Register Definitions




//Factorial Function



					.global factorial
factorial:			stp x29, x30, [sp, (-(16 + 4 + 8) & -16)]!				//Standard function starting code.
					mov x29, sp

facStoreArgs:		str w0, [x29, 16]

					fmov d1, 1.0
					str d1, [x29, 16+4]
					
facLoopStart:		b facLoopTest

facLoopBody:		ldr w0, [x29, 16]
					scvtf d0, w0
					ldr d1, [x29, 16+4]
					fmul d1, d1, d0
					str d1, [x29, 16+4]
					
facLoopChange:		ldr w0, [x29, 16]
					add w0, w0, -1
					str w0, [x29, 16]
					
facLoopTest:		ldr w0, [x29, 16]
					cmp w0, 1
					b.gt facLoopBody
			
endFactorial:		ldr d0, [x29, 16+4]
					ldp x29, x30, [sp], -(-(16 + 4 + 8) & -16)				//Standard function ending code.
					ret

//Exponent Function					


					.data
expInput:			.double	0r0
expResult:			.double 0r1
					.text
					.global exponentiation
exponentiation:		stp x29, x30, [sp, (-(16 + 4) & -16)]!			//Standard function starting code.
					mov x29, sp
					
expStoreArgs:		str w0, [x29, 16]

					adrp x0, expInput
					add x0, x0, :lo12:expInput
					str d0, [x0]
					
expLoopBegin:		b expLoopTest

expLoopBody:		adrp x0, expInput
					add x0, x0, :lo12:expInput
					ldr d0, [x0]
					
					adrp x0, expResult
					add x0, x0, :lo12:expResult
					ldr d1, [x0]
					
					fmul d1, d1, d0
					adrp x0, expResult
					add x0, x0, :lo12:expResult
					str d1, [x0]

expLoopDecrement:	ldr w0, [x29, 16]
					add w0, w0, -1
					str w0, [x29, 16]

expLoopTest:		ldr w0, [x29, 16]
					cmp w0, 0
					b.gt expLoopBody
					
exponentiationEnd:	adrp x0, expResult								//Return the result.
					add x0, x0, :lo12:expResult
					ldr d0, [x0]									
					ldp x29, x30, [sp], -(-(16 + 4) & -16)			//Standard function ending code.
					ret
					
//Function toRadians

					.data
piValue:			.double 0r3.14159265358979323846
					.text
					.global toRadians
toRadians:			stp x29, x30, [sp, (-16)]!
					mov x29, sp
					
					mov w1, 180
					scvtf d1, w1
					fdiv d0, d0, d1
					
					adrp x0, piValue
					add x0, x0, :lo12:piValue
					ldr d1, [x0]
					
					fmul d0, d0, d1
					
endToRadians:		ldp x29, x30, [sp], -(-16)
					ret
					
//Cosine Function
	
					.data
cosineInput:		.double 0r0
cosineResult:		.double 0r0
cosineWorkingVar:	.double 0r0
sizeCutoff:			.double 0.1e-10
					.text
resultString:		.string "Result: %f|"
					.balign 4

					.global cosineExpansion
cosineExpansion:	stp x29, x30, [sp, (-(16 + 4) & -16)]!					//Standard function starting code.
					mov x29, sp
					
cosineArgsSave:		adrp x0, cosineInput
					add	x0, x0, :lo12:cosineInput
					str d0, [x0]
					
					mov w0, 0
					str w0, [x29, 16]

cosineLoopBody:		adrp x0, cosineInput
					add x0, x0, :lo12:cosineInput
					ldr d0, [x0]
					ldr w0, [x29, 16]
					bl exponentiation	
					
					adrp x0, cosineWorkingVar
					add x0, x0, :lo12:cosineWorkingVar
					str d0, [x0]
					
					adrp x0, cosineInput
					add x0, x0, :lo12:cosineInput
					ldr d0, [x0]
					ldr w0, [x29, 16]
					bl exponentiation	
					
					adrp x0, resultString
					add x0, x0, :lo12:resultString
					bl printf
					/*
					ldr w0, [x29, 16]
					bl factorial
					
					fmov d1, d0
					
					adrp x0, cosineWorkingVar
					add x0, x0, :lo12:cosineWorkingVar
					ldr d0, [x0]
					fdiv d0, d0, d1
					str d0, [x0]
					
					*/
					ldr w0, [x29, 16]
					mov w1, 2
					udiv w0, w0, w1
					and w0, w0, 0x1
					
					cmp w0, 0
					b.eq cosContResult
					
					adrp x0, cosineWorkingVar
					add x0, x0, :lo12:cosineWorkingVar
					ldr d0, [x0]
					fmov d1, 1.0
					fnmul d0, d0, d1
					str d0, [x0]
					
					
cosContResult:		adrp x0, cosineWorkingVar
					add x0, x0, :lo12:cosineWorkingVar
					ldr d1, [x0]
					
					adrp x0, cosineResult
					add x0, x0, :lo12:cosineResult
					ldr d2, [x0]
					
					fadd d0, d1, d2
					
					adrp x0, cosineWorkingVar
					add x0, x0, :lo12:cosineWorkingVar
					ldr d0, [x0]
					
					adrp x0, cosineResult
					add x0, x0, :lo12:cosineResult
					str d0, [x0]
								

cosineLoopTest:		ldr w0, [x29, 16]
					add w0, w0, 2
					str w0, [x29, 16]

					adrp x0, cosineWorkingVar
					add x0, x0, :lo12:cosineWorkingVar
					ldr d0, [x0]
					fabs d0, d0

					adrp x0, sizeCutoff
					add x0, x0, :lo12:sizeCutoff
					ldr d1, [x0]
					fabs d1, d1
					
					fcmp d0, d1
					b.gt cosineLoopBody
					
cosineExpansionEnd:	adrp x0, cosineResult
					add x0, x0, :lo12:cosineResult
					ldr s0, [x0]
					ldp x29, x30, [sp], -(-(16 + 4) & -16)				//Standard function ending code.
					ret
					
				