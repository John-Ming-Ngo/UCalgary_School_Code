#John Ming Ngo, V 1.0.1, Last Change 2016-11-14.
#Ucalgary ID 30020834

#This is a text based adventure game whereby a player enters what they believe to be Mr. Fedral's house.
#This assumption will be slowly shattered as the game gets more and more surreal.................
#They must explore the various rooms of the house, fiddling with the avaliable options until they finish each stage.
#The game is divided into two stages separated by transition text which eases players into each stage/their victory.
#Stage one is won when the player unlocks and opens the door. They do this by exploring the rooms,
#Fiddling with the appropriate lever/dials which will adjust the state variables in the stage until the stage variables align
#With the unlocking condition of the door. Once the door's conditions are met and they try to open the door, the stage ends.
#Stage two is won when the player climbs the vine to "paradise". They do this by exploring the rooms, picking up the items,
#And fiddling with the placement/giving of these items until they make the mouse go water the plant.
#This picking up and placing of items will flip state variables until the option to feed the cheese to the mouse appears,
#Which will flip the important state variable "isPlantGrown", allowing the player to climb onto the plant and win the game.

#Problems: I am incredibly uncertain if I documented things properly at all. Aack.
#Todo: None known,
#Copyright 2016 John Ming Ngo and University of Calgary

#Main Function
#The main program function which runs the entire game.
#The game is composed of two stages flanked by transition text which introduces each stage or announces victory.
#Each function inside the main function is executed in order, and as such they are each totally separate.
#Parameters: None
#Returns: None
def main():
	introText()
	stageOne()
	transitionText()
	stageTwo()
	victoryText()


#Conveniance Functions:
#Not particularly relevant to the assignment, their main use is in text formating in the various text functions below.
#They are made generally to standardize things and to make it more clear what they are supposed to do.
#Ex. printClear() is, in my opinion, far more clear than print("\033c").

#printClear() clears the terminal of the user via a print statement.
#Parameters: None
#Returns: None
def printClear():
	print("\033c")

#lineBorder() draws a line of dashes to the screen via a print statement. 80 Dashes
#Parameters: None
#Returns: None
def lineBorder():
	print("-------------------------------------------------------------------------------")

#Intro Text
#Introduces the user to the game and its setting via printing some text framed by dashes.
#It then awaits user input to continue.
#Parameters: None
#Returns: None
def introText():
	printClear()
	lineBorder()
	print("You have broken into Mr. Federl 's house.")
	print("He has safeguarded his house against intruders.")
	print("Only problem is that he did it backwards.")
	print("This you know because the doorway out just disappeared.")
	print("It seems you must go deeper into his house.")
	lineBorder()
	input("[Hit enter to continue.]")

#Stage One
#The first half of the game. It consists of four state variables modified by the user as the stage is running.
#The stage runs via a while loop which executes the relevant room function according to user input.
#The stage ends when one ends the main loop by setting the state variable innerDoorLocked to False.
#Parameters: None
#Returns: None
def stageOne():
	roomSelection = "0"
	dial = "0"
	lever = "0"
	innerDoorLocked = True
	while innerDoorLocked == True:
		if roomSelection == "0":
			roomSelection = entranceRoom()
		elif roomSelection == "1":
			roomSelection, innerDoorLocked = stageOneDoor(dial, lever)
		elif roomSelection == "2":
			roomSelection, dial = pantryRoom(dial)
		elif roomSelection == "3":
			roomSelection, lever = kitchenRoom(lever)
		else:
			print("BUG DETECTED")
			roomSelection = "0"

#Stage One - Entrance Room
#The entrance room presents the situation in the room to the user and then  presents a menu of options.
#It then prompts for user input on the user's choice, and returns this choice.
#Parameters: None
#Returns: roomSelection is a numeric string which is to be used by the main loop in deciding which room to execute,
def entranceRoom():
	entranceRoomIntroText()
	entranceRoomMenuText()
	roomSelection = entranceRoomPathSelection()
	return roomSelection

#Stage One - Entrance Room - Entrance Room Intro Text
#Presents the situation in the room to the user via printing text surrounded by line borders.
#Parameters: None
#Returns: None
def entranceRoomIntroText():
	printClear()
	lineBorder()
	print("You are in the entrance room of his house.")
	print("It is pretty bland. In fact, paint is slowly peeling.")
	print("There is a door in front of you.")
	print("There are also two entryways - one to your left and one to your right.")
	lineBorder()

#Stage One - Entrance Room - Entrance Room Menu Text
#Presents a menu of options to the user pertaining to the Entrance room.
#Parameters: None
#Returns: None
def entranceRoomMenuText():
	print("Choose which way you want to go:")
	lineBorder()
	print("1. Try to open the door.")
	print("2. Go through the left entryway.")
	print("3. Go through the right entryway.")
	lineBorder()

#Stage One - Entrance Room - Entrance Room Path Selection
#Prompts for user input regarding their choice of option.
#Ensures it is within the valid options via an input validation loop.
#Inputs: None
#Returns: roomSelection is a numeric string which is to be returned to the entrance room function.
def entranceRoomPathSelection():
	inputNeeded = True
	while inputNeeded == True:
		userInput = input("Enter your choice here: ")
		if userInput not in ("1", "2", "3"):
			lineBorder()
			print("You have walked through the walls and back to where you started.")
			print("Please stick to the avaliable options (1, 2 and 3) next time.")
			lineBorder()
			input("[Hit enter to continue].")
		else:
			return userInput

#Stage One - Door
#The door function reads the status of the dial and lever state variables.
#After doing so, it either ends the stage or informs the user that the door remains locked.
#It does this via branching if statements and returning the appropriate values in its returns.
#Parameters: dial is the state variable in the entrance room pertaining to the status of the dial.
#Parameters: lever is the state variable in the entrance room pertaining to the status of the lever.
#Returns: roomSelection is a numeric string returned to the stageOne function.
#Returns: innerDoorLocked is a numeric string returned to the stageOne function.
def stageOneDoor(dial, lever):
	if dial == "2" and lever == "1":
		roomSelection = "0"
		innerDoorLocked = False
	else:
		roomSelection = "0"
		innerDoorLocked = True
		printClear()
		lineBorder()
		print("The door remains locked.")
		print("There's some wires leading out of the doorframe...")
		print("They lead to the two entryways...")
		lineBorder()
		input("[Hit enter to continue.]")
	return roomSelection, innerDoorLocked

#Stage One - Pantry Room
#The pantry room function reads the status of the dial state function.
#It then presents the situation to the user and reports on the status of the dial to the user.
#Finally, it displays a menu of possible options and prompts for user input, before returning this input.
#Parameters: dial is to be the state variable corrisponding to the dial in stage one.
#Returns: roomSelection is an numeric sting returned to the stageOne function for purposes of room selection,
#Returns: dial is a numeric string returned to the stageOne function meant to modify the dial state variable.
def pantryRoom(dial):
	pantryRoomIntroText()
	dialReporter(dial)
	pantryRoomMenuText()
	roomSelection, dial = pantryRoomDialSelection(dial)
	return roomSelection, dial

#Stage One - Pantry Room - Pantry Room Intro Text
#Presents the situation to the user via printing text framed by a border of lines.
#Inputs: None
#Returns: None
def pantryRoomIntroText():
	printClear()
	lineBorder()
	print("You seem to be in Mr. Fedral's pantry room.")
	print("There are bags of chips strewn all over the floor.")
	print("You notice a strange dial near his bag of chips.")
	print("The dial seems to have three settings: Blue, Red and Green.")
	lineBorder()

#Stage One - Pantry Room - Dial State Reporter
#Presents the current state of the dial to the user via reading an input parameter.
#It takes the parameter to decide using a branching structure what to print to the screen.
#Parameters: dial is meant to be a numeric string corrisponding to the state of the dial variable in stage one.
#Returns: None
def dialReporter(dial):
	if dial == "0":
		print("The dial is currently set to nothing.")
		lineBorder()
	elif dial == "1":
		print("The dial is currently set to Blue.")
		lineBorder()
	elif dial == "2":
		print("The dial is currently set to Red.")
		lineBorder()
	elif dial == "3":
		print("The dial is currently set to Green.")
		lineBorder()
	else:
		print("The dial is currently set to IMPOSSIBLE!")
		print("BUG DETECTED.")
		lineBorder()

#Stage One - Pantry Room - Menu Text
#Presents options avaliable to user in the pantry room by printing them to the screen.
#Parameters: None
#Returns: None
def pantryRoomMenuText():
	print("It seems that you have four options:")
	print("1. Turn the dial to Blue.")
	print("2. Turn the dial to Red.")
	print("3. Turn the dial to Green.")
	print("4. Return to the entrance room.")
	lineBorder()

#Stage One - Pantry Room - Dial Selection
#Pantry Room Dial Selection reads a parameter meant to be the current state of the dial.
#It then prompts for user input and validates it via an input validation loop.
#If users input 1, 2 or 3, the dial variable will be set to the user's input.
#Else if the user inputs 4, the dial variable will not be adjusted.
#The function then returns the relevant room selection as well as the state of the dial.
#Parameters: dial is a numeric string meant to be the current state of the dial.
#Returns: roomSelection is a numeric string.
#Returns: dial is a numeric string corrisponding to the (un)adjusted state of the dial.
def pantryRoomDialSelection(dial):
	inputNeeded = True
	while inputNeeded == True:
		selection = input("Enter your choice here: ")
		if selection in ("1", "2", "3"):
			roomSelection = "2"
			dial = selection
			inputNeeded = False
		elif selection == "4":
			roomSelection = "0"
			inputNeeded = False
		else:
			lineBorder()
			print("You can't turn the dial like that.")
			print(selection, "is not an avaliable option.")
			print("Please stick to the avaliable options.")
			print("Available options are 1, 2, 3 and 4.")
			lineBorder()
	return roomSelection, dial

#Stage One - Kitchen Room
#The kitchen room reads the state of the lever, and then presents the situation to the user.
#It then presents the status of the lever to the user, and presents a menu of options.
#Finally, it prompts for user input, and then returns variables corrisponding to user input.
#Parameters: lever is a numeric string meant to corrispond to the lever state variable in stageOne.
#Returns: roomSelection is a numeric string.
#Returns: lever is a numeric string meant to corrispond to the adjusted state variable.
def kitchenRoom(lever):
	kitchenRoomIntroText()
	leverReporter(lever)
	kitchenRoomMenuText()
	roomSelection, lever = kitchenRoomLeverSelection(lever)
	return roomSelection, lever

#Stage One - Kitchen Room - Kitchen Room Intro Text
#Presents the situation to the user via a printing some text and framing it with two dashed line borders.
#Parameters: None
#Returns: None
def kitchenRoomIntroText():
	printClear()
	lineBorder()
	print("You seem to be in Mr. Fedral's kitchen.")
	print("A skull in Microsoft's colours is boilling in a blood-red pot.")
	print("You are quick to notice a gigantic lever in the middle of the room.")
	print("Most because there is a robot impaled upon it.")
	print("Why is there a lever? Well, you can probably push or pull it.")
	lineBorder()

#Stage One - Kitchen Room - Lever State Reporter
#Lever Reporter reads the current state of the lever and then prints the relevant state via a branching structure.
#Parameters: lever is a numeric string meant to corrispond to the lever state variable in stageOne.
#Returns: None
def leverReporter(lever):
	if lever == "0":
		print("This lever is currently not set to anything.")
		lineBorder()
	elif lever == "1":
		print("This lever is currently set to the Back position.")
		lineBorder()
	elif lever == "2":
		print("This lever is currently set to the Forward position.")
		lineBorder()
	else:
		print("This lever is currently set to IMPOSSIBLE. Bug detected.")
		lineBorder()

#Stage One - Kitchen Room - Menu Text
#Kitchen Room menu text prints a menu of options avable to the user in this room.
#Parameters: None
#Returns: None
def kitchenRoomMenuText():
	print("You have three options:")
	print("1. Pull the lever to the Back position.")
	print("2. Push the lever to the Forward position.")
	print("3. Don't touch the lever and return.")
	lineBorder()

#Stage One - Kitchen Room - Lever Selection
#Lever Selection reads the lever parameter and then either modifies or doesn't modify it according to user input.
#It does this through an input validation loop, followed by returning the relevant values.
#Parameters: lever is a numeric string meant to corrispond to the lever state variable in stage one.
#Returns: roomSelection is a numeric string meant to modify roomSelection in stage one.
#Returns: lever is a numeric string meant to modify lever in stage one.
def kitchenRoomLeverSelection(lever):
	inputNeeded = True
	while inputNeeded == True:
		selection = input("Enter your choice here: ")
		if selection in ("1", "2"):
			roomSelection = "3"
			lever = selection
			inputNeeded = False
		elif selection == "3":
			roomSelection = "0"
			inputNeeded = False
		else:
			lineBorder()
			print("The lever can't be twisted like that.")
			print(selection, "is not an avaliable option.")
			print("Please stick to the avaliable options next time.")
			print("Avaliable options are 1, 2 and 3.")
			lineBorder()
	return roomSelection, lever

#Transition Text
#Transition Text congratulates the user for completing stage one and transitions into stage two.
#It does this by printing text flanked by dashed line borders, then awaits user input to continue.
#Parameters: None
#Returns: None
def transitionText():
	printClear()
	lineBorder()
	print("As you turn the handle, you notice the door is no longer locked.")
	print("You open the door to go deeper inside the house.")
	print("Suddenly, from behind you, Mr. Tam's voice booms:")
	print("'SUBJECT ONE HAS CLEARED STAGE ONE. STAGE TWO INITIALIZING.'")
	print("You look behind you, but James Tam isn't there.")
	print("More disturbingly, the door which brought you here... diasppeared.")
	print("You seem to be in a new place now.")
	print("Good luck. I think you'll need it.")
	lineBorder()
	input("[Hit enter to continue.]")

#Stage Two
#Stage two is the second of two stages in the game. It has five state variables.
#The stage is run within a while loop which executes the relevant room functions according to user input.
#The stage ends when users manage to flip the ascendedToHeaven variable to True.
#Parameters: None
#Returns: None
def stageTwo():
	isPlantGrown = False
	ascendedToHeaven = False
	isStringTaken = False
	isStringPlaced = False
	roomSelection = "0"
	playerInventory = []
	while ascendedToHeaven == False:
		if roomSelection == "0":
			roomSelection, ascendedToHeaven, isStringTaken, playerInventory = livingRoom(isPlantGrown, isStringTaken, ascendedToHeaven,  playerInventory)
		elif roomSelection == "1":
			roomSelection, isStringPlaced, playerInventory = attic(playerInventory, isStringPlaced)
		elif roomSelection == "2":
			roomSelection, isPlantGrown, playerInventory = bedroom(isPlantGrown, isStringPlaced, playerInventory)
		else:
			print("BUG DETECTED.")
			roomSelection = "0"

#Stage Two - Living Room
#Living room is one of the room functions. It first presents the situation in the room to the user.
#Next, it displays a menu of possible options and prompts the user for if they want to take a ball of string.
#Finally, it prompts for user input on their choice of option and returns that decision.
#Parameters: isPlantGrown is a boolean variable corrisponding to the isPlantGrown state variable in the stage.
#Parameters: isStringTaken is a boolean variable corrisponding to the isStringTaken state variable in the stage.
#Parameters: ascendedToHeaven is a boolean variable corrisponding to the ascendedToHeaveb state variable in the stage.
#Parameters: playerInventory is a list containing strings corrisponding to the items the player has put in their inventory.
#Parameters: playerInventory corrisponds to the playerInventory variable in the stage.
#Returns: roomSelection is a numeric string corrisponding to user choice in room selection.
#Returns: ascendedToHeaven is a boolean variable corrisponding to the intended modifications to variable ascendedToHeaven in the stage.
#Returns: isStringTaken is a boolean variable corrisponding to the intended modifications to the variable isStringTaken in the stage.
#Returns: playerInventory is a list corrisponding to the intended change of list to the variable playerInventory in the stage.
def livingRoom(isPlantGrown, isStringTaken, ascendedToHeaven, playerInventory):
	livingRoomIntroText()
	livingRoomMenuText()
	isStringTaken, playerInventory = livingRoomBallOfString(isStringTaken, playerInventory)
	roomSelection, ascendedToHeaven = livingRoomChoiceSelection(isPlantGrown, ascendedToHeaven)
	return roomSelection, ascendedToHeaven, isStringTaken, playerInventory

#Stage Two - Living Room - Intro Text
#Living room into text introduces the user to the situation in the living room via printing some text and bordering it with a line of dashes.
#Parameters: None
#Returns: None
def livingRoomIntroText():
	printClear()
	lineBorder()
	print("The room you are in is a living room of some sort.")
	print("It is vastly different from the previous rooms you were in.")
	print("It is painted in discordiant shades of black, purple and green.")
	print("Plenty of computer mice are hanging lifelessly from the ceiling.")
	print("There are stairs going up leading to... somewhere.")
	print("There is a dark entranceway also leading to... somewhere.")
	print("There's also a suspicious looking plant in the corner there.")
	print("Well, looks like this is 'stage two'...")
	lineBorder()

#Stage Two - Living Room - Menu Text
#Living room menu text presents the user with their list of valid options via printing some text and bordering it with lines of dashes.
#Parameters: None
#Returns: None
def livingRoomMenuText():
	print("It looks like you have the following options:")
	lineBorder()
	print("1. Go up that rickety looking staircase.")
	print("2. Go through that dark entranceway...")
	print("3. Check out what that plant is all about.")
	lineBorder()

#Stage Two - Living Room - Ball of String Prompt
#Ball of String examines if the ball of string has been taken and the player's inventory.
#If the ball of string hasn't been taken, then it offers the option for the player to take the ball of string.
#If the ball of string is taken, then the player gets the ball of string in their inventory.
#The function then indicates the ball of string has been taken, preventing more string from getting taken.
#Parameters: isStringTaken is a boolean variable corrisponding to the isStringTaken state variable in the stage.
#Parameters: playerInventory is a list corrisponding to the playerInventory variable in the stage.
#Returns: isStringTaken is a boolean variable corrisponding to the intended modiciations to the isStringTaken state variable.
#Returns: playerInventory is a list corrisponding to the intended modifications to the playerInventory variable.
def livingRoomBallOfString(isStringTaken, playerInventory):
	if isStringTaken == False:
		print("WAIT! There also is ball of string here.")
		inputNeeded = True
		while inputNeeded == True:
			userInput = input("Take the ball of string? Y/N? ")
			if userInput == "Y":
				playerInventory.append("ballOfString")
				isStringTaken = True
				inputNeeded = False
				print("You have taken the string.")
				lineBorder()
			elif userInput == "N":
				print("The ball of string was not taken.")
				lineBorder()
				inputNeeded = False
			else:
				print("Oh dear, I can't understand that.")
				print("Try again.")
	return isStringTaken, playerInventory

#Stage Two - Living Room - Choice Selection.
#Living room choice selection reads the isPlantGrown and ascendedToHeaven parameters.
#It then prompts the user for input with an input validation loop.
#Depending on user input, it adjusts the roomSelection and ascendedToHeaven variables and returns them.
#Parameters: isPlantGrown is a boolean variable corrisponding to the isPlantGrown state variable in the stage.
#Parameters: ascendedToHeaven is a boolean variable corrisponding to the ascendedToHeaven state variable in the stage.
#Returns: roomSelection is a numeric string corrisponding to the intended changes to the roomSelection state variable in the stage.
#Returns: ascendedToHeaven is a boolean variable corrisponding to the intended changes to the ascendedToHeaven state variable in the stage.
def livingRoomChoiceSelection(isPlantGrown, ascendedToHeaven):
	inputNeeded = True
	while inputNeeded == True:
		userInput = input("Enter your choice here: ")
		lineBorder()
		if userInput == "1":
			roomSelection = "1"
			inputNeeded = False
		elif userInput == "2":
			roomSelection = "2"
			inputNeeded = False
		elif userInput == "3":
			roomSelection = "0"
			if isPlantGrown == True:
				ascendedToHeaven = True
				inputNeeded = False
			else:
				print("The plant looks dry.")
				print("You feel some sort of affinity to it.")
				print("Try doing other things for now.")
				lineBorder()
		else:
			print("Oh dear. What was that?")
			print(userInput, "is not an avaliable option.")
			print("Please stick to the avaliable options next time.")
			print("Avaliable options are 1, 2 and 3.")
			lineBorder()
	return roomSelection, ascendedToHeaven

#Stage Two - Attic
#Attic is the second of the three room functions. It reads the playerInventory and isStringPlaced parameters.
#It first introduces the situation to the user, then prompts the user if they want to place some cheese in their player inventory.
#Next, it displays a menu of possible options in this room, and then prompts the user for their choice.
#Parameters: playerInventory is a list corrisponding to the playerInventory variable in the stage.
#Parameters: isStringPlaced is a boolean variable corridponding to the isStringPlaced state variable in the stage.
#Returns: roomSelection is a numeric string which corrisponds to the intended modifications to the roomSelection variable in this stage.
#Returns: isStringPlaced is a boolean variable corrisponding to the intended modifications to the isStringPlaced state variable in this stage.
#Returns: playerInventory is a list corrisponding to the intended modifications to the platerInventory variable in this stage.
def attic(playerInventory, isStringPlaced):
	atticIntroText()
	playerInventory = atticCheesePickup(playerInventory)
	atticMenuText(playerInventory)
	roomSelection, isStringPlaced, playerInventory = atticChoiceSelection(playerInventory, isStringPlaced)
	return roomSelection, isStringPlaced, playerInventory


#Stage Two - Attic - Intro Text
#Presents the situation in the attic room to the user via printing some text and bordering it with lines of dashes.
#Parameters: None
#Returns: None
def atticIntroText():
	printClear()
	lineBorder()
	print("The floor is made of polished steel.")
	print("The walls are of polished dark oak.")
	print("The ceiling made of diamonds.")
	print("There's a gigantic stack of cheese in one corner.")
	print("There's also a star-shaped hole in the centre.")
	print("The hole seems to lead to a dark room downstairs...")
	print("A giant portrait of James Tam hangs in the centre.")
	print("This is the attic it seems. Strange.")
	print("This doesn't seem like Mr. Fedral's house anymore.")
	lineBorder()

#Stage Two - Attric - Cheese Pickup
#Cheese pickup is a function which prompts the user for if they want to pick up cheese in the inventory to add to their player inventory.
#It does this by reading the playerInventory parameter, and if the player answers yes, it appends "cheese" to it.
#Parameters: playerInventory is a list corrisponding to the player inventory variable in the stage.
#Returns: playerInventory is a list corrisponding to the intended changes to the player inventory variable in the stage.
def atticCheesePickup(playerInventory):
	inputNeeded = True
	while inputNeeded == True:
		userInput = input("Take some cheese? Y/N? ")
		if userInput == "Y":
			print("You have taken some cheese.")
			lineBorder()
			playerInventory.append("cheese")
			inputNeeded = False
		elif userInput == "N":
			print("You have decided to leave the cheese.")
			lineBorder()
			inputNeeded = False
		else:
			print("Oh dear, I cannot understand that.")
			print("Please respond Y or N.")
			lineBorder()
	return playerInventory

#Stage Two - Attic - Menu Text
#The menu text reads the playerInventory to print relevant menu information.
#Parameters: playerInventory is a list corrisponding to the playerInventory variable in the stage.
#Returns: None
def atticMenuText(playerInventory):
	print("It seems you have the following choices: ")
	print("1. Return back to the living room.")
	if "cheese" in playerInventory:
		print("2. Try to stuff the cheese into the hole.")
	if "ballOfString" in playerInventory:
		print("3. Try to drop the string into the hole.")

#Stage Two - Attic - Choice Selection
#Attic choice selection reads the playerInventory and isStringPlaced to determine relevant results for player input.
#It does this via an input validation loop with two nested if structures inside.
#Parameters: playerInventory is a list corrisponding to the playerInventory variable in this stage.
#Parameters: isStringPlaced is a boolean variable corrisponding to the isStringPlaced state variable in this stage.
#Returns: roomSelection is a numeric string corrisponding to the intended changes to the roomSelection variable in this stage.
#Returns: isStringPlaced is a boolean variable corrisponding to the intended changes to the isStringPlaced state variable in this stage.
#Returns: playerInventory is a list corrisponding to the intended modifications to the playerInventory variable in this stage.
def atticChoiceSelection(playerInventory, isStringPlaced):
	inputNeeded = True
	while inputNeeded == True:
		userInput = input("Enter your choice here: ")
		lineBorder()
		if userInput == "1":
			roomSelection = "0"
			inputNeeded = False
		elif userInput == "2":
			if "cheese" in playerInventory:
				print("The cheese doesn't fit!")
				lineBorder()
			else:
				print("You search in your bag for... something.")
				print("Was there something to pick up?")
				lineBorder()
		elif userInput == "3":
			if "ballOfString" in playerInventory:
				print("The string has been deployed down the deep dark hole.")
				print("You are still in the room.")
				lineBorder()
				playerInventory.remove("ballOfString")
				isStringPlaced = True
			else:
				print("You search in your bag for... something.")
				print("Was there something to pick up?")
		else:
			print("You search in your bag for... something.")
			print("You don't know why you did that.")
			print(userInput, "is apparently not an option.")
			print("Please stick to the avaliable options next time.")
			lineBorder()
	return roomSelection, isStringPlaced, playerInventory

#Stage Two - Bedroom
#The bedroom is the thrid room function. It reads the isPlantGrown, isStringPlaced and playerInventory parameters to determine appropriate situations.
#First, it presents the situation to the user, depending on isStringPlaced, before presenting a menu based off playerInventory and isStringPlaced.
#Finally, it prompts the user for their choice, depending on playerInventory, isStringPlaced and isPlantGrown, and then returns the relevaant parameters.
#Parameters: isPlantGrown is a boolean variable corrisponding to the isPlantGrown state variable in this stage.
#Parameters: isStringPlaced is a boolean variable corrisponding to the isStringPlaced state variable in this stage.
#Parameters: playerInventory is a list corrisponding to the playerInventory variable in this stage.
#Returns: roomSelection is a numeric string corrisponding to the intended changes to roomSelection variable in this stage.
#Returns: isPlantGrown is a boolean variable corrispdongint to the intended change to the isPlantGrown variable in this stage.
#Returns: playerInventory is a list corrisponding to the inteded changes to the playerInventory variable in this stage.
def bedroom(isPlantGrown, isStringPlaced, playerInventory):
	bedroomIntroText(isStringPlaced)
	bedroomMenuText(playerInventory, isStringPlaced)
	roomSelection, playerInventory, isPlantGrown = bedroomChoiceSelection(playerInventory, isStringPlaced, isPlantGrown)
	return roomSelection, isPlantGrown, playerInventory

#Stage Two - Bedroom - Intro Text
#Checks if isStringPlaced to determine what is relevant to print.
#Prints the relevant menu onto the screen via printing some text, a branching structure and flanking it with dashed lines.
#Parameters: isStringPlaced is a boolean variable which corrisponds to the isStringPlaced state variable in the stage.
#Returns: None
def bedroomIntroText(isStringPlaced):
	printClear()
	lineBorder()
	print("The room is painted in disconcerting mixtures of color.")
	print("Blood red, wax yellow and neon green...")
	print("Only the bone-coloured bed in the center informs you it is a bedroom.")
	print("An animatronic Tomcat briefly notices you.")
	print("Its occasional robomewing indicating to you it is active.")
	if isStringPlaced == True:
		print("The cat returns to its playing around.")
		print("There is an interesting string coming down from above.")
		print("It comes from a star shaped hole just outside the room.")
		print("In any case, it finds you and that hole in the wall boring.")
	else:
		print("The cat is intently watching a small mousehole in the wall.")
	if isStringPlaced == True:
		print("A mouse pops its head outside its mousehole.")
		print("It is staring at you.")
	print("This is quite the creepy place.")
	lineBorder()

#Stage Two - Bedroom - Menu Text
#Reads the relevant parameters to determine what should be printed to the screen.
#Then prints the relevant information to the screen.
#Parameters: playerInventory is a list corrisponding to the playerInventory variable in the stage.
#Parameters: isStringPlaced is a boolean variable corrisponding to the isStringPlsced state variable in the stage.
#Returns: None
def bedroomMenuText(playerInventory, isStringPlaced):
	print("You seem to have the following options:")
	if "ballOfString" in playerInventory:
		print("1. Try to play with the cat with your ball of string.")
	if "cheese" in playerInventory and isStringPlaced == True:
		print("2. Feed the mouse with cheese.")
	print("3. Go back to the living room.")
	lineBorder()

#Stage Two - Bedroom - Choice Selection
#Reads the playerInventory, isStringPlaced and isPlantGrown input parameters to determine avaliable choices.
#Then prompts the user for their choice with an input validation loop.
#The loop only ends if the user decides to leave the room.
#Parameters: playerInventory is a list which corrisponds to the playerInventory variable in the stage.
#Parameters: isStringPlaced is a boolean variable which corrisponds to the isStringPlaced state variable in the stage.
#Parameters: isPlantGrown is a boolean variable which corrisponds to the isPlantGrown state variable in the stage.
#Returns: roomSelection is a numeric string which corrisponds to the intended modifications to roomSelection in the stage.
#Returns: playerInventory is a list which corrisponds to the intended modifications to playerInventory in the stage.
#Returns: isPlantGrown is a boolean variable which corrisponds to the intended modifications to isPlantGrown in the stage.
def bedroomChoiceSelection(playerInventory, isStringPlaced, isPlantGrown):
	inputNeeded = True
	while inputNeeded == True:
		userInput = input("Enter your choice here: ")
		if userInput == "1":
			if "ballOfString" in playerInventory:
				print("The cat plays with you for a bit.")
				print("However, it eventually finds you boring.")
				print("It returns to staring at the mousehole soon after.")
				lineBorder()
			else:
				print("You search in your bag for... something.")
				print("Was there something you were supposed to pick up?")
				lineBorder()
		elif userInput == "2":
			if "cheese" in playerInventory:
				playerInventory.remove("cheese")
				isPlantGrown = True
				print("The mouse happily eats your cheese.")
				print("It proceeds to run off into the living room.")
				print("You hear a trickle of liquid hitting dirt.")
				lineBorder()
			else:
				print("You search in your bag for... something.")
				print("Was there something to pick up?")
				lineBorder()
		elif userInput == "3":
				roomSelection = "0"
				print("You decide to head back to the living room.")
				lineBorder()
				inputNeeded = False
		else:
			print("Oh dear, I can't understand that.")
			print(userInput, "is not valid input.")
			print("Try again.")
			lineBorder()
	return roomSelection, playerInventory, isPlantGrown

#Victory Text
#Informs the user that they have won the game via printing some text and bordering it with dashed lines.
#Then gets user input before ending the game, in order to allow the user time to finish reading.
#Parameters: None
#Returns: None
def victoryText():
	printClear()
	lineBorder()
	print("You see that the plant has grown enomously.")
	print("It is a gigantic vine stretching up to the sky.")
	print("Wait what? The sky?")
	print("Yes, the roof has crumbled where the vine goes.")
	print("A clear sky is what you see.")
	print("The vine continues to grow at extremely rapid pace.")
	print("Not willing to stay for much longer, you climb onto the vine.")
	print("You soar high into the sky, going faster and faster.")
	print("Soon, you are in space. Without a spacesuit.")
	print("Soon, you asphixiate and bruise up.")
	print("You squirm and grip a nearby piece of space junk.")
	print("The space junk is labelled 'Paradise'.")
	print("Just as you think you are dead, you wake up.")
	print("You see that you are lying on cotton candy clouds.")
	print("In front of you is the caramel gates.")
	print("From below you, a voice booms:")
	print("SUBJECT ONE HAS COMPLETED ITS TASK.")
	print("Congratulations, you have it to candy heaven - Paradise.")
	lineBorder()
	input("[Hit enter to end.]")
main()

