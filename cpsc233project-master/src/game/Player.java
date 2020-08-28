package game;
import game.investments.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

/**
 * This class represents the player in the stock market simulation game.
 * 
 * @author Team 13 (John Ngo, Bob Rao, Huidong Lu, Jason De Boer)
 * 
 * @version 1.0.0 06 Feb 2017
 * 
 */
public class Player {

	public static final int FAILED_NEGATIVE_UNIT = 0;
	public static final int FAILED_NOT_ENOUGH_UNITS = 8;
	public static final int FAILED_INVESTMENT_UNAVAILABLE = 4;
	public static final int FAILED_INDEX_OUT_OF_BOUNDS = 3;
	public static final int FAILED_NOT_ENOUGH_MONEY = 5;
	public static final int SUCCESS_TRANSACTION_COMPLETE = 1;
	public static final int FAILED_NOT_POSITIVE_INTEGER = 6;
	public static final int FAILED_INVESTMENT_ON_LIST = 7;
	public static final int SUCCESS_INVESTMENT_ADDED = 2;
	/**
	 * Initialize attributes.
	 */
	private String userName = "";
	private String wittyPhrase = "";
	private double initialMoney = 0.0;
	private double currentMoney = 0.0;
	private ArrayList<Investment> investmentList = new ArrayList<Investment>();
	private ArrayList<Double> wealthHistory = null;

	/**
	 * Constructor methods
	 */
	public Player() {
		this("", "", 0.0, 0.0, new ArrayList<Investment>());

		
	}

	/**
	 * Copy Constructor Method
	 * 
	 * @param targetPlayer
	 *            An object of type player meant to be the
	 */
	public Player(Player targetPlayer) {
		userName = targetPlayer.getUserName();
		wittyPhrase = targetPlayer.getWittyPhrase();
		initialMoney = targetPlayer.getInitialMoney();
		currentMoney = targetPlayer.getCurrentMoney();
		investmentList = targetPlayer.getInvestmentListArray();
		wealthHistory = targetPlayer.getWealthHistoryArray();
	}

	public Player(String name, String phrase, double initialShekels, double currentShekels,
			ArrayList<Investment> listInvestments) {
		userName = name;
		wittyPhrase = phrase;
		initialMoney = initialShekels;
		currentMoney = currentShekels;
		investmentList = listInvestments;
		wealthHistory = new ArrayList<Double>();
	}

	/**
	* This method adds the given amount of money. It's a bit more
	* flexible than the other methods since it can add negative values.
	* @param amount A double corresponding to the amount to be added.
	*/
	public void absoluteMoneyChange(double amount) {
		setCurrentMoney(currentMoney+amount);
	}

	/**
	* This method picks a random stock and inflicts a random change
	* to it, in absolute value up or down.
	* @param amount A double corresponding to the number of stocks
	* to be added or removed - it is a double so as to avoid crashing
	* the program if someone put in decimal numbers - the actual number
	* will be truncated and turned into an integer.
	*/
	public void absoluteStockChange(double amount) {
		Random randomGen = new Random();
		int randomStockPosition = randomGen.nextInt(investmentList.size());
		Investment stockToModify = investmentList.get(randomStockPosition);
		int newQuantity = (int)(stockToModify.getQuantity() + amount);
		stockToModify.setQuantity(newQuantity);
	}

	/**
	 * addBitCoin method - Add a Bitcoins
	 * 
	 * @param type
	 *            type of metal
	 * 
	 * @param startDate
	 *            - StartDate of simulation used to get data
	 * @param intervalLength
	 *            - Length in Days of interval
	 * @param numberOfIntervals
	 *            - Total intervals for simulation length
	 * @return status, 0- Investment already on list, 1, Investment Added
	 * @throws IOException 
	 * 
	 */
	/**
	 * addBitCoin method - Add a Bitcoins
	 * 
	 * @param startDate Date to start retrieving data
	 * @param intervalLength length of interval in days to retrieve
	 * @param numberOfIntervals to retrieve
	 * @param index the current index to start at
	 * @return the status of the operation  0- Investment already on list, 1, Investment Added
	 * @throws IOException
	 */
	public int addBitCoin(String startDate, int intervalLength, int numberOfIntervals, int index) throws IOException {
		
		int status = FAILED_INVESTMENT_ON_LIST;
		if (!isInvestmentOnList("BitCoin")) {
			investmentList.add(new BitCoin(startDate, intervalLength, numberOfIntervals, index));
			status = SUCCESS_INVESTMENT_ADDED;
		}
		return status;

	}

	/**
	 * addMetal method - Add a stock to players list of stocks
	 * 
	 * @param type
	 *            type of metal
	 * 
	 * @param startDate
	 *            - StartDate of simulation used to get data
	 * @param intervalLength
	 *            - Length in Days of interval
	 * @param numberOfIntervals
	 *            - Total intervals for simulation length
	 * @return status, 0- Investment already on list, 1, Investment Added
	 * @throws IOException 
	 * @throws NumberFormatException 
	 * 
	 */
	public int addMetal(PreciousMetal.Metal type, String startDate, int intervalLength, int numberOfIntervals,
			int index) throws NumberFormatException, IOException {
		
		int status = FAILED_INVESTMENT_ON_LIST;
		if (!isInvestmentOnList(type.toString())) {
			investmentList.add(new PreciousMetal(type, startDate, intervalLength, numberOfIntervals, index));
			status = SUCCESS_INVESTMENT_ADDED;
		}
		
		return status;
	}

	/**
	 * Adds a given stock to the list of owned stocks.
	 * 
	 * @param ownedInvestment
	 *            An Investment object corresponding to the stock one one
	 *            apparently owns.
	 */
	public void addOwnedInvestment(Investment ownedInvestment) {
		investmentList.add(ownedInvestment);
	}

	/**
	 * addStock method - Add a stock to players list of stocks
	 * 
	 * @param stockSymbol
	 *            - Symbol of stock to add
	 * @param startDate
	 *            - StartDate of simulation used to get data
	 * @param intervalLength
	 *            - Length in Days of interval
	 * @param numberOfIntervals
	 *            - Total intervals for simulation length
	 * @return status, 0- Investment already on list, 1, Investment Added
	 * @throws IOException 
	 * 
	 */
	public int addStock(String stockSymbol, String startDate, int intervalLength, int numberOfIntervals, int index) throws IOException {

		int status = FAILED_INVESTMENT_ON_LIST;
		if (!isInvestmentOnList(stockSymbol)) {
			investmentList.add(new Stock(stockSymbol, startDate, intervalLength, numberOfIntervals, index));
			status = SUCCESS_INVESTMENT_ADDED;
		}
		return status;

	}

	/**
	 * Increases the quantity of the stock at the given index in the Stocklist
	 * If the quantity to be bought exceeds the user's currentMoney in value,
	 * nothing will be done.
	 * 
	 * @param index
	 *            An integer corresponding to the symbol of the stock to buy.
	 * @param quantity
	 *            An integer corresponding to the amount of stock to buy.
	 * 
	 * @return An integer indicating status 0-Must be a positive integer, 1-Transaction
	 *         Succeeded, 2-Not enough money to buy stock, 3-stock index out of
	 *         range 4- investment unavailable at this time
	 */
	public int buyInvestment(int index, int quantity) {

		int status = FAILED_NOT_POSITIVE_INTEGER;

		if (investmentList.get(index).getPrice() > 0) {
			// check if index is in range
			if (index < investmentList.size() && index >= 0 && quantity > 0) {

				// buy stock if there is sufficient funds
				if (investmentList.get(index).getPrice() * quantity <= currentMoney) {
					currentMoney -= investmentList.get(index).getPrice() * quantity;
					investmentList.get(index).addQuantity(quantity);
					status = SUCCESS_TRANSACTION_COMPLETE;
				} else {
					// not enough money in account
					status = FAILED_NOT_ENOUGH_MONEY;
				}
			} else {
				//index is out of bounds
				status = FAILED_INDEX_OUT_OF_BOUNDS;
			} 
		} else {
			//price is 0 or less and therefore unavailable
			status = FAILED_INVESTMENT_UNAVAILABLE;
		}
		return status;
	}

	/**
	 * Returns the current balance of the player
	 * 
	 * @return A double corresponding to the money the player started with.
	 */
	public double getCurrentMoney() {
		return currentMoney;
	}

	/**
	 * Returns the initial starting balance of the users account
	 * 
	 * @return A double corresponding to the money the player started with.
	 */
	public double getInitialMoney() {
		return initialMoney;
	}

	/**
	 * Returns an itemized list of stocks as a string
	 * 
	 * @return A numbered string listing of each stock
	 * 
	 */
	public String[] getInvestmentList() {

		String[] outputString = new String[investmentList.size()];

		if (investmentList.size() > 0) {
			for (int index = 0; index < investmentList.size(); index++) {
				outputString[index] = index + " - " + investmentList.get(index).getName() + "\n";
			}
		} else {
			outputString = null;
		}
		return outputString;
	}

	/**
	 * Returns a cloned ArrayList that is the ArrayList of stocks the player
	 * class has.
	 * 
	 * @return copiedStockList An ArrayList containing Stocks.
	 */
	public ArrayList<Investment> getInvestmentListArray() {
		ArrayList<Investment> copiedInvestmentList = new ArrayList<Investment>();
		for (Investment investmentEntity : investmentList) {
			copiedInvestmentList.add(new Investment(investmentEntity));
		}
		return copiedInvestmentList;

	}

	/**
	 * Returns an itemized list of stocks as a string
	 * 
	 * @return A numbered string listing of each stock
	 * 
	 */
	public String getInvestmentListReport() {

		String outputString = "";
		for (int index = 0; index < investmentList.size(); index++) {
			outputString += String.format("%-3d %12s  %-15s $%-8.2f %-15s %8d\n", index,
					investmentList.get(index).getName(), "Current Price", investmentList.get(index).getPrice(),
					"Owned:", investmentList.get(index).getQuantity());

		}
		return outputString;
	}

	/**
	 * Returns the networth of the player as an aggregate of account balance and
	 * current value of stocks
	 * 
	 * @return net worth of players stock value and accounts
	 * 
	 */
	public double getNetWorth() {
		double netWorth = 0.0;
		for (Investment stockPosition : investmentList) {
			netWorth += stockPosition.getValue();
		}
		netWorth += currentMoney;
		return netWorth;
	}
	
	/**
	 * Gets userName.
	 * 
	 * @return userName A string corresponding to the username of the player.
	 */
	public String getUserName() {
		return userName;
	}
	
	/**
	 * Returns the net worth of the player at a particular turn index
	 * 
	 * @return Net Worth at the time index
	 */
	public double getWealthHistory(int index) {
		if (wealthHistory.size() > index)
			return wealthHistory.get(index);
		else
			return -1.0f;
	}

	public ArrayList<Double> getWealthHistoryArray() {
		ArrayList<Double> copiedHistoryList = new ArrayList<Double>();
		for (Double historyEntity : wealthHistory) {
			copiedHistoryList.add(historyEntity);
		}
		return copiedHistoryList;
	}

	/**
	 * Returns the wittyPhrase defined by the player
	 * 
	 * @return A string corresponding to the user's catch phrase.
	 */
	public String getWittyPhrase() {
		return wittyPhrase;
	}

	/**
	 * Determines if an investment is already on the list
	 * 
	 * @param name
	 *            the name of investment to check
	 * @return true if name already exists on list
	 */
	public boolean isInvestmentOnList(String name) {

		boolean status = false;

		// iterate through the list to see if name already exists
		for (int index = 0; index < investmentList.size(); index++) {
			if (investmentList.get(index).getName().equals(name)) {
				status = true;
			}
		}
		return status;
	}

	/**
	* This method calculates the amount of money lost by the player
	* assuming it was a percentage loss, and applies it.
	* 
	* @param amount A double corresponding to the percent multiplier
	* to the currentMoney value. 0 would be to remove all money;
	* 200 doubles the value and 1000 multiplies it by ten.
	*/
	public void percentMoneyChange(double amount) {
		setCurrentMoney(currentMoney * amount / 100);
	}

	/**
	* This method picks a random stock and inflicts a random change
	* to it, in percentage up or down.
	* 
	* @param amount A double corresponding to the percent multiplier
	* to the number of stocks. 0 would be to remove all stocks;
	* 200 doubles the value and 1000 multiplies it by ten. After
	* multiplying, it will truncated to the local integer value.
	*/
	public void percentStockChange(double amount) {
		Random randomGen = new Random();
		int randomStockPosition = randomGen.nextInt(investmentList.size());
		Investment stockToModify = investmentList.get(randomStockPosition);
		int newStockQuantity = (int)(stockToModify.getQuantity() * amount / 100);
		stockToModify.setQuantity(newStockQuantity);
	}

	/**
	 * Decreases the quantity of the stock at the given index in the
	 * investmentlist If the quantity to sell exceeds the user's stock quantity
	 * nothing will be done.
	 * 
	 * @param index
	 *            An integer corresponding to the symbol of the stock to buy.
	 * @param quantity
	 *            An integer corresponding to the amount of stock to buy.
	 * 
	 * @return A status code 0- Not a positive integer, 1 - Transaction Successful,
	 *         2 - Not enough stock units to sell, 3 Stock index out of range
	 */
	public int sellInvestment(int index, int quantity) {

		int status = FAILED_NEGATIVE_UNIT;

		// check if index is in range
		if (index < investmentList.size() && index >= 0 && quantity > 0) {

			// sell stock if there is sufficient quantity
			if (investmentList.get(index).getQuantity() >= quantity) {
				currentMoney += investmentList.get(index).getPrice() * quantity;
				investmentList.get(index).removeQuantity(quantity);
				status = SUCCESS_TRANSACTION_COMPLETE;
			} else {
				// not enough investment to sell
				status = FAILED_NOT_ENOUGH_UNITS;
			}
		} else {
			status = FAILED_INDEX_OUT_OF_BOUNDS;
		}

		return status;
	}

	/**
	 * Sets the current account balance of the player
	 * 
	 * @param moneyValue
	 *            A double corresponding to the user's currentMoney value.
	 */
	public void setCurrentMoney(double moneyValue) {
		currentMoney = moneyValue;
	}

	/**
	 * Sets the initial account balance for the player
	 * 
	 * @param moneyValue
	 *            A double corresponding to the user's initialMoney value.
	 */
	public void setInitialMoney(double moneyValue) {
		initialMoney = moneyValue;
	}
	
	/**
	 * Sets the player's investmentList to a copy of the fed in list of stocks.
	 * 
	 * @param listInvestments
	 *            An ArrayList of type Stock
	 */
	public void setInvestmentList(ArrayList<Investment> listInvestments) {
		ArrayList<Investment> copiedInvestmentList = new ArrayList<Investment>();
		for (Investment investmentEntity : listInvestments) {
			copiedInvestmentList.add(new Investment(investmentEntity));
		}
		investmentList = copiedInvestmentList;
	}
	
	/**
	 * Sets the users name.
	 * 
	 * @param name
	 *            A string corresponding to the userName.
	 */
	public void setUserName(String name) {
		if (name.indexOf(":") == -1) {
			userName = name;
		}
	}
	
	/**
	 * Sets wittyPhrase.
	 * 
	 * @param phrase
	 *            A String corresponding to the intended wittyPhrase.
	 */
	public void setWittyPhrase(String phrase) {
		if (phrase.indexOf(":") == -1) {
			wittyPhrase = phrase;
		}
	}
	
	/**
	 * updates the portfolio based on the simulation turn
	 * 
	 * @param index
	 *            the index to set portfolio prices
	 * 
	 * @return status 0-failure, 1-Success, 2-Index out of Range
	 */
	public int updatePortfolio(int index) {

		int status = FAILED_INDEX_OUT_OF_BOUNDS;
		
		//if there is an entry for the index then replace that entry, otherwise add a new enty
		if (wealthHistory.size() > index)
			wealthHistory.set(index, getNetWorth());
		else
			wealthHistory.add(getNetWorth());
		// ensure at least one stock exists on the list and index is in range
		if (investmentList.size() > 0 && index >= 0 && index < investmentList.get(0).getPriceHistoryLength()) {
			// iterate through all stocks and update unit prices
			for (Investment investmentPosition : investmentList) {
				investmentPosition.updatePrice(index);
				status = SUCCESS_TRANSACTION_COMPLETE;
			}
		}

		return status;
	}
	
}