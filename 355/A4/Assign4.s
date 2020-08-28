//Todo: Make subroutines preserve register values x19-x28? Also, show GDB.

//Author: John Ming Ngo, 30020834.
//This is a translation of the C code in assignment 4 into ARMv8 Assembly. Features struts and functions.

//Defining true/false, as per the original code.



//Custom-defined registers for ease of code reading. In this case, it's just the frame pointer.


//Function creation macros, adjusted for variable memory allocation. $1 is the label; $2 is the amount of memory allocated.

		


//Fixes stuff at the beginning.
 
		
//Strut point
 							//Size of the strut in terms of bytes.
										//Location of the first integer in this strut.
										//Location of the second integer in this strut. All following struts will be defined in a similar way.

//Struct dimension




//Strut box





//Function strut box -newBox()						



newBox:	stp	x29, x30, [sp, -(16 + 4+4 + 4+4 + 4) & -16]!
		mov	x29, sp																								//This function initializes a new box strut, and then returns it through the indirect result return method.
initVars:				mov w9, wzr															//Initalize the strut and its values, in this case, box.origin.0 and box.origin.4 to 0.
						str w9, [x29, 16 + 0 + 0]
						str w9, [x29, 16 + 0 + 4]
						
						mov w9, 1
						str w9, [x29, 16 + 8 + 0]						//Initalize box.size.width and box.size.height to 1.
						str w9, [x29, 16 + 8 + 4]
						
						ldr w9, [x29, 16 + 8 + 0]						//Calculate and initalize box.area to the product of its height and width.
						ldr w10, [x29, 16 + 8 + 4]
						mul w9, w9, w10
						str w9, [x29, 16 + 16]
						
nBReturnStrut:			ldr w9, [x29, 16 + 0 + 0]							//Using the indirect result return register, returning each value of the locally made strut.
						str w9, [x8, 0 + 0]											//In this case, return box.origin.0.
						
						ldr w9, [x29, 16 + 0 + 4]							//Return box.origin.4
						str w9, [x8, 0 + 4]
						
						ldr w9, [x29, 16 + 8 + 0]						//Return box.size.width
						str w9, [x8, 8 + 0]
						
						ldr w9, [x29, 16 + 8 + 4]						//Return box.size.height
						str w9, [x8, 8 + 4]
						
						
						ldr w9, [x29, 16 + 16]								//Return box.area
						str w9, [x8, 16]
						

newBoxEnd:		ldp	x29, x30, [sp], -(-(16 + 4+4 + 4+4 + 4) & -16)			
		ret										

//Function void -move(struct box *b, int deltaX, int deltaY)


move:	stp	x29, x30, [sp, -(16 + 0) & -16]!
		mov	x29, sp																									//This function moves the box's origin coordinates to the provided values.
						ldr w9, [x0, 0 + 0]											//Load the box's origin.0 given the pointer to the box in x0 in w19
						add w9, w9, w1														//Increment the value by the amount specified in the second parameter.
						str w9, [x0, 0 + 0]											//Store this incremented value into the box's origin.0
						
						ldr w9, [x0, 0 + 4]											//Same as above, but for 4.
						add w9, w9, w2
						str w9, [x0, 0 + 4]

moveEnd:		ldp	x29, x30, [sp], -(-(16 + 0) & -16)			
		ret										

//Function void -expand(struct box *b, int factor)


expand:	stp	x29, x30, [sp, -(16 + 0) & -16]!
		mov	x29, sp																								//This function multiplies the box's width and height by the specified amount, and updates area accordingly.
						ldr w9, [x0, 8 + 0]										//Load the box's width
						mul w9, w9, w1														//Multiply it by the expansion factor (second parameter)
						str w9, [x0, 8 + 0]										//Store it in the box's width.
						
						ldr w9, [x0, 8 + 4]										//Load the box's height.
						mul w9, w9, w1														//Multiply it by the expansion factor (second parameter)
						str w9, [x0, 8 + 4]										//Store it in the box's height.
						
						ldr w9, [x0, 8 + 0]										//Load the box's width.
						ldr w10, [x0, 8 + 4]									//Load the box's height.
						mul w9, w9, w10														//Multiply them together.
						str w9, [x0, 16]												//Store the result as the box's area.

expandEnd:		ldp	x29, x30, [sp], -(-(16 + 0) & -16)			
		ret										

//Function void -printBox(char *name, struct box *b)

boxString:				.string "Box %s origin = (%d, %d) width = %d height = %d area = %d\n"
						.balign 4

printBox:	stp	x29, x30, [sp, -(16 + 0) & -16]!
		mov	x29, sp																							//This function formats and prints a string describing the box's details.

																							//Format parameters for future printing.
shuffleParameters:		ldr w2, [x1, 0 + 0]											//Load box.origin.0 into w2.
						ldr w3, [x1, 0 + 4]											//Load box.origin.4 into w3.
						ldr w4, [x1, 8 + 0]										//Load box.size.width into w4.
						ldr w5, [x1, 8 + 4]										//Load box.size.height into w5.
						ldr w6, [x1, 16]												//Load box.area into w6.
						mov x1, x0															//Move the parameter String into x1
						
						adrp x0, boxString													//Load the main string to be printed into x0
						add x0, x0, :lo12:boxString	
						
						bl printf															//Print the string that this function was built for.

printBoxEnd:		ldp	x29, x30, [sp], -(-(16 + 0) & -16)			
		ret										

//Function int -equal(struct box *b1, struct box *b2)



equal:	stp	x29, x30, [sp, -(16 + 4) & -16]!
		mov	x29, sp																									//This function checks if two boxes are equivalent. If they are, it returns 1, else 0.
						mov w9, 0														//First, assume it isn't. Storing false in w19.
						str w9, [x29, 16]										//Store this result in memory.
						
						ldr w9, [x0, 0 + 0]											//Load box1.origin.0.
						ldr w10, [x1, 0 + 0]											//Load box2.origin.0.
						cmp w9, w10															//Compare them.
						b.ne returnResult													//If they aren't equal, go straight to returning the result.
						
						ldr w9, [x0, 0 + 4]											//Load box1.origin.4.
						ldr w10, [x1, 0 + 4]											//Load box2.origin.4.
						cmp w9, w10															//Compare them.
						b.ne returnResult													//If they aren't the same, go straight to returning the result.
						
						ldr w9, [x0, 8 + 0]										//Load box1.size.width.
						ldr w10, [x1, 8 + 0]										//Load box2.size.width.
						cmp w9, w10															//Compare them.
						b.ne returnResult													//If they aren't the same, go straight to returning the result.
						
						ldr w9, [x0, 8 + 4]										//Load box1.size.height.
						ldr w10, [x1, 8 + 4]									//Load box2.size.height.
						cmp w9, w10															//Compare them.
						b.ne returnResult													//If they aren't the same, go straight to returning the result.
						
						mov w9, 1														//If it passed all those tests, store 1 in w19.
						str w9, [x29, 16]										//Then store it in memory.
	
	
returnResult:			ldr w9, [x29, 16]										//Load the result into the registers.
						mov w0, w9															//Then store it into w0, to return to the main function.

equalEnd:		ldp	x29, x30, [sp], -(-(16 + 4) & -16)			
		ret										

//-Main Function:



						
initValStr:				.string "Initial box values:\n"
changedValStr:			.string "\nChanged box values:\n"
strFirst:				.string "first"
strSecond:				.string "second"


		.balign 4
		.global main 

main:	stp	x29, x30, [sp, -(16 + 4+4 + 4+4 + 4 + 4+4 + 4+4 + 4) & -16]!
		mov	x29, sp																									//This is the main function, where all the computations occur.
createBoxes:			add x8, x29, 16												//Calculate the address of the first strut box.
						bl newBox															//Give it to newBox() to initalize.
						
						add x8, x29, 16 + 4+4 + 4+4 + 4												//Calculate the address of the second strut box.
						bl newBox															//Give it to newBox() to initalize.
						
printInitial:			adrp x0, initValStr													//Print out the string initValStr.
						add x0, x0, :lo12:initValStr
						bl printf
						
						adrp x0, strFirst													//Print out the values of the first box with printBox.
						add x0, x0, :lo12:strFirst
						add x1, x29, 16
						bl printBox
						
						adrp x0, strSecond													//Print out the values of the second box with printBox.
						add x0, x0, :lo12:strSecond
						add x1, x29, 16 + 4+4 + 4+4 + 4
						bl printBox
						
adjustBoxes:			add sp, sp, -4 & -16 												//Allocate memory for a local variable - the result of bl equal.
						add x0, x29, 16												//Calculate the address of the first strut box, as the first parameter.
						add x1, x29, 16 + 4+4 + 4+4 + 4												//Calculate the address of the second strut box, as the second parameter.
						bl equal															//Call the equal function.
						str w0, [x29, -4]													//Store its result in a local variable memory location above the frame pointer.
						ldr w19, [x29, -4]													//Load it into w19 to be used for comparison.
						cmp w19, wzr														//Use it in the if comparison.
						add sp, sp, -(-4 & -16)												//Death of the local variable's scope, deallocate its memory.
						b.eq printNewVal													//If the result returned is false, skip to printing.
						
						add x0, x29, 16												//Else, calculate the address of the first box as the first parameter.
						mov w1, -5															//Move -5 as the second parameter as part of the new coordinate.
						mov w2, 7															//Move 7 as the third parameter as part of the new coordinate.
						bl move																//Call the move function.
						
						add x0, x29, 16 + 4+4 + 4+4 + 4												//Calculate the address of the second box as the first parameter.
						mov w1, 3															//Move 3 into the second paramter for use as a multiplier.
						bl expand															//Call the expand function.
						
printNewVal:			adrp x0, changedValStr												//Print out the changedValStr string.
						add x0, x0, :lo12:changedValStr
						bl printf
						
						adrp x0, strFirst													//Print out the values of the first box as part of the printBox function.
						add x0, x0, :lo12:strFirst
						add x1, x29, 16
						bl printBox
						
						adrp x0, strSecond													//Print out the values of the second box as part of the printBox function.
						add x0, x0, :lo12:strSecond
						add x1, x29, 16 + 4+4 + 4+4 + 4
						bl printBox		

mainEnd:		ldp	x29, x30, [sp], -(-(16 + 4+4 + 4+4 + 4 + 4+4 + 4+4 + 4) & -16)			
		ret										

