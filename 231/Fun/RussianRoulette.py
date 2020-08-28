def russianRoulette():
    import random
    print("Welcome to Russian Roulette! First to die is the looser.")
    chambers = int(input("Enter the number of chambers in the gun here. "))
    print("Hit enter when the first person is here.")
    input()
    gameOver = False
    dead = random.randrange(chambers)
    shot = 0
    while gameOver != True:
        if shot == dead:
                print("Bang! You're dead!")
                print("Game over.")
                input()
                gameOver = True
        else:
                print("You live. Next person please.")
                input()
        shot = shot + 1
russianRoulette()
