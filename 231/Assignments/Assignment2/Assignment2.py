#John Ming Ngo, V.1.0.5, Last Change 2016-10-15.
#UCalgary ID 30020834, Tutorial Number T11

#This is a text-based adventure game involving a locked door, levers and dials.
#Players are to experiment with adjusting lever and dial settings via input.
#When players set both to the correct setting (Red and Back position, respectively)
#And the players open the door, they win and the program finishes.

#Problems: None
#Todo: Refine the program and make it prettier/clean up code where you can.
#Remake sections of the program to furfil requirements better.
#Copyright 2016 John Ming Ngo and University of Calgary.

#Initialization module:

#Introduces players to the game and initializes most of the variables needed.
innerDoorLocked = True
#The following print statement clears the player's terminal, setting it up for the game.
#Future print statement like this do the same thing, to make the game appear cleaner.
print("\033c")
print("---------------------------------------------------------------------------")
name = input("What is your name? ")
print("---------------------------------------------------------------------------")
print("You have broken into  Mr. Fedral's House.")
print("He seems to have safeguarded his house against intruders.")
print("Only problem is that he seems to have done it backwards.")
print("You can tell because the door back out has disappeared.")
print("It seems you have no choice but to go deeper into his house.")
input("(Hit Enter to continue.)")
print("\033c")
print("---------------------------------------------------------------------------")
roomSelection = "0"
dial = "0"
lever = "0"

#Main loop:

#Runs most of the relevant code which players will interact with.
#It will repeat until players set the innerDoorLocked variable to false.
#This is done by successfully openning the door.
while innerDoorLocked == True:

    #Entrance Room:
    if roomSelection == "0":
        print("You are in the entrance room of his house.")
        print("It's pretty bland. In fact, paint is slowly peeling.")
        print("There is a door in front of you.")
        print("There are also two entryways - one to your left and one to your right.")
        print("---------------------------------------------------------------------------")
        #Displays a list of possible actions for the player in this room.
        print("Choose which way you want to go:")
        print("---------------------------------------------------------------------------")
        print("1. Try to open the door.")
        print("2. Go through the left entryway.")
        print("3. Go through the right entryway.")
        print("---------------------------------------------------------------------------")
        #Prompts user for their choice of action in this room.
        roomSelection = input("Enter your choice here: ")
        print("\033c")

    #Failure to open the locked door:
    #This occurs if the dial isn't set to red or the lever isn't set to back.
    elif roomSelection == "1" and (dial !="2" or lever !="1"):
        print("---------------------------------------------------------------------------")
        print("The door seems to be locked.")
        print("Wires run from this door to the two entryways.")
        print("Try exploring elsewhere.")
        roomSelection = "0"
        input("(Hit enter to continue)")
        print("\033c")
        print("---------------------------------------------------------------------------")

    #Success in opening the locked door:
    #This occurs when the dial is set to red and the lever to back.
    #This will exit the main loop.
    elif roomSelection == "1" and dial == "2" and lever == "1":
        innerDoorLocked = False
        print("\033c")
        
    #Pantry Room:
    elif roomSelection == "2":
        print("---------------------------------------------------------------------------")
        print("You seem to be in Mr. Fedral's pantry room.")
        print("There are bags of chips strewn all over the floor.")
        print("You notice a stange dial near his bags of chips.")
        print("The dial seems to have three settings. Blue, red and green.")
        print("---------------------------------------------------------------------------")
        #This set of if statements examines the current status of the dial and tells the player.
        if dial == "0":
            print("There is currently no setting on the dial.")
            print("---------------------------------------------------------------------------")
        elif dial == "1":
            print("The dial is currently set to BLUE.")
            print("---------------------------------------------------------------------------")
        elif dial == "2":
            print("The dial is currently set to RED.")
            print("---------------------------------------------------------------------------")
        elif dial == "3":
            print("The dial is currently set to GREEN.")
            print("---------------------------------------------------------------------------")
        else:
            print("The dial is set to IMPOSSIBLE. Bug detected.")
            print("---------------------------------------------------------------------------")
        #Displays a list of possible actions for the user in this room.
        print("It seems you have four options:")
        print("1. Turn the dial to blue.")
        print("2. Turn the dial to red.")
        print("3. Turn the dial to green.")
        print("4. Return to the entrance room.")
        print("---------------------------------------------------------------------------")
        #Prompts user for choice in changing the dial.
        dialSelection = input("Enter your choice here: ")
        #Processes user input - if the user wishes to leave the room, change the dial, or has entered bad input.
        if dialSelection == "4":
            print("You have chosen not to touch the dial.")
            roomSelection = "0"
            input("(Hit enter to continue.)")
            print("\033c")
            print("---------------------------------------------------------------------------")
        elif dialSelection == "1" or dialSelection == "2" or dialSelection == "3":
            dial = dialSelection
            print("\033c")
        else:
            print("Error,", dialSelection, "is not a invalid selection.")
            print("Valid selections are 1, 2, 3 and 4.")
            input("(Hit enter to continue.)")
            print("\033c")
            
    #Kitchen room:
    elif roomSelection == "3":
        print("---------------------------------------------------------------------------")
        print("You seem to be in Mr. Fedral's kitchen.")
        print("A skull in Microsoft's colours is boiling in a nearby pot.")
        print("You are quick to notice a gigantic lever in the middle of the room.")
        print("Mostly because there is a robot impaled on it.")
        print("Why is there a lever? Well, you can probably push or pull it.")
        print("---------------------------------------------------------------------------")
        #This set of if statements examines the current state of the lever and tells the user.
        if lever == "0":
            print("The lever is currently not set to anything.")
            print("---------------------------------------------------------------------------")
        elif lever == "1":
            print("The lever is currently set to the BACK position.")
            print("---------------------------------------------------------------------------")
        elif lever == "2":
            print("The lever is currently set to the FORWARD position.")
            print("---------------------------------------------------------------------------")
        else:
            print("The lever is currently set to IMPOSSIBLE. Bug detected.")
            print("---------------------------------------------------------------------------")
        #Displays a list of possible actions in this room.
        print("You have 3 options:")
        print("1. Pull the lever to the back position.")
        print("2. Push the lever to the forward position.")
        print("3. Don't touch the lever and return")
        #Prompts user for choice in changing the lever.
        leverSelection = input("Enter your choice here: ")
        #Processes user input - if user wishes to leave, change the lever, or has implemented bad input.
        if leverSelection == "3":
            print("You have chosen not to touch the lever.")
            roomSelection = "0"
            input("(Hit enter to continue.)")
            print("\033c")
            print("---------------------------------------------------------------------------")
        elif leverSelection == "1" or leverSelection == "2":
            lever = leverSelection
            print("\033c")
        else:
            print("Error,", leverSelection,"is an invalid selection.")
            print("Valid selections are 1, 2 and 3.")
            input("(Hit enter to continue.)")
            print("\033c")

    #Failure condition for inputting invalid room selection in the main room selection menu.
    #Processes case for the main entrance where the user has entered bad interger input.
    else:
        print("---------------------------------------------------------------------------")
        print("You have walked through the walls and back into the entrance room.")
        print("Please stick to the avaliable options (1, 2 and 3) next time.")
        input("(Hit enter to continue.)")
        print("\033c")
        print("---------------------------------------------------------------------------")
        roomSelection = "0"

#Victory message:

#Occurs when user has exited the main loop.
#The game is complete upon reaching this section.
print("---------------------------------------------------------------------------")
print("As you turn the handle, you notice the door is no longer locked.")
print("You open the door to go deeper into the house.")
print("Suddenly, from behind you, Mr. Tam's voice booms:")
print("Subject one has cleared stage one. Stage two initializing.")
print("You look behind you, but James Tam isn't there.")
print("Regardless, congratulations", name)
print("You have won the game!")
print("---------------------------------------------------------------------------")
    
    