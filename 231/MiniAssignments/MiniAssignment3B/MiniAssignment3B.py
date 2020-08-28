#John Ming Ngo, V1.0.0, Last Change 2016-11-3
#UCalgary ID 30020834, Tutorial Number T11
#This program is a calculator which prompts the user for two numbers.
#It then does the user's requested operation upon the numbers.
#It then prints the result.
#Todo: None.

#This function computes the sum of two numbers.
#Parameters: numberOne and numberTwo can be intergers or floats.
#Returns the sum of the two parameters.
def addition(numberOne, numberTwo):
	sum = numberOne + numberTwo
	return sum

#This function computes the difference between the first and second numbers.
#Parameters: numberOne and numberTwo can be intergers or floats.
#Returns the difference between the first and second parameters.
def subtraction(numberOne, numberTwo):
	difference = numberOne - numberTwo
	return difference

#This function calculates the product of two numbers.
#Parameters: numberOne and numberTwo can be intergers or floats.
#Returns the product of the first and second parameters.
def multiplication(numberOne, numberTwo):
	product = numberOne * numberTwo
	return product

#Main function: It does the following:
#1. Prompts the user for two numerical inputs.
#2. Asks the user for the desired operation.
#3. Uses the relevant function to compute the operation.
#4. Prints the result of the operation for the user to see.
#Parameters: None
#Returns: None
def start():
	inputNeeded = True
	while inputNeeded == True:
		try:
			userNumberOne = float(input("Enter your first number."))
			userNumberTwo = float(input("Enter your second number."))
			inputNeeded = False
		except ValueError:
			print("Oh dear, I can't understand one of your inputs.")
			print("Please input  your numbers again.")
	print("What operation shall I perform on these numbers?")
	print("(a)ddition")
	print("(s)ubtraction")
	print("(m)ultiplication")
	inputNeeded = True
	while inputNeeded == True:
		operation = input("Please input your selection: ")
		if operation not in ("a", "s", "m"):
			print("Oh dear, I can't understand that. Try again.")
		else:
			inputNeeded = False
	print("Your two numbers are: ", userNumberOne, "and", userNumberTwo)
	if operation == "a":
		result = addition(userNumberOne, userNumberTwo)
		print("The result of adding your two numbers is: ", result)
	elif operation == "s":
		result = subtraction(userNumberOne, userNumberTwo)
		print("The result of subtracting your two numbers is: ", result)
	elif operation == "m":
		result = multiplication(userNumberOne, userNumberTwo)
		print("The result of multiplying your two numbers is: ", result)
	else:
		print("You got past the error checker. Error detected.")
start()
