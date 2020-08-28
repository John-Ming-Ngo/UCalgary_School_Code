ABOUT:
	Welcome! This is an investment simulator, featuring stocks,
	precious metals and bitcoin! Select your name, select the amount
	of money you start will, invest and try to beat the market!
	Can you milk $$$ from the market, or will the market
	eat you whole?
	
HIGHLIGHTS:
	The stock data is in fact pulled straight off the internet each
	and every time you play the game. We can pull information from
	about the 1950s right up to today, if you so desire. Try it!
	
	Also, the random events are highly moddable, if you so desire.
	See modding instructions below.

COMPILE AND RUN INSTRUCTIONS: 
	FOR WINDOWS USERS:
		To compile the program, double click compile.bat.
		To run the program, double click run.bat.

	FOR MAC/LINUX USERS:
		To compile the program, ./compile.sh at the cli.
		To run the program, ./run.sh at the cli.

        note: after unzipping the file it the scripts may need to be 
               made executable. Do this by:
            chmod +x compile.sh
            chmod +x run.sh

	MANUAL:
		compile:
		javac -cp .:game/IOStuff/audio/JLayer.jar game/MarketSim
		
		run:
		java -cp .:game/IOStuff/audio/JLayer.jar game/MarketSim

		note: if you are on a windows system, replace the ':' with a ';'
		
HOW TO PLAY:
	If this is your first time:
		Firsly, hit the new game button and type/select your options.
		You the player are in charge of setting up the parameters
		of your simulation. From what time do you want to play? How
		much starting money? Etc.
		
		Once you have decided on your staring parameters, hit play.
		You are now seeing the overview of your account and the list
		of investments you are considering. There should be nothing
		there at the current moment.
		
		Start by adding an investment to the list of investments you
		are considering by hitting "Add Investment". Once added,
		you can decide to buy or sell investments by hitting their
		respective buttons, selecting the investments from a drop
		down list, and then hitting buy/sell. The goal of the game
		is to do better than the money you originally had.
		
		Once your set amount of turns is up, the game will compare
		the original amount of money you had brought to the investment
		table and your total net worth once the game ends, determine
		the percentage change for the good or bad, and save it to
		a file called scores.txt. This information can also be viewed
		in the High Scores menu. Have fun!
		
	If you are returning:
		Hit Load Game, find the save file that has your player name
		on it, and hit load game. Once in, continue as normal.
		
	OTHER MISCELLANIOUS DETAILS:
	
		Every time you hit Advance Turn. Once the game is over, your
		score will be saved to a file called Scores.txt. You may also
		view your scores in the High Scores menu on the game's main
		startup screen. Random events are triggered randomly if you
		turn them on, and may be modded by opening up events.evt in
		resources with a text editor and specifying your own events.

PURGING OLD HIGH SCORE AND SAVE FILES:
	Over time, old save files and high scores can pile up and clutter
	the screen. In order to purge these old files, simply go into their
	relevant folders and delete the file. For high scores, go into
	resources and either delete HighScores.txt entirely, or delete
	the relevant lines you don't want. For saves, either delete the 
	save folder entirely, or go into the save folder and delete the
	relevant save file.
		
EVENT MODDING INSTRUCTIONS:

	Go to the resources folder and open up events.txt in a text editor
	much like the current one you're using to read this file. Each new
	line will add a new random event to the game. The following is the 
	format of information you are to add to a new line:
	
	Title: | Description: | Effect Rarity: | Effect Type: | Amount Change:
	
	After title, enter the name of the custom event you wish to enter.
	
	After description, enter the fluff info of the custom event you wish
	to have appear. Purely fluff; doesn't do anything to the event.
	
	After or in place of Effect Rarity, enter a number corrisponding to 
	common the event should be. Higher number is more common. Actually,
	this number is currently unused; so type in any number for now.
	
	After effect type, type in one of the following four possible event
	types:
		1. Money #
		2. Money %
		3. Stock #
		4. Stock %
	This is the meat and functionality of your event, the ones which have
	been implemented in the gameand each type of event operates differently.
	1. Money type directly alter a player's current net worth.
	2. Stock type alters a random stock owned by the player.
	3. % indicates that the amount change is a percentage change.
	4. # indicates that the change amount is an absolute change.
	
	After Amount Change, input a number, positive or negative, for the intended
	amount change your event will cause. Congratz, you have just modded in
	a new custom event!

BUGS:
	1. Using our own built in quit button only closes the gui, but
	doesn't close simulationController. The result is that the looping
	background music keeps playing until the terminal is shut down.
	2. If HighScores.txt is deleted, one can't access the high scores
	menu at all. Fixed the moment a game ends and a new high score file
	is made.
	
External Libraries Used:
	1. JLayer library for playing mp3 audio files.
