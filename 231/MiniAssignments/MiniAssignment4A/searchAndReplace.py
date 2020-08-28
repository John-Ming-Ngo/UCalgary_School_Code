#Modifications to this program by John Ming Ngo
#UCalgary ID 30020834, Tutorial Number T11
#Program version 1.0.0, last change 14/11/2016

import random
SIZE = 4
MIN = 0
MAX = 5
SEARCH_VALUE = 0
REPLACEMENT_VALUE = "!"

# Author:  James Tam
# This function was used in its entirety with the permisssion of 
# the author
# '''
# @ randomize()
# @ arguments: none
# @ return value: a fully initialized 2D list. 
# @ Each element will be randomly set to a value between 0 - 5.
# '''
def randomize():
    grid = []
    r = 0
    c = 0
    while (r < SIZE):
        grid.append([])
        c = 0
        while (c < SIZE):
            temp = random.randrange(MIN,MAX)   
            grid[r].append(temp)
            c = c + 1
        r = r + 1
    return(grid)  

# Author:  James Tam
# This function was used in its entirety with the permisssion of 
# the author
# '''
# @ inbounds()
# @ arguments: initilized 2D list, row, column coordinates
# @ return value: Boolean
# @ Returns a Boolean depending upon whether the location is
# @ in the bounds of the list
# '''
def inBounds(grid,row,column):
    bounds = True
    # JT: backslash is used to split one long statement into
    # multiple lines
    if ((row < 0) or    \
        (row >= SIZE)or \
        (column < 0) or \
        (column >= SIZE)):
        bounds = False
    return(bounds)


# Student must write this code
# Scans the entire list, counts the number of elements that 
# contain zero as a list element. The count is returned to the 
# caller.
# @ countFails()
def countFails(grid):
    failCount = 0
    for row in grid:
        for column in row:
            if column == 0:
                failCount += 1
    return(failCount)

# Student must write this code
# Scans the entire list, any zeros are changed to an exclaimation # mark.
# @ modify()
def modify(grid):
    for row in grid:
        columnNumber = 0
        for column in row:
            if column == 0:
                row[columnNumber] = "!"
            columnNumber += 1
# Author:  James Tam
# This function was used in its entirety with the permisssion of 
# the author
# '''
# @ display()
# @ arguments: a 2D list (precondition: list created and properly 
# @ initialized).
# @ return value: none
# @ Displays the elements of the 2D list, each row is displayed 
# @ all on its own line.
# '''
def display(grid):
    r = 0
    c = 0
    while (r < SIZE):
        c = 0
        while (c < SIZE):
            print("%s " %grid[r][c], end="")
            c = c + 1
        print()
        r = r + 1

# Student must write this code
# Given a row, column value that is in the bounds of the list
# the function will set that list element to a question mark 
# '?'. This function can (and probably should) make use of the
# the pre-created inBounds() function.
# @ modifyElement()
def modifyElement(grid,row,column):
    if inBounds(grid,row,column):
        grid[row][column] = "?"
    else:
        print("Your row and column not in bounds! Did nothing!")

# Author:  James Tam
# This function was used in its entirety with the permisssion of 
# the author
def start():
    numFails = -1
    row = -1
    column = -1
    grid = randomize()
    print("Original list")
    display(grid)
    print()

    numFails = countFails(grid)
    print("Before modifications: # of failing grades %d" %numFails) 
    print("\nModified list")
    modify(grid)
    display(grid)

    print("\nSetting an element to '?'")
    row = int(input("Row value: "))   
    column = int(input("Column value: "))

    # Students must write code to modify list
    modifyElement(grid,row,column)
    display(grid)
    
start()

    
