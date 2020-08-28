package game.investments;

import java.util.Arrays;

public class Investment {
	private String name;
	private int quantity;
	private double totalPercent;
	private double totalChange;
	private String investmentType;
	private double percent;
	private double change;
	private double[] priceHistory;
	private double currentUnitPrice;

	/**
	* Constructors
	*/
	public Investment() {
		this("", 0, 0, 0, "", 0, 0, new double[] { 0, 0, 0 }, 0);
	}

	public Investment(double totalPercent, double totalChange, double[] priceHistory) {
		this.totalPercent = totalPercent;
		this.totalChange = totalChange;
		this.priceHistory = priceHistory;
	}

	public Investment(Investment investmentToCopy) {
		this(investmentToCopy.name, investmentToCopy.quantity, investmentToCopy.totalPercent,
				investmentToCopy.totalChange, investmentToCopy.investmentType, investmentToCopy.percent,
				investmentToCopy.change, investmentToCopy.priceHistory, investmentToCopy.currentUnitPrice);
	}

	public Investment(String name, int quantity, double totalPercent, double totalChange, String investmentType,
			double percent, double change, double[] priceHistory, double currentUnitPrice) {
		this.name = name;
		this.quantity = quantity;
		this.totalPercent = totalPercent;
		this.totalChange = totalChange;
		this.investmentType = investmentType;
		this.percent = percent;
		this.change = change;
		this.priceHistory = priceHistory;
		this.currentUnitPrice = currentUnitPrice;
	}

	public Investment(String name, int quantity, double[] priceHistory, double currentUnitPrice) {
		this.name = name;
		this.quantity = quantity;
		this.priceHistory = priceHistory;
		this.currentUnitPrice = currentUnitPrice;
	}

	/**
	 * Adds quantity to investment
	 * 
	 * @param quantity
	 *            quantity of investment to remove
	 */
	public void addQuantity(int quantity) {
		this.quantity += quantity;
	}

	/**
	 * stockPreformace - gets the change and percent it has changed compared to
	 * the last known stock price
	 * 
	 * if stockPreformance should be called, make sure the turn/index is greater
	 * than 0 since it is useless in the beginning
	 * 
	 * @param index
	 */
	public void calculatePerformance(int index) {
		percent = 0; // reset to zero, so it would not keep previous changes,
						// unless needed then a arraylist should be implemented
		change = 0;
		try {
			totalChange = priceHistory[index] - priceHistory[0];
			change = priceHistory[index] - priceHistory[index - 1];

			totalPercent = (100 - priceHistory[0] / priceHistory[index] * 100);

			percent = (100 - priceHistory[index - 1] / priceHistory[index] * 100);

		} catch (Exception e) {
		} // ignore if the index is out of bounds etc

	}

	/**
	 * get The change from previous interval to this one
	 * 
	 * @return actual change
	 */
	public double getChange() {
		return change;
	}

	/**
	 * Returns the unit price of the investment
	 * 
	 * @return unit price of the investment
	 */
	public double getCurrentUnitPrice() {
		return currentUnitPrice;
	}

	/**
	 * Returns the type of the investment
	 * 
	 * @return the type of the investment
	 */
	public String getInvestmentType() {
		return investmentType;
	}

	/**
	 * Returns the name of the investment
	 * 
	 * @return the name of the investment
	 */
	public String getName() {
		return name;
	}

	/**
	 * Return percent change from previous turn to current
	 * 
	 * @return percent change from previous turn to current
	 */
	public double getPercent() {
		return percent;
	}

	/**
	 * Returns the unit price of the investment
	 * 
	 * @return unit price of the investment
	 */
	public double getPrice() {
		return currentUnitPrice;
	}

	/**
	 * Returns the priceHistory
	 * 
	 * @return Price History
	 */
	public double[] getPriceHistory() {
		double[] price = Arrays.copyOf(priceHistory, priceHistory.length);
		return price;
	}

	/**
	 * getPriceHistoryLength- Returns the length of the price history array
	 * 
	 * @return length of the priceHistory Array
	 * 
	 */
	public int getPriceHistoryLength() {
		return priceHistory.length;
	}

	/**
	 * @return quantity of investment (number of units)
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * getTotalChange
	 * 
	 * @return total change of current stock
	 */
	double getTotalChange() {
		return totalChange;
	}

	/**
	 * Gets total percentage change over time
	 * 
	 * @return total percentage of change over time
	 */
	double getTotalPercent() {
		return totalPercent;
	}

	/**
	 * getValue- Returns the value of the stock
	 * 
	 * @return value market value of investment
	 * 
	 */
	public double getValue() {

		double value = quantity * currentUnitPrice;
		return value;
	}

	/**
	 * Subtracts Quantity from investment
	 * 
	 * @param quantity
	 *            quantity of investment to remove
	 */
	public void removeQuantity(int quantity) {
		this.quantity -= quantity;
	}

	/**
	 * Directly sets the price per unit of this investment
	 * 
	 * @param price
	 *            the unit price to set
	 */
	public void setCurrentUnitPrice(double price) {
		currentUnitPrice = price;

	}

	/**
	 * Directly sets the investment type
	 * 
	 * @param type
	 *            Investment type
	 */
	public void setInvestmentType(String type) {
		this.investmentType = type;
	}

	/**
	 * Set Name of investment
	 * 
	 * @param name
	 *            the name of the investment
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * sets the price history
	 * 
	 * @param price
	 *            price history
	 */
	public void setPriceHistory(double[] price) {
		priceHistory = price;
	}

	/**
	 * Sets an element of price history of the investment
	 * 
	 * @param index
	 *            position of history list
	 * @param amount
	 *            price to insert at index position
	 */
	public void setPriceHistory(int index, double amount) {
		if (index >= 0 && index < priceHistory.length)
			priceHistory[index] = amount;
	}

	/**
	 * Directly sets the quantity of investment
	 * 
	 * @param quantity
	 *            quantity of investment to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * setPrice() - Sets the stock price to the value found at the index in
	 * priceHistory use this to set and update
	 * 
	 * @param index
	 *            - sets the stock price according in the corresponding history
	 *            index
	 * 
	 */
	public void updatePrice(int index) {
		// check for index out of range
		if (index < priceHistory.length) {
			currentUnitPrice = priceHistory[index];
			calculatePerformance(index);
		}

	}

}