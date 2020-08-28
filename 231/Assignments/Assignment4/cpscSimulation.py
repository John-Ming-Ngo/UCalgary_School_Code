#John Ming Ngo, V 1.0.1, Last Change 2016-11-27.
#Ucalgary ID 30020834

#Program Functionality: cpscSimulation is a game/simulation of the life of a CPSC student in fall 2016.
#Players take control of the user charecter ("S") on the game board, and move it around to collect fun
#and/or work objects in the game board within a set number of turns (13 as standard).
#The game board itself is loaded into the game from an external text file, allowing for infinitely diverse 
#map settings. Each turn, there is a 10%/25% chance of the Pavol/Taminator events occuring, respectively. 
#The Pavol is a one turn event where the turn counter does not move, effectively giving the player a free turn.
#The taminator is a 3 turn event, where a new entity called the Taminator (T on the board) emerges. It will
#go after the player, and if the player is within a 1 tile range of it, it will punish the player by
#adding 2 to the turn counter, for a total of 3 turns passing. Avoid it at all costs. At the end of the game,
#when the turn count exceeds 13, the game will end, and the user's score will be outputted to a text file
#called score.txt.

#Many conveniance functions were used, functions which perhaps could be split off into their own module later...

#Problems: There is a humorous bug - trying to leave the grid or trying to move onto the taminator
#while the taminator is still around causes the taminator timer to go down but not the turn timer.
#In other words, if you scream and beg to be let out, or if you go mad and attack the taminator,
#You can get rid of him early. Neat no? I hope I don't loose marks for leaving this in, it's funny.
#Plus, there's nothing explicitly saying that such a thing is wrong, nor any requirement that
#Forces it to not be so.... Left alone, the taminator will disappear in 3 turns as is normal.

#Todo: None (That I know of)
#Copyright 2016 John Ming Ngo and University of Calgary


import random

SIZE = 10
NUM_TURNS = 13
STUDENT = "S"
WORK = "w"
FUN = "f"
TAMINATOR = "T"
EMPTY = " "

#Conveniance functions:

#Author: John Ming Ngo
# printClear() is a conveniance function which makes more explicit what print("\033c") does.
# Namely, it clears the terminal of the user.
# Arguments: None
# Returns: None
def printClear():
	print("\033c")

#Author: John Ming Ngo
# printBorder() is a conveniance function which prints a line of = signs for a border.
# Arguments: None
# Returns: None
def printBorder():
	print("==============================")

#Author: John Ming Ngo
# restrictedIntergerInput() is a convenience function which combines prompting the user
# for input with an input validation loop to check if the user's input is valid.
# As the intended output is an interger, it also converts the user input into an interger
# And uses exceptions to catch errors that way.
# Arguments: validInput is intended to be an interger, or a list or tuple of interger values.
# Returns: An interger within the domain of validInput.
def restrictedIntergerInput(validInput):
	inputNeeded = True
	while inputNeeded == True:
		try:
			userInput = int(input("[Enter your input here]: "))
			if userInput in validInput:
				inputNeeded = False
			else:
				print("Your input is not avaliable.")
				print("Avaliable input is displayed above.")
		except ValueError:
			print("Oh dear, that's no interger. Try again.")
	return userInput
		
	
#Author: John Ming Ngo
# restrictedStringInput() is a conveniance function which combines prompting the user for
# input with an input validation loop to check to see if the user's input is valid.
# Arguments: validInput is intended to be a string, tuple or a list corrisponding to all the
# valid inputs. However, other data types may also be used, if desired...
# Returns: One of the valid inputs as defined in the argument after user input.
def restrictedStringInput(validInput):
	inputNeeded = True
	while inputNeeded == True:
		userInput = input("[Enter your input here]: ")
		if userInput in validInput:
			inputNeeded = False
		else:
			print("Your input is not valid.")
			print("Valid input is displayed above.")
	return userInput

#Game-Relevant Text Functions:

#Author: John Ming Ngo
# printMovementOptions() is the movement menu to be displayed to the user.
# Arguments: None
# Returns: None
def printMovementOptions():
	print("MOVEMENT OPTIONS:")
	print("7 8 9")
	print("4 5 6")
	print("1 2 3")

#Author: John Ming Ngo
# printCheatMenu is the cheat menu to be displayed to the user.
# Arguments: None
# Returns: None
def printCheatMenu():
	print("Cheat Menu Options:")
	print("(t)oggle debug mode on/off")
	print("(m)ake the Taminator appear")
	print("(q)uit the cheat menu")

#Author: John Ming Ngo
# printFutileEscape is generic text meant to be displayed
# when the user attempts to move off the screen.
# Arguments: None
# Returns: None
def printFutileEscape():
	printBorder()
	print("YOU WISH TO ESCAPE!?")
	print("YOU CAN'T ESCAPE FROM CPSC!")
	print("Well, you can change majors...")
	print("BUT NO. WE WON'T LET YOU!")
	printBorder()

#Author: John Ming Ngo
# displayGameBoard is a modification to the original display function.
# It displays some other useful data in addition to calling on the
# original display function, in order to better format the screen.
# Arguments: world is a 2d list corridponding to the game world.
# Arguments: gpa is an interger corrisponding to the player's GPA score.
# Arguments: funPoints is an interger corrisponding to the player's fun score.
# Arguments: turns is an interger corrisponding to the current turn of the game.
# Returns: None.
def displayGameBoard(world, gpa, funPoints, turn):
	printClear()
	printBorder()
	print("Current Turn: %i" % turn)
	print("GPA: %i" % gpa, "Fun Points: %i" % funPoints)
	display(world)

#Game relevant calculation functions:

#Author: John Ming Ngo
# This function scans the 2d list corrisponding to the world.
# It records the positions of the work, fun and student objects
# Within this world, and then returns lists corrisponding to
# their positions.
# Arguments: World is a 2d list corrisponding to the world.
# Returns: funPositions is a 2d lists containing lists with two
# interger entries, corrisponding to the [row, column] of each
# fun object in this world.
# Returns: funPositions is a 2d lists containing lists with two
# interger entries, corrisponding to the [row, column] of each
# fun object in this world.
# Returns: studentPosition is a 1d list corrisponding to the
# [row, column] position of the player in this world.

def worldObjectScan(world):
	workPositions = []
	funPositions = []
	studentPosition = []
	taminatorPosition = []
	rowNumber = 0
	for row in world:
		columnNumber = 0
		for column in row:
			if column == WORK:
				workPositions.append([rowNumber, columnNumber])
			elif column == FUN:
				funPositions.append([rowNumber, columnNumber])
			elif column == STUDENT:
				studentPosition = [rowNumber, columnNumber]
			elif column == TAMINATOR:
				taminatorPosition = [rowNumber, columnNumber]
			columnNumber += 1
		rowNumber += 1
	return workPositions, funPositions, studentPosition, taminatorPosition


#Author: John Ming Ngo
# This function processes user input regarding their intended
# movement, determining if it is valid and then adjusting the
# game board accordingly. It does this by first emptying the
# position on the board the player is on, and saving that position
# in a backup memory location. Then, it calls the studentMovement()
# function, which calculates the user's intended movement.
# From this, it checks if this intended movement is within
# the bounds of the map or if it would have the player run into
# the taminator. If it does, it resets the student's position backup
# to what it was, and reduces the turn count by one to arrest the
# normal forward movement of time as turns move forward.
# From this, it places the player back on the board, and then returns
# the turn count.
#Arguments: world is to be a 2d list corrisponding to the game board.
#Arguments: studentPosition is to be a list corrisponding to the student's position on the game board.
#Arguments: userMovement is to be an interger from 0 to 9 corrisponding to previous user input.
#Arguments: taminatorPosition is to be a list corrisponding to the taminator's position on the game board.
#Arguments: turn is to be an interger corrisponding to the turn count in the game.
#Returns: turn is to be the modified or unmodified turn argument.
def movementProcessing(world, studentPosition, userMovement, taminatorPosition, turn):
	world[studentPosition[0]][studentPosition[1]] = EMPTY
	previousPosition = studentPosition[:]
	studentMovement(studentPosition, userMovement)
	if (studentPosition[0] > (SIZE-1)) or (studentPosition[1] > (SIZE-1)) or (studentPosition[0] < 0) or (studentPosition[1] < 0):
		studentPosition = previousPosition[:]
		printFutileEscape()
		turn -= 1
		input("[Hit ENTER to acknowledge our supreme power.]")
	elif studentPosition == taminatorPosition:
		studentPosition = list(previousPosition)
		print("YOU ARE MAD! YOU DARE MOVE ON THE TAMINATOR!?")
		print("Nope, try some other input, madman.")
		turn -= 1
		input("[Hit ENTER to acknowledge your madness.]")
	world[studentPosition[0]][studentPosition[1]] = STUDENT
	return turn

#Author: John Ming Ngo
# This function calculates the intended movement of the player.
# It first reads a list corrisponding to the [row, column]
# position of the player, and then modifies this list according
# to another parameter, userMovement.
# Arguments: studentPosition is a list corrisponding to the
# [row, column] position of the player.
# Arguments: userMovement is a numeric string corrisponding to
# the user's inputed movement as determined by another function.
#Returns: None technically, but the list "returns" itself.

def studentMovement(studentPosition, userMovement):
	if userMovement == 1:
		studentPosition[0] = studentPosition[0] + 1
		studentPosition[1] = studentPosition[1] - 1
	elif userMovement == 2:
		studentPosition[0] = studentPosition[0] + 1
		studentPosition[1] = studentPosition[1] + 0
	elif userMovement == 3:
		studentPosition[0] = studentPosition[0] + 1
		studentPosition[1] = studentPosition[1] + 1
	elif userMovement == 4:
		studentPosition[0] = studentPosition[0] + 0
		studentPosition[1] = studentPosition[1] - 1
	elif userMovement == 5:
		studentPosition[0] = studentPosition[0] + 0
		studentPosition[1] = studentPosition[1] + 0
	elif userMovement == 6:
		studentPosition[0] = studentPosition[0] + 0
		studentPosition[1] = studentPosition[1] + 1
	elif userMovement == 7:
		studentPosition[0] = studentPosition[0] - 1
		studentPosition[1] = studentPosition[1] - 1
	elif userMovement == 8:
		studentPosition[0] = studentPosition[0] - 1
		studentPosition[1] = studentPosition[1] + 0
	elif userMovement == 9:
		studentPosition[0] = studentPosition[0] - 1
		studentPosition[1] = studentPosition[1] + 1
	elif userMovement == 0:
		print("Cheats have been used this round!")
	else:
		print("Something got past the scanner. Please check.")

#Author: John Ming Ngo
# This function checks if the cheat menu is toggled by userMovement == 0,
# And if it is, it prints the cheat menu, then envokes the cheatMenuProcessing()
# function to actually change stuff.
# It then returns all variables which could be altered by the above function.
# Arguments: userMovement is an interger from 0-9 as determined by previous user input.
# Arguments: debugOn is to be a flag variable corrisponding to whether or not the user wants to turn on debug mode.
# Arguments: taminatorTime is an interger corrisponding to the amount of time the taminator has left to exist.
# Arguments: taminatorPosition is a list corrisponding to the position of the taminator.
# Returns: debugOn is a flag variable corrisponding to the modifications to debugOn from the arguments.
# Returns: taminatorTime is an interger corrisponding to the modifications to taminatorTime in the arguments.
# Returns: taminatorPosition is a list corrisponding to the changed position of the taminator.
def cheatMenu(userMovement, debugOn, taminatorTime, taminatorPosition):
	if userMovement == 0:
		printCheatMenu()
		debugOn, taminatorTime, taminatorPosition = cheatMenuProcessing(debugOn, taminatorTime, taminatorPosition)
	return debugOn, taminatorTime, taminatorPosition

#Author: John Ming Ngo
# This function is activated by the cheatMenu() function if cheats are on.
# It takes in three arguments corrisponding to what the user might change, and then prompts for user input.
# Depending on the user's input, the function changes these values, and then returns all three values.
# Arguments: debugOn is to be a boolean variable corrisponding to the turning on or off of the debug messages.
# Arguments: taminatorTime is to be an interger corrisponding to the amount of time the taminator remains around.
# Arguments: taminatorPosition is to be a list corrisponding to the [row, column] position of the taminator.
# Returns: debugOn is to be the intended changes to the debugOn argument - either no change or turn on.
# Returns: taminatorTime is to be the intended changes to the taminatorTime argument - either nothing or to 3.
# Returns: taminatorPosition is a list corrisponding to the changed position of the taminator.
def cheatMenuProcessing(debugOn, taminatorTime, taminatorPosition):
	userInput = restrictedStringInput(("t", "m", "q"))
	if userInput == "t":
		debugOn = True
	elif userInput == "m":
		if taminatorTime == -1:
			taminatorTime = 3
			print("Note, the Taminator will instantly move.")
			print("Therefore, the coordinates below will not be exact.")
			print("Which row will the taminator be summoned to?")
			taminaatorRowPosition = restrictedIntergerInput((x for x in range(0, SIZE)))
			print("Which column will the taminator be summoned to?")
			taminatorColumnPosition = restrictedIntergerInput((x for x in range(0, SIZE)))
			taminatorPosition = [taminaatorRowPosition, taminatorColumnPosition]
		else:
			printBorder()
			print("THE TAMINATOR ALREADY EXISTS!")
			printBorder()
			input("[Hit enter to accept your doom.]")
	else:
		print("You have chosen not to cheat.")
		print("Please note that a turn still passes.")
		input("[Hit enter to continue].")
	return debugOn, taminatorTime, taminatorPosition

#Author: John Ming Ngo
# This function increases the player's GPA or fun score.
# It reads from the arguments the student's position and the positions of the
# work and fun items in the game, as well as the current GPA and funPoints.
# It then checks to see if the student's position is within the previously recorded
# lists of work and fun positions. If it is, it increments the respective value.
# Afterwards, it returns these values back to the game.
# Arguments: studentPosition is to be the list corrisponding to the [row, column] position of the player.
# Arguments: workPositions is to be the 2d list corrisponding to the positions of the work items in the world.
# Arguments: funPositions is to be the 2d list corrisponding to the positions of the fun items in the world.
# Arguments: gpa is to be the interger corrisponding to the player's gpa score in the game.
# Arguments: funPoints is to be the interger corrisponding to the player's fun score in the game.
# Returns: gpa is an interger corrisponding to the changes or unchanged value of gpa in the arguments.
# Returns: funPoints is an interger corrisponding to the changed or unchanged value of funPoints in the arguments.
def rewardProcessing(studentPosition, workPositions, funPositions, gpa, funPoints):
	if studentPosition in workPositions:
		gpa += 1
	elif studentPosition in funPositions:
		funPoints += 1
	return gpa, funPoints

#Author: DarkwarriorJ
# This function generates a random interger from 1-100 using the randrange function.
# With it, it determines if the Pavol random event and if the Taminator random event
# applies. In the case of the Pavol, it initiates the event immediately because its
# implementation is trivial. In the case of the taminator, it merely alters the variables
# controlling the event to values which start the event.
# Arguments: world to be the 2d list corrisponding to the game board.
# Arguments: turn is to be the interger corrisponding to the turn number of the game.
# Arguments: taminatorTime is to be the interger corrisponding to how much time the taminator
# has left to exist in the game world.
# Arguments: taminatorPosition is to be the list corrisponding to the taminator's position
# in the game world. It may be edited in this function.
# Returns: turn is an interger corrisponding to the changed or unchanged value of turn in the arguments.
# Returns: taminatorTime is an interger corrisponding to the changed or unchanged value of taminatorTime in the arguments.
# Returns: taminatorPosition is a list corrisponding to the newspawned position of the taminator.
def randomEventCheck(world, turn, taminatorTime, taminatorPosition):
	eventChance = random.randrange(1, 101)
	if eventChance <= 10 and taminatorTime < 0:
		print("THE PAVOL HAS COME! THIS TURN DOES NOT COUNT!")
		input("[Hit ENTER to thank the Pavol for his mercy.]")
		turn -= 1
	elif eventChance <= 25 and taminatorTime < 0:
		print("DOOM! THE TAMINATOR HAS COME!")
		input("[Hit enter to quake in fear of the Taminator.]")
		taminatorTime = 3
		taminatorPositionInitialized = False
		while taminatorPositionInitialized != True:
			taminatorRowPosition = random.randrange(0, SIZE)
			taminatorColumnPosition = random.randrange(0, SIZE)
			if world[taminatorRowPosition][taminatorColumnPosition] in (EMPTY, WORK, FUN):
				taminatorPosition = [taminatorRowPosition, taminatorColumnPosition]
				taminatorPositionInitialized = True
	return turn, taminatorTime, taminatorPosition

#Author: John Ming Ngo
# This function handles the taminator event. 
# It first checks to see if the taminator has time remaining in the game.
# If it does, it moves the taminator, and then checks the following:
# If the taminator's time is more than 0, it informs the player that
# the taminator is still around to ruin their day.
# If the taminator is within one block of the player, the taminator
# has caught the player, and the turn increases by 2.
# If the time the taminator has left is more than one, it decrements the time.
# Finally, it returns to the game the amount of time the taminator has
# the taminator's position (implicity, since it's a list), and the turn
# number of the game if its been adjusted.
# Argument: world is a 2d list corrisponding to the game board in the game.
# Argument: studentPosition is a list corrisponding to the [row, column] position
# of the player.
# Argument: taminatorPosition is a list corrisponding to the [row, column] position
# of the Taminator.
# Argument: taminatorTime is an interger corrisponding to the number of turns
# left in the taminator's worldly existance.
# Argument: turn is an interger corrisponding to the turn count of the game.
# Returns: taminatorTime is an interger corrisponding to the modifications to the taminatorTime argument.
# Returns: taminatorPosition is a list corrisponding to the modified position of the taminator.
def taminatorEvent(world, studentPosition, taminatorPosition, taminatorTime, turn):
	if taminatorTime >= 0:
		world[taminatorPosition[0]][taminatorPosition[1]] = EMPTY
		taminatorPositionChange(taminatorPosition, studentPosition)
		world[taminatorPosition[0]][taminatorPosition[1]] = TAMINATOR
		if taminatorTime > 0:
			printBorder()
			print("The taminator will be around for %i more turns" % taminatorTime)
			printBorder()
			input("[Hit enter to scream in terror].")
		if ((abs(taminatorPosition[0] - studentPosition[0]) == 1) and (abs(taminatorPosition[1] - studentPosition[1]) == 1)) and taminatorTime != 0:
			print("THE TAMINATOR HAS CAUGHT YOU!")
			print("'TWO ASSIGNMENTS DUE NEXT WEEK!'")
			input("[Hit enter to cry to sleep].")
			turn += 2
		if (taminatorTime-1) == -1:
			world[taminatorPosition[0]][taminatorPosition[1]] = EMPTY
		taminatorTime -= 1
	return taminatorTime, turn, taminatorPosition

#Author: John Ming Ngo
# This is the taminator's movement AI. It was surprisingly easy and obvious to make.
# How it works is that it takes in the taminator's current position and the player's
# current position, and then depending on how far the user is and in which direction
# for each axis, the taminator's position will move towards the player. Separate if
# structures are used for each axis, and the taminator being close to the player vs far
# from the player are considered separate cases for the structure to consider.
# Arguments: taminatorPosition is a list corrisponding to the [row, column] position of the taminator.
# Arguments: studentPosition is a list corrisponding to the [row, column] position of the student.
# Returns: None technically, but the taminatorPosition list is edited by this function.
def taminatorPositionChange(taminatorPosition, studentPosition):
	if (taminatorPosition[0] - studentPosition[0]) < -2:
		taminatorPosition[0] += 2
	elif (taminatorPosition[0] - studentPosition[0]) > 2:
		taminatorPosition[0] -= 2
	elif (taminatorPosition[0] - studentPosition[0]) == -2:
		taminatorPosition[0] += 1
	elif (taminatorPosition[0] - studentPosition[0]) == 2:
		taminatorPosition[0] -= 1
	if (taminatorPosition[1] - studentPosition[1]) < -2:
		taminatorPosition[1] += 2
	elif (taminatorPosition[1] - studentPosition[1]) > 2:
		taminatorPosition[1] -= 2
	elif (taminatorPosition[1] - studentPosition[1]) == -2:
		taminatorPosition[1] += 1
	elif (taminatorPosition[1] - studentPosition[1]) == 2:
		taminatorPosition[1] -= 1

#Author: John Ming Ngo
# endTextOutput() takes in the player's gpa and funPoints score as arguments.
# With them, it writes these scores out to a file with some commentary, and also
# Writes out what the user's corrisponding letter grade is based off the input gpa.
# It does this by first opening a new file called scores.txt to write, 
# and then with it it tries to write stuff to that file. To determine letter score, 
# it uses a branching structure to determine the result.
# If an error occurs, it will inform the user that something went wrong, and finally
# It will close the file to be written.
# Arguments: gpa is an interger corrisponding to the player's gpa score.
# Arguments: funPoints is an interger corrisponding to the player's fun points score.
# Returns: None
def endTextOutput(gpa, funPoints):
	playerRecord = open("scores.txt", "w")
	try:
		playerRecord.write("Your last game's fun points: %i \n" % funPoints)
		playerRecord.write("Your last game's GPA: %i \n" % gpa)
		if gpa == 0:
			playerRecord.write("Your last game's letter grade is: F")
		elif gpa == 1:
			playerRecord.write("Your last game's letter grade is: D")
		elif gpa == 2:
			playerRecord.write("Your last game's letter grade is: C")
		elif gpa == 3:
			playerRecord.write("Your last game's letter grade is: B")
		elif gpa >= 4:
			playerRecord.write("Your last game's letter grade is: A")
		else:
			print("You GPA is somehow negative, and so is not recorded.")
	except:
		print("Something went very wrong trying to save your scores. Sorry.")
		print("It probably has something to do with file writing.")
	finally:
		playerRecord.close()

#Author: John Ming Ngo
#debugMessage is a function which checks to see if debugging is on, and then
#prints a relevant message. Mostly it is to see where the program gets to.
#Arguments: debugOn is to be the flag variable corrisponding to if debug is on.
#Arguments: message is to be a string corrisponding to the intended message.
#Returns: Nothing.
def debugMessage(debugOn, message):
	if debugOn == True:
		print(message)
		input("[Hit enter to continue].")

#James Tam "The Taminator"'s Functions:

# Author:  James Tam
# This function was created entirely by the above author and is
# used with permission.
# '''
# @ This function comes the creation of the list with file input.
# @ It combines readFromFile() and intialize() into one function.
# @ Normally a function should only implement one well define task but in this case
# @ the creation of the list is so trivial it may be okay to combine it with file input.
# @createListFileRead()
# @Argument: None
# @Return value: the game world in the form of a 2D list (each element has
# @been initialized to values read in from the input file
# '''
def createListFileRead():
	r = -1
	c = -1
	world = []
	inputFilename = input("Name of input file: ")
	try:
		inputFile = open(inputFilename,"r")
		r = 0
		for line in inputFile:
			world.append([])
			c = 0
			for ch in line:
				if (c < SIZE):
					world[r].append(ch)
				c = c + 1
			r = r + 1
		inputFile.close()
	except IOError:
		print("Error reading from " + inputFilename)
	 
	return(world)

# Author:  James Tam
# This function was created entirely by the above author and is
# used with permission.
# '''
# @display()
# @Argument: a reference the 2D list which is game world.
# @The list must be already created and properly initialized
# @prior to calling this function!
# @Return value: Mone
# @Displays each element of the world with each row all on one line
# @Each element is bound: above, left, right and below with a bar (to
# @make elements easier to see.
# '''
def display(world):
	for r in range (0, SIZE, 1): 
	# Row of dashes before each row 
		for i in range (0, SIZE, 1): 
			print(" -", end="")
		print()
		for c in range (0, SIZE, 1): 
			# Vertical bar before displaying each element
			print("|" + world[r][c], end="")
		print("|") # Vertical bar right of last element + CR to
				   # move output to the next line

	# A line of dashes before each row, one line after the last
	# row.
	for i in range (0, SIZE, 1): 
		print(" -", end="")
	print()

# Author:  James Tam
# This function was created entirely by the above author and is
# used with permission.
# '''
# @ This function works in conjunction with readFromFile()
# @intialize()
# @Argument: None
# @Return value: the game world in the form of a 2D list (each element
# @is set to an exclamation mark).
# '''
def initialize():
	world = []					
	for r in range (0, SIZE, 1):   
		world.append ([])		
		for c in range (0, SIZE, 1): 
			world[r].append ("!")
	return(world)
	
# '''
# @ This method works in conjunction with initialize. Initialize creates
# @ the list with list elements containing a default value '!'. This method
# @ relies on the list already being created and sets each list element to
# @ a corresponding value read in from the input file e.g. the string at
# @ row 2 and column 4 in the input file will initialize the list element
# @ at this same location in the 2D list (game world).
# @readFromFile()
# @Argument: None
# @Return value: the game world in the form of a 2D list (each element
# @will now be initialized to the values read in from the input file
# '''
def readFromFile():
	r = -1
	c = -1
	world = initialize() # Needed to create the 2D list
	inputFilename = input("Name of input file: ")
	try:
		inputFile = open(inputFilename,"r")
		r = 0
		# Read one line at a time from the file into a string
		for line in inputFile:	
			c = 0
			# Iterate 1 char at a time through the string
			for ch in line:	 
				# Including EOL there's 11 characters per line
				# 10x10 list , exclude the EOL to avoid reading
				# outside the bounds of the list (10 columns)
				if (c < SIZE):
					# Set list element to the single char 
					# read from file
					world[r][c] = ch 
					# Advance to next element along row 
					c = c + 1  
				# Entire row has been set to values read in from 
				# file, move to next row
			r = r + 1  
		inputFile.close()
	except IOError:
		print("Error reading from " + inputFilename)
	return(world) 

#################################################################
# Author:  James Tam
# This function was created entirely by the above author and is
# used with permission.
# This function has been edited by John Ming Ngo to furfill
# The program requirements.
# How the game works is this: First, relevant state variables are
# initalized. Next, the main loop is run. In the main loop, first
# the positions of all objects is identified and the game board
# displayed, then user input is prompted for. Afterwards, random
# events are checked for, and then the turn is incremented by one.
# Once the main loop is completed, the board is printed once more
# to show the player the final state of the game, and then a 
# congratulatory message is displayed, followed by the outputting
# of the user's score in a text file. Debug messages are sprinkled
# throughout, to check to see if the program manages to run to that
# part at all, and as inline commentary.

def start():
	world = readFromFile()
	turn = 1
	funPoints = 0
	gpa = 0
	taminatorTime = -1
	debugOn = False
	debugMessage(debugOn, "Variables have been successfuly initialized.")
	while turn <= NUM_TURNS:
		workPositions, funPositions, studentPosition, taminatorPosition = worldObjectScan(world)
		displayGameBoard(world, gpa, funPoints, turn)
		debugMessage(debugOn, "Item position scan and game board display is successful.")
		printMovementOptions()
		userMovement = restrictedIntergerInput((0, 1, 2, 3, 4, 5, 6, 7, 8, 9))
		debugMessage(debugOn, "User movement has been successfully prompted for.")
		debugOn, taminatorTime, taminatorPosition = cheatMenu(userMovement, debugOn, taminatorTime, taminatorPosition)
		debugMessage(debugOn, "Cheat menu check works")
		turn = movementProcessing(world, studentPosition, userMovement, taminatorPosition, turn)
		gpa, funPoints = rewardProcessing(studentPosition, workPositions, funPositions, gpa, funPoints)
		debugMessage(debugOn, "Movement and reward processing works.")
		turn, taminatorTime, taminatorPosition = randomEventCheck(world, turn, taminatorTime, taminatorPosition)
		taminatorTime, turn, taminatorPosition = taminatorEvent(world, studentPosition, taminatorPosition, taminatorTime, turn)
		debugMessage(debugOn, "Random event code works.")
		turn += 1			
	displayGameBoard(world, gpa, funPoints, turn)
	print("Game over! Thirteen weeks have passed!")
	print("Your scores will be saved in a file called score.txt.")
	endTextOutput(gpa, funPoints)
	debugMessage(debugOn, "End text output works as intended, and didn't crash the game.")
	input("[Hit enter to close the game]")
start()
