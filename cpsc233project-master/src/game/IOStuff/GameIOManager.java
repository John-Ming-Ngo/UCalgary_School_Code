package game.IOStuff;

import game.*;
import java.util.ArrayList;
import java.io.*;

/**
 * This class holds attributes and methods common to classes which handle IO
 * features which interact with the game's state/attributes. It's not
 * particularly useful on its own.
 * 
 * @author John Ming Ngo (Team 13)
 * @version 1.0.0
 */
public abstract class GameIOManager extends IOManager {
	/**
	 * Instantiating variables to hold the relevant states or objects in the
	 * game.
	 */
	protected Player player = new Player();

	/**
	 * Constructor method for if the relevant information has not yet been
	 * gathered.
	 */
	public GameIOManager() {
		super("GameIOManager.txt");
		player = new Player();
	}

	/**
	 * Constructor method for if the player object is already known.
	 * 
	 * @param playerInstance
	 *            A player object meant to be the current instance of the player
	 *            in the game.
	 */
	public GameIOManager(Player playerInstance) {
		super("GameIOManager.txt");
		player = new Player(playerInstance);
	}

	/**
	 * Constructor method for if player object is already known and the intended
	 * fileName data is available.
	 * 
	 * @param playerInstance
	 *            A player object meant to be the current instance of the player
	 *            in the game.
	 * @param fileName
	 *            A String corresponding to the name of the file to save to.
	 */
	public GameIOManager(Player playerInstance, String fileName) {
		super(fileName);
		player = new Player(playerInstance);
	}

	/**
	 * Constructor method for if the intended fileName data is available.
	 * 
	 * @param fileName
	 *            A String corresponding to the name of the file to save to.
	 */
	public GameIOManager(String fileName) {
		super(fileName);
		player = new Player();
	}

	/**
	 * Returns a copy of the player object in this recorder.
	 * 
	 * @return player A copy of the player object in the recorder.
	 */
	public Player getPlayer() {
		return (new Player(player));
	}

	/**
	 * This method, given a file name, loads and returns the data in the file in
	 * the form of an ArrayList<String>.
	 * 
	 * @param fileName
	 *            A String meant to correspond with the intended name of the
	 *            file to be loaded.
	 * @return data from fileName
	 */
	public ArrayList<String> load(String fileName) throws IOException {
		return super.load(fileName);
	}

	/**
	 * This method, given an ArrayList of user data and a file name, saves the
	 * information into the given file name.
	 * 
	 * @param userData
	 *            An ArrayList<String> which corresponds to the data the user
	 *            wishes to save into a file.
	 * @param fileName
	 *            A String meant to correspond with the intended name of the
	 *            file to be loaded.
	 */
	public void save(ArrayList<String> userData, String fileName) throws IOException {
		super.save(userData, fileName);
	}

	/**
	 * Sets the player object in this record keeper.
	 * 
	 * @param aPlayer
	 *            An object of type Player.
	 */
	public void setPlayer(Player aPlayer) {
		player = new Player(aPlayer);
	}
}