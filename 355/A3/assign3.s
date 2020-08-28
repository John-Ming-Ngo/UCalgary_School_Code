//Author: John Ming Ngo, 30020834
//This program generates an array of a given size and initalizes each part of the array to a random value.
//From there, it uses selection sort to sort all of the values in order, and prints out the unsorted and sorted arrays.

//Starting and stopping the program code, adjusted for variable memory allocation.

		

	
//Simple redefining of constants.


	//Size of integer on the stack.

	
//Defining allocated memory locations.







//Defining commonly used registers.


//Strings used in this program.
showElementStr:		.string	"v[%d]: %d\n"
introSortArrayStr:	.string "\nSorted array:\n"


		.balign 4
		.global main			
main:	stp	x29, x30, [sp, -(16 + 4 * 50 + 4 + 4 + 4 + 4) & -16]!
		mov	x29, sp										//Standard Beginning Boilerplate Code
											
initalizeVars:			str wzr, [x29, 16 + 4 * 50]							//Initialize all variables except the array to 0, just to make sure.
						str wzr, [x29, 16 + 4 * 50 + 4]							//We can get away with not initalizing the array because the array gets initialized with random numbers later.
						str wzr, [x29, 16 + 4 * 50 + 4 + 4]						//This step implemented on TA recommendation.
						str wzr, [x29, 16 + 4 * 50 + 4 + 4 + 4]
																						
arrayRandInit:			str wzr, [x29, 16 + 4 * 50]							//Initialize i to 0, then begin the loop. Beginning of the array initialization loop.
						b randLoopTest
						
randLoopBody:			bl rand										//Loop body, first get a random number with the rand function.
						and w20, w0, 0xFF							//And this number with 0xFF to keep it in a certain size.
						
						ldr w19, [x29, 16 + 4 * 50]							//Calculate the position of the array corrisponding to the index i, 
						add x24, x29, 16					//and then store the random number in the array at the index given.
						str w20, [x24, w19, SXTW 2]
						
						adrp x0, showElementStr						//Print out the random number to be stored at the given array index.
						add x0, x0, :lo12:showElementStr	
						mov w1, w19
						mov w2, w20
						bl printf
						
randLoopIncrement:		ldr w19, [x29, 16 + 4 * 50]							//Increment i by one afterwards.
						add w19, w19, 1
						str w19, [x29, 16 + 4 * 50]
						
randLoopTest:			ldr w19, [x29, 16 + 4 * 50]
						cmp w19, 50								//Loop test, if i < 50, keep looping.
						b.lt randLoopBody						

				
sortLoopInitI:			str wzr, [x29, 16 + 4 * 50]							//Beginning of the selection sort loop, set i to 0 again and then begin the loop.
						b sortLoopTestI

sortLoopBodyI:			ldr w19, [x29, 16 + 4 * 50]							//Set the current minimum to be i, in other words, the index of the minimum value is i.
						str w19, [x29, 16 + 4 * 50 + 4 + 4]
						
sortLoopInitJ: 			ldr w21, [x29, 16 + 4 * 50]							//Beginning of the inner loop for selection sort, with j = i + 1.
						add w20, w21, 1								//So first we need to load i, add one to it, and then set j to it.
						mov w19, w20
						str w19, [x29, 16 + 4 * 50 + 4]
						b sortLoopTestJ		
						
sortLoopBodyJ:			ldr w19, [x29, 16 + 4 * 50 + 4]							//Loading utilitzed variable values j and min into registers w19 and w20.			
						add x24, x29, 16					//Calculating the array position given an array call v[j], and stores the value.
						ldr w21, [x24, w19, SXTW 2]	//Working value is stored in registry w21.
												
						ldr w20, [x29, 16 + 4 * 50 + 4 + 4]						//Calculating the array position given an array call v[min], and stores the value.
						add x24, x29, 16					//Value is stored in registry w22.
						ldr w22, [x24, w20, SXTW 2]
						
						cmp w21, w22								//Check: v[j] < v[min]
						b.ge sortLoopIncrementJ
						
						ldr w23, [x29, 16 + 4 * 50 + 4]							//If that is true, set the min to j.
						str w23, [x29, 16 + 4 * 50 + 4 + 4]

sortLoopIncrementJ:		ldr w19, [x29, 16 + 4 * 50 + 4]							//Increment j by 1. j is the loop counter.
						add w19, w19, 1
						str w19, [x29, 16 + 4 * 50 + 4]

sortLoopTestJ:			ldr w19, [x29, 16 + 4 * 50 + 4]
						cmp w19, 50								//If j < 50, continue looping.
						b.lt sortLoopBodyJ

sortLoopBodyI2:			ldr w19, [x29, 16 + 4 * 50 + 4 + 4]						//Loading utilitzed variable values min and i into registers w19 and w20.
						ldr w20, [x29, 16 + 4 * 50]							//Here we do the shuffling around of variables that sorting demands.
									
						add x24, x29, 16					//temp = v[min]
						ldr w21, [x24, w19, SXTW 2]
						str w21, [x29, 16 + 4 * 50 + 4 + 4 + 4]
										
						add x24, x29, 16					//v[min] = v[i]
						ldr w22, [x24, w20, SXTW 2]
									
						add x24, x29, 16
						str w22, [x24, w19, SXTW 2]
						
						ldr w23, [x29, 16 + 4 * 50 + 4 + 4 + 4]						//v[i] = temp			
						add x24, x29, 16
						str w23, [x24, w20, SXTW 2]
						
sortLoopIncrementI:		ldr w19, [x29, 16 + 4 * 50]							//Increment i by 1, i is the loop counter.
						add w19, w19, 1
						str w19, [x29, 16 + 4 * 50]

sortLoopTestI:			ldr w19, [x29, 16 + 4 * 50]
						cmp w19, (50-1)							//If i < 50-1, continue looping.
						b.lt sortLoopBodyI
						
printSorted:			adrp x0, introSortArrayStr					//Print the begining message to showing the sorted array.
						add x0, x0, :lo12:introSortArrayStr			
						bl printf
			
printArrayInit:			mov w19, wzr								//Initalize the printing sorted array loop, again setting i = 0.
						str w19, [x29, 16 + 4 * 50]
						b printArrayTest
						
printArrayBody:			ldr w19, [x29, 16 + 4 * 50]							//Load the index and the value of the array at this index.
						add x24, x29, 16
						ldr w20, [x24, w19, SXTW 2]
						
						adrp x0, showElementStr						//Print out the number to be stored at the given array index.
						add x0, x0, :lo12:showElementStr			
						mov w1, w19
						mov w2, w20
						bl printf			
						
printArrayIncrement:	ldr w19, [x29, 16 + 4 * 50]							//Increment i by 1, i is the loop counter.
						add w19, w19, 1
						str w19, [x29, 16 + 4 * 50]
						
printArrayTest:			cmp w19, 50								//Loop test, if i < 50 then continue looping.
						b.lt printArrayBody

exit:	ldp	x29, x30, [sp], -(-(16 + 4 * 50 + 4 + 4 + 4 + 4) & -16)			
		ret												//Standard Exiting Boilerplate Code

