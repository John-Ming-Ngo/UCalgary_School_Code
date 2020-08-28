#Modifications to this program by John Ming Ngo
#UCalgary ID 30020834, Tutorial Number T11
#Program version 1.0.0, last change 17/11/2016


# Author:  James Tam
# Version: November 15, 2016
#

# The code in the getBounds(), getFillColor() and start()
# were written in their entirety by the above author and used 
# with permission.

# The starting code in the drawShape() function was also written
# by the above author and used with permission. Modifications
# were/should be made by the student in order to fulfill the 
# assignment requirements.

from tkinter import *
def drawShape(aDrawingCanvas,lhs_x1,lhs_y1,size,aColor):   
   # Splitting a long statement: function call among multiple
   # lines using the line continuation character '\'
  
   aDrawingCanvas.create_rectangle(lhs_x1,\
                                   lhs_y1,\
                                   lhs_x1 + size,\
                                   lhs_y1 + size,\
                                   fill=aColor)
def getBounds():
    print("Getting the starting bounds, top left corner and")
    print("size of the rectangle")
    lhs_x1 = int(input("Enter x coordinate of top LHS: "))
    lhs_y1 = int(input("Enter y coordinate of top LHS: "))
    size = int(input("Enter the size of the rectangle: "))
    return(lhs_x1,lhs_y1,size)

def getFillColor():
    print("Selecting the rectangle color (red,blue,black,grey,green,brown,yellow")
    aColor = input("Enter the fill color: ")
    return(aColor)

def start():
    # Create a window with certain visual characteristics
    window = Tk()
    window.title("A4 Part 2")   # Label the title bar
    aDrawingCanvas = Canvas(window,width=320,height=240,bg ="white")
    lhs_x1,lhs_y1,size = getBounds()
    aColor = getFillColor()
    drawShape(aDrawingCanvas,lhs_x1,lhs_y1,size,aColor)

    # Draw window and start the gui
    aDrawingCanvas.pack()
    window.mainloop()

start()


