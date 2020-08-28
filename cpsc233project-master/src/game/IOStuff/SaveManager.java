package game.IOStuff;

import game.*;
import game.investments.*;
import java.util.ArrayList;
import java.io.*;

/**
 * This class manages the saving and loading of the game's state.
 * 
 * @author John Ming Ngo
 * @version 2.10.0
 */
public class SaveManager extends GameIOManager {

	private String startDate = "";
	private int numOfTurns = 0;
	private int turn = 0;
	private int intervalLength = 0;
	private ArrayList<String> userData = null;
	private String stockIndex;
	private String stockNameList;
	private MarketSim simulation = null;

	/**
	 * Default constructor, if nothing is assigned.
	 * 
	 */
	public SaveManager() {
		super();
		setFileName(".txt");
		startDate = "";
		numOfTurns = 0;
		turn = 0;
		intervalLength = 0;
		userData = new ArrayList<String>();
	}

	/**
	 * Constructor for if player and game state data has been gathered.
	 * Generally will be the most useful constructor.
	 * 
	 * @param aPlayer
	 *            An object of type Player meant to reflect the current player
	 *            object in the game.
	 * @param simulation
	 *            the simulation to save
	
	 */
	public SaveManager(Player aPlayer, MarketSim simulation) {
		super(aPlayer);
		startDate = simulation.getStartDate();
		numOfTurns = simulation.getNumberOfTurns();
		turn = simulation.getTurn();
		intervalLength = simulation.getIntervalLength();
		stockIndex = simulation.getStockIndex();
		stockNameList = simulation.getStockNameList();
		updateUserData();
	}

	/**
	 * This method reads the file and loads its information into the class's
	 * attributes. This method is why this class needs to be an object. It is
	 * not effective to read the file every single time one wants to extract the
	 * smallest bit of data.
	 * 
	 * @param playerName
	 *            String of the player name meant to reflect the current player
	 *            in the game.
	 * @param simulation
	 *            the simulation to save
	 */
	public void loadState(String playerName, MarketSim simulation) throws IOException, NumberFormatException {
		this.simulation = simulation;
		setFileName("saves" + File.separator + playerName + ".txt");
		try {
			userData = super.load(getFileName());
			setStates();
			setInvestments();
		} catch (NumberFormatException nfe) {
			throw new NumberFormatException("Error Reading from " + getFileName() + ". The file may be corrupted!");
		} catch (IOException ioe) {
			throw new IOException("Error Reading from " + getFileName());
		}
	}

	/**
	 * Updates the user data to reflect the current player object, then saves
	 * the information into a text file of the name of the player + .txt.
	 * 
	 */
	public void save() throws IOException {
		updateUserData();
		super.save(userData, getFileName());
	}

	/**
	 * Takes the loaded user data and extracts the relevant player investment
	 * information from it, creating an ArrayList<Investment> to set the
	 * player's investment list to. Generally meant to be called after
	 * setStates() is called. Like setStates(), meant to be utilized within this
	 * class only for the loadState() method.
	 * 
	 * @throws IOException
	 * @throws NumberFormatException
	 */
	private void setInvestments() throws NumberFormatException, IOException {

		ArrayList<Investment> userInvestments;
		userInvestments = new ArrayList<Investment>();
		for (String userInformation : userData) {
			String[] data = userInformation.split(":");
			switch (data[0].trim()) {
			case "STOCK":
				userInvestments.add(new Stock(data[1].trim(), startDate, intervalLength, numOfTurns, turn,
						Integer.parseInt(data[2].trim())));
				break;
			case "METAL":
				userInvestments.add(new PreciousMetal(PreciousMetal.Metal.valueOf(data[1].trim()), startDate,
						intervalLength, numOfTurns, turn, Integer.parseInt(data[2].trim())));
				break;
			case "BITCOIN":
				userInvestments.add(
						new BitCoin(startDate, intervalLength, numOfTurns, turn, Integer.parseInt(data[2].trim())));
				break;
			default:
				break;
			}
		}

		player.setInvestmentList(userInvestments);
	}

	/**
	 * Takes the loaded user data and extracts the relevant information about
	 * the game and player's states from it. Meant to be used within this class
	 * for the loadState().
	 * 
	 */
	private void setStates() {
		for (String userInformation : userData) {
			String[] data = userInformation.split(":");
			String dataType = data[0]; //How the save file is formatted, the type of information is in the stuff before :.
			switch (dataType) {
			case "Username":
				player.setUserName(extractedInfo(userInformation));
				break;
			case "Phrase":
				player.setWittyPhrase(extractedInfo(userInformation));
				break;
			case "Initial Money":
				player.setInitialMoney(Double.parseDouble(extractedInfo(userInformation)));
				break;
			case "Current Money":
				player.setCurrentMoney(Double.parseDouble(extractedInfo(userInformation)));
				break;
			case "Start Date":
				simulation.setDate(extractedInfo(userInformation));
				startDate = extractedInfo(userInformation);
				break;
			case "Current Turn":
				simulation.setCurrentTurn(Integer.parseInt(extractedInfo(userInformation)));
				turn = (Integer.parseInt(extractedInfo(userInformation)));
				break;
			case "Turns to Play":
				simulation.setNumberOfTurns(Integer.parseInt(extractedInfo(userInformation)));
				numOfTurns = (Integer.parseInt(extractedInfo(userInformation)));
				break;
			case "Stock Name List":
				simulation.setStockNameList(extractedInfo(userInformation));
				break;
			case "Stock Index":
				simulation.setIndex(extractedInfo(userInformation));
				break;
			case "Interval Length":
				simulation.setIntervalLength(Integer.parseInt(extractedInfo(userInformation)));
				intervalLength = (Integer.parseInt(extractedInfo(userInformation)));
				break;
			default:
				break;
			}
		}
	}

	/**
	 * Sets the file name and formats the data into a presentable updated
	 * format. Basically refreshes the data. For use in this class only.
	 * 
	 */
	private void updateUserData() {
		ensureDirectoryExistance("saves");
		setFileName("saves" + File.separator + player.getUserName() + ".txt");
		userData = new ArrayList<String>();
		userData.add("Username: " + player.getUserName());
		userData.add("Phrase: " + player.getWittyPhrase());
		userData.add(String.format("Initial Money: %.2f", player.getInitialMoney()));
		userData.add(String.format("Current Money: %.2f", player.getCurrentMoney()));
		userData.add("Investments: ");

		// iterate through each of the investments
		ArrayList<Investment> investmentList = player.getInvestmentListArray();
		for (Investment investmentPosition : investmentList) {
			userData.add(String.format("%10s : %10s : %-10d", investmentPosition.getInvestmentType(),
					investmentPosition.getName(), investmentPosition.getQuantity()));
		}

		userData.add("Start Date: " + startDate);
		userData.add("Current Turn: " + String.valueOf(turn));
		userData.add("Interval Length: " + String.valueOf(intervalLength));
		userData.add("Turns to Play: " + String.valueOf(numOfTurns));
		userData.add("Stock Index: " + stockIndex);
		userData.add("Stock Name List: " + stockNameList);

	}

}