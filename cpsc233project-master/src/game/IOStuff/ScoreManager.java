package game.IOStuff;

import game.*;
import java.util.ArrayList;
import java.io.*;

/**
 * This class allows one to save and/or load high score information. Simply make
 * sure to have passed in the appropriate player object into this manager
 * beforehand.
 *
 * Dependencies: GameIOManager class.
 * 
 * @author John Ming Ngo (Team 13)
 * @version 1.0.0
 */
public class ScoreManager extends GameIOManager {

	private static final int TO_PERCENTAGE_MULTIPLIER = 100;
	private static final String FILENAME = "resources/HighScores.txt";

	private ArrayList<String> scoreData = new ArrayList<String>();

	/**
	 * Constructors
	 */

	/**
	 * Default constructor
	 * 
	 */
	public ScoreManager() {
		super(new Player(), FILENAME);
		scoreData = new ArrayList<String>();
	}

	/**
	 * Constructor for if some user-defined score data file a already exists in
	 * some fashion.
	 * 
	 * @param someScoreData
	 *            A user defined ArrayList<String> which contains the user's
	 *            desired score file data.
	 */
	public ScoreManager(ArrayList<String> someScoreData) {
		super(new Player(), FILENAME);
		setScoreData(someScoreData);
	}

	/**
	 * Constructor for if the user defined player object is already available.
	 * Expected to be the most used constructor since the user's player object
	 * is necessary to get score data relevant to one's interests.
	 */
	public ScoreManager(Player aPlayer) {
		super(aPlayer, FILENAME);
		scoreData = new ArrayList<String>();
	}

	/**
	 * Constructor for if the player object is already available, as well as
	 * user defined score data too.
	 * 
	 * @param aPlayer
	 *            An object of type player corresponding to the current player
	 *            object in the game.
	 * @param someScoreData
	 *            An ArrayList<String> corresponding to the scoreData.
	 */
	public ScoreManager(Player aPlayer, ArrayList<String> someScoreData) {
		super(aPlayer, FILENAME);
		setScoreData(someScoreData);
	}

	/**
	 * This method gets information from this class' player object, then
	 * calculates and formats the score into a presentable format. Finally, it
	 * adds the score to the scoreData attribute.
	 * 
	 */
	private void formatUserScore() {
		String userName = player.getUserName();
		Double startingMoney = player.getInitialMoney();
		Double userNetWorth = player.getNetWorth();
		Double scoreCalculation = (userNetWorth - startingMoney) / (startingMoney) * TO_PERCENTAGE_MULTIPLIER;
		String scoreInfo = String.format("%-10s %-10f%%", userName, scoreCalculation);
		scoreData.add(scoreInfo);
	}

	/**
	 * This method loads up the score data and returns it, in the form of an
	 * ArrayList<String>. Dependencies: This class' load() method.
	 * 
	 */
	public ArrayList<String> getScoreData() throws IOException {
		load();
		ArrayList<String> scoreDataCopy = new ArrayList<String>();
		for (String entry : scoreData) {
			scoreDataCopy.add(entry);
		}
		return scoreData;
	}

	/**
	 * This method calls the superclass load method to load the information in
	 * the file up. All it does is load the info to the scoreData attribute; it
	 * doesn't do anything else!
	 * 
	 */
	public void load() throws IOException {
		scoreData = super.load(getFileName());
	}

	/**
	 * This method saves the name of the player as well as the percentage
	 * increase or decrease in their net worth compared to their starting money
	 * - this being their score.
	 *
	 * Warning: This method USES THE CURRENT PLAYER OBJECT IN THIS CLASS! What
	 * this means is that you should ensure the player object is up to date
	 * before invoking this method.
	 * 
	 */
	public void save() throws IOException {
		ensureDirectoryExistance("resources");
		File scoreFile = new File(FILENAME);
		if (scoreFile.exists()) {
			scoreData = super.load(getFileName());
		}
		formatUserScore();
		super.save(scoreData, getFileName());
	}

	/**
	 * This method sets the score data. It is the setter.
	 * 
	 */
	public void setScoreData(ArrayList<String> someScoreData) {
		ArrayList<String> someScoreDataCopy = new ArrayList<String>();
		for (String entry : someScoreData) {
			someScoreDataCopy.add(entry);
		}
		scoreData = someScoreDataCopy;
	}
}