#Modifications to this program by John Ming Ngo
#UCalgary ID 30020834, Tutorial Number T11
#Program version 1.0.0, last change 17/11/2016


# Author:  James Tam
# Version: November 16, 2016
#
# The start() function was written entirely by the above author.
# The original code for the button_clicked() function was also 
# written by this author. The code in both functions was used with
# the permission of this person.
from tkinter import *

aWindow = Frame()
aButton = Button(aWindow)
cookieCounter = 0

# Since the parameter list is pre-defined passing aButton into the function
# is problematic (created as a global).
# Original version: nothing happens when the button is pressed.
def button_clicked() :
    global aButton
    global cookieCounter
    print("BOOM! YOU HAVE CLICKED ME! YOU HAVE TRIGGERED ME! YOU!!!!!", cookieCounter)
    cookieCounter += 1
    aButton["text"] = "BOOM! Ok you can stop now.", cookieCounter

def start ():
    global aWindow
    global aButton

    aWindow.pack()
    aButton["text"] = "Press me"
    aButton["command"] = button_clicked
    aButton.grid(row=0, column=0)
    aWindow.mainloop()

start()