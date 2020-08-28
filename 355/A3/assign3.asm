//Author: John Ming Ngo, 30020834
//This program generates an array of a given size and initalizes each part of the array to a random value.
//From there, it uses selection sort to sort all of the values in order, and prints out the unsorted and sorted arrays.

//Starting and stopping the program code, adjusted for variable memory allocation.
define(`start',`
		.balign 4
		.global main			
main:	stp	x29, x30, [sp, -(16 + varSize) & -16]!
		mov	x29, sp										//Standard Beginning Boilerplate Code')
		
define(`stop',`
exit:	ldp	x29, x30, [sp], -(-(16 + varSize) & -16)			
		ret												//Standard Exiting Boilerplate Code')
	
//Simple redefining of constants.
define(`SIZE',`50')
define(`fp',`x29')
define(`int',`4')	//Size of integer on the stack.
define(`intShift',`2')
	
//Defining allocated memory locations.
define(`varSize', `int * SIZE + int + int + int + int')
define(`array_m', `16')
define(`i_m',`16 + int * SIZE')
define(`j_m',`16 + int * SIZE + int')
define(`min_m',`16 + int * SIZE + int + int')
define(`temp_m',`16 + int * SIZE + int + int + int')

//Defining commonly used registers.
define(`arrayPos_r',`x24')

//Strings used in this program.
showElementStr:		.string	"v[%d]: %d\n"
introSortArrayStr:	.string "\nSorted array:\n"

start
											
initalizeVars:			str wzr, [fp, i_m]							//Initialize all variables except the array to 0, just to make sure.
						str wzr, [fp, j_m]							//We can get away with not initalizing the array because the array gets initialized with random numbers later.
						str wzr, [fp, min_m]						//This step implemented on TA recommendation.
						str wzr, [fp, temp_m]
																						
arrayRandInit:			str wzr, [fp, i_m]							//Initialize i to 0, then begin the loop. Beginning of the array initialization loop.
						b randLoopTest
						
randLoopBody:			bl rand										//Loop body, first get a random number with the rand function.
						and w20, w0, 0xFF							//And this number with 0xFF to keep it in a certain size.
						
						ldr w19, [fp, i_m]							//Calculate the position of the array corrisponding to the index i, 
						add arrayPos_r, fp, array_m					//and then store the random number in the array at the index given.
						str w20, [arrayPos_r, w19, SXTW intShift]
						
						adrp x0, showElementStr						//Print out the random number to be stored at the given array index.
						add x0, x0, :lo12:showElementStr	
						mov w1, w19
						mov w2, w20
						bl printf
						
randLoopIncrement:		ldr w19, [fp, i_m]							//Increment i by one afterwards.
						add w19, w19, 1
						str w19, [fp, i_m]
						
randLoopTest:			ldr w19, [fp, i_m]
						cmp w19, SIZE								//Loop test, if i < SIZE, keep looping.
						b.lt randLoopBody						

				
sortLoopInitI:			str wzr, [fp, i_m]							//Beginning of the selection sort loop, set i to 0 again and then begin the loop.
						b sortLoopTestI

sortLoopBodyI:			ldr w19, [fp, i_m]							//Set the current minimum to be i, in other words, the index of the minimum value is i.
						str w19, [fp, min_m]
						
sortLoopInitJ: 			ldr w21, [fp, i_m]							//Beginning of the inner loop for selection sort, with j = i + 1.
						add w20, w21, 1								//So first we need to load i, add one to it, and then set j to it.
						mov w19, w20
						str w19, [fp, j_m]
						b sortLoopTestJ		
						
sortLoopBodyJ:			ldr w19, [fp, j_m]							//Loading utilitzed variable values j and min into registers w19 and w20.			
						add arrayPos_r, fp, array_m					//Calculating the array position given an array call v[j], and stores the value.
						ldr w21, [arrayPos_r, w19, SXTW intShift]	//Working value is stored in registry w21.
												
						ldr w20, [fp, min_m]						//Calculating the array position given an array call v[min], and stores the value.
						add arrayPos_r, fp, array_m					//Value is stored in registry w22.
						ldr w22, [arrayPos_r, w20, SXTW intShift]
						
						cmp w21, w22								//Check: v[j] < v[min]
						b.ge sortLoopIncrementJ
						
						ldr w23, [fp, j_m]							//If that is true, set the min to j.
						str w23, [fp, min_m]

sortLoopIncrementJ:		ldr w19, [fp, j_m]							//Increment j by 1. j is the loop counter.
						add w19, w19, 1
						str w19, [fp, j_m]

sortLoopTestJ:			ldr w19, [fp, j_m]
						cmp w19, SIZE								//If j < SIZE, continue looping.
						b.lt sortLoopBodyJ

sortLoopBodyI2:			ldr w19, [fp, min_m]						//Loading utilitzed variable values min and i into registers w19 and w20.
						ldr w20, [fp, i_m]							//Here we do the shuffling around of variables that sorting demands.
									
						add arrayPos_r, fp, array_m					//temp = v[min]
						ldr w21, [arrayPos_r, w19, SXTW intShift]
						str w21, [fp, temp_m]
										
						add arrayPos_r, fp, array_m					//v[min] = v[i]
						ldr w22, [arrayPos_r, w20, SXTW intShift]
									
						add arrayPos_r, fp, array_m
						str w22, [arrayPos_r, w19, SXTW intShift]
						
						ldr w23, [fp, temp_m]						//v[i] = temp			
						add arrayPos_r, fp, array_m
						str w23, [arrayPos_r, w20, SXTW intShift]
						
sortLoopIncrementI:		ldr w19, [fp, i_m]							//Increment i by 1, i is the loop counter.
						add w19, w19, 1
						str w19, [fp, i_m]

sortLoopTestI:			ldr w19, [fp, i_m]
						cmp w19, (SIZE-1)							//If i < SIZE-1, continue looping.
						b.lt sortLoopBodyI
						
printSorted:			adrp x0, introSortArrayStr					//Print the begining message to showing the sorted array.
						add x0, x0, :lo12:introSortArrayStr			
						bl printf
			
printArrayInit:			mov w19, wzr								//Initalize the printing sorted array loop, again setting i = 0.
						str w19, [fp, i_m]
						b printArrayTest
						
printArrayBody:			ldr w19, [fp, i_m]							//Load the index and the value of the array at this index.
						add arrayPos_r, fp, array_m
						ldr w20, [arrayPos_r, w19, SXTW intShift]
						
						adrp x0, showElementStr						//Print out the number to be stored at the given array index.
						add x0, x0, :lo12:showElementStr			
						mov w1, w19
						mov w2, w20
						bl printf			
						
printArrayIncrement:	ldr w19, [fp, i_m]							//Increment i by 1, i is the loop counter.
						add w19, w19, 1
						str w19, [fp, i_m]
						
printArrayTest:			cmp w19, SIZE								//Loop test, if i < SIZE then continue looping.
						b.lt printArrayBody
stop

