//Todo: Make subroutines preserve register values x19-x28? Also, show GDB.

//Author: John Ming Ngo, 30020834.
//This is a translation of the C code in assignment 4 into ARMv8 Assembly. Features struts and functions.

//Defining true/false, as per the original code.
define(`True',`1')
define(`False',`0')

//Custom-defined registers for ease of code reading. In this case, it's just the frame pointer.
define(`fp_r',`x29')

//Function creation macros, adjusted for variable memory allocation. $1 is the label; $2 is the amount of memory allocated.
define(`func',`
$1:	stp	x29, x30, [sp, -(16 + $2) & -16]!
		mov	x29, sp								')
		
define(`endFunc',`
$1:		ldp	x29, x30, [sp], -(-(16 + $2) & -16)			
		ret										')

//Fixes stuff at the beginning.
define(`start',`
		.balign 4
		.global main ') 
		
//Strut point
define(`point_size',`4+4') 							//Size of the strut in terms of bytes.
define(`x',`0')										//Location of the first integer in this strut.
define(`y',`4')										//Location of the second integer in this strut. All following struts will be defined in a similar way.

//Struct dimension
define(`dimension_size',`4+4')
define(`width_s',`0')
define(`height_s',`4')

//Strut box
define(`box_size',`point_size + dimension_size + 4')
define(`origin_s',`0')
define(`size_s',`8')
define(`area_s',`16')

//Function strut box -newBox()						
define(`newBoxMemAlloc',`box_size')
define(`bBoxAddress',`16')
func(newBox, newBoxMemAlloc)																//This function initializes a new box strut, and then returns it through the indirect result return method.
initVars:				mov w9, wzr															//Initalize the strut and its values, in this case, box.origin.x and box.origin.y to 0.
						str w9, [fp_r, bBoxAddress + origin_s + x]
						str w9, [fp_r, bBoxAddress + origin_s + y]
						
						mov w9, 1
						str w9, [fp_r, bBoxAddress + size_s + width_s]						//Initalize box.size.width and box.size.height to 1.
						str w9, [fp_r, bBoxAddress + size_s + height_s]
						
						ldr w9, [fp_r, bBoxAddress + size_s + width_s]						//Calculate and initalize box.area to the product of its height and width.
						ldr w10, [fp_r, bBoxAddress + size_s + height_s]
						mul w9, w9, w10
						str w9, [fp_r, bBoxAddress + area_s]
						
nBReturnStrut:			ldr w9, [fp_r, bBoxAddress + origin_s + x]							//Using the indirect result return register, returning each value of the locally made strut.
						str w9, [x8, origin_s + x]											//In this case, return box.origin.x.
						
						ldr w9, [fp_r, bBoxAddress + origin_s + y]							//Return box.origin.y
						str w9, [x8, origin_s + y]
						
						ldr w9, [fp_r, bBoxAddress + size_s + width_s]						//Return box.size.width
						str w9, [x8, size_s + width_s]
						
						ldr w9, [fp_r, bBoxAddress + size_s + height_s]						//Return box.size.height
						str w9, [x8, size_s + height_s]
						
						
						ldr w9, [fp_r, bBoxAddress + area_s]								//Return box.area
						str w9, [x8, area_s]
						
endFunc(newBoxEnd, newBoxMemAlloc)

//Function void -move(struct box *b, int deltaX, int deltaY)
define(`moveMemAlloc',`0')
func(move, moveMemAlloc)																	//This function moves the box's origin coordinates to the provided values.
						ldr w9, [x0, origin_s + x]											//Load the box's origin.x given the pointer to the box in x0 in w19
						add w9, w9, w1														//Increment the value by the amount specified in the second parameter.
						str w9, [x0, origin_s + x]											//Store this incremented value into the box's origin.x
						
						ldr w9, [x0, origin_s + y]											//Same as above, but for y.
						add w9, w9, w2
						str w9, [x0, origin_s + y]
endFunc(moveEnd, moveMemAlloc)

//Function void -expand(struct box *b, int factor)
define(`expandMemAlloc',`0')
func(expand, expandMemAlloc)																//This function multiplies the box's width and height by the specified amount, and updates area accordingly.
						ldr w9, [x0, size_s + width_s]										//Load the box's width
						mul w9, w9, w1														//Multiply it by the expansion factor (second parameter)
						str w9, [x0, size_s + width_s]										//Store it in the box's width.
						
						ldr w9, [x0, size_s + height_s]										//Load the box's height.
						mul w9, w9, w1														//Multiply it by the expansion factor (second parameter)
						str w9, [x0, size_s + height_s]										//Store it in the box's height.
						
						ldr w9, [x0, size_s + width_s]										//Load the box's width.
						ldr w10, [x0, size_s + height_s]									//Load the box's height.
						mul w9, w9, w10														//Multiply them together.
						str w9, [x0, area_s]												//Store the result as the box's area.
endFunc(expandEnd, expandMemAlloc)

//Function void -printBox(char *name, struct box *b)
define(`printBoxMemAlloc',`0')
boxString:				.string "Box %s origin = (%d, %d) width = %d height = %d area = %d\n"
						.balign 4
func(printBox, printBoxMemAlloc)															//This function formats and prints a string describing the box's details.

																							//Format parameters for future printing.
shuffleParameters:		ldr w2, [x1, origin_s + x]											//Load box.origin.x into w2.
						ldr w3, [x1, origin_s + y]											//Load box.origin.y into w3.
						ldr w4, [x1, size_s + width_s]										//Load box.size.width into w4.
						ldr w5, [x1, size_s + height_s]										//Load box.size.height into w5.
						ldr w6, [x1, area_s]												//Load box.area into w6.
						mov x1, x0															//Move the parameter String into x1
						
						adrp x0, boxString													//Load the main string to be printed into x0
						add x0, x0, :lo12:boxString	
						
						bl printf															//Print the string that this function was built for.
endFunc(printBoxEnd, printBoxMemAlloc)

//Function int -equal(struct box *b1, struct box *b2)
define(`equalMemAlloc',`4')
define(`resultOffset',`16')
func(equal, equalMemAlloc)																	//This function checks if two boxes are equivalent. If they are, it returns 1, else 0.
						mov w9, False														//First, assume it isn't. Storing false in w19.
						str w9, [fp_r, resultOffset]										//Store this result in memory.
						
						ldr w9, [x0, origin_s + x]											//Load box1.origin.x.
						ldr w10, [x1, origin_s + x]											//Load box2.origin.x.
						cmp w9, w10															//Compare them.
						b.ne returnResult													//If they aren't equal, go straight to returning the result.
						
						ldr w9, [x0, origin_s + y]											//Load box1.origin.y.
						ldr w10, [x1, origin_s + y]											//Load box2.origin.y.
						cmp w9, w10															//Compare them.
						b.ne returnResult													//If they aren't the same, go straight to returning the result.
						
						ldr w9, [x0, size_s + width_s]										//Load box1.size.width.
						ldr w10, [x1, size_s + width_s]										//Load box2.size.width.
						cmp w9, w10															//Compare them.
						b.ne returnResult													//If they aren't the same, go straight to returning the result.
						
						ldr w9, [x0, size_s + height_s]										//Load box1.size.height.
						ldr w10, [x1, size_s + height_s]									//Load box2.size.height.
						cmp w9, w10															//Compare them.
						b.ne returnResult													//If they aren't the same, go straight to returning the result.
						
						mov w9, True														//If it passed all those tests, store True in w19.
						str w9, [fp_r, resultOffset]										//Then store it in memory.
	
	
returnResult:			ldr w9, [fp_r, resultOffset]										//Load the result into the registers.
						mov w0, w9															//Then store it into w0, to return to the main function.
endFunc(equalEnd, equalMemAlloc)

//-Main Function:
define(`mainMemAlloc',`box_size + box_size')
define(`first_s',`16')
define(`second_s',`16 + box_size')
						
initValStr:				.string "Initial box values:\n"
changedValStr:			.string "\nChanged box values:\n"
strFirst:				.string "first"
strSecond:				.string "second"

start
func(main, mainMemAlloc)																	//This is the main function, where all the computations occur.
createBoxes:			add x8, fp_r, first_s												//Calculate the address of the first strut box.
						bl newBox															//Give it to newBox() to initalize.
						
						add x8, fp_r, second_s												//Calculate the address of the second strut box.
						bl newBox															//Give it to newBox() to initalize.
						
printInitial:			adrp x0, initValStr													//Print out the string initValStr.
						add x0, x0, :lo12:initValStr
						bl printf
						
						adrp x0, strFirst													//Print out the values of the first box with printBox.
						add x0, x0, :lo12:strFirst
						add x1, fp_r, first_s
						bl printBox
						
						adrp x0, strSecond													//Print out the values of the second box with printBox.
						add x0, x0, :lo12:strSecond
						add x1, fp_r, second_s
						bl printBox
						
adjustBoxes:			add sp, sp, -4 & -16 												//Allocate memory for a local variable - the result of bl equal.
						add x0, fp_r, first_s												//Calculate the address of the first strut box, as the first parameter.
						add x1, fp_r, second_s												//Calculate the address of the second strut box, as the second parameter.
						bl equal															//Call the equal function.
						str w0, [fp_r, -4]													//Store its result in a local variable memory location above the frame pointer.
						ldr w19, [fp_r, -4]													//Load it into w19 to be used for comparison.
						cmp w19, wzr														//Use it in the if comparison.
						add sp, sp, -(-4 & -16)												//Death of the local variable's scope, deallocate its memory.
						b.eq printNewVal													//If the result returned is false, skip to printing.
						
						add x0, fp_r, first_s												//Else, calculate the address of the first box as the first parameter.
						mov w1, -5															//Move -5 as the second parameter as part of the new coordinate.
						mov w2, 7															//Move 7 as the third parameter as part of the new coordinate.
						bl move																//Call the move function.
						
						add x0, fp_r, second_s												//Calculate the address of the second box as the first parameter.
						mov w1, 3															//Move 3 into the second paramter for use as a multiplier.
						bl expand															//Call the expand function.
						
printNewVal:			adrp x0, changedValStr												//Print out the changedValStr string.
						add x0, x0, :lo12:changedValStr
						bl printf
						
						adrp x0, strFirst													//Print out the values of the first box as part of the printBox function.
						add x0, x0, :lo12:strFirst
						add x1, fp_r, first_s
						bl printBox
						
						adrp x0, strSecond													//Print out the values of the second box as part of the printBox function.
						add x0, x0, :lo12:strSecond
						add x1, fp_r, second_s
						bl printBox		
endFunc(mainEnd, mainMemAlloc)

