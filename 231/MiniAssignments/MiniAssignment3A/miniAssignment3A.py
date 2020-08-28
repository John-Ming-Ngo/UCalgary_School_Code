#John Ming Ngo, V1.0.0, Last Change 2016-10-27
#UCalgary ID 30020834, Tutorial Number T11
#This program modifies a user-inputted password.
#It adds a random number from 1-100 to the beginning.
import random
randomNumber = random.randrange(1,101)
def completeCode(secureNumber):
    secureNumber = str(secureNumber)
    userInput = input("Enter your desired password character component here.")
    newPassword = secureNumber + userInput
    print("Your new password is: ", newPassword)
completeCode(randomNumber)
