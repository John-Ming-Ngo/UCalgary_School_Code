package game;

import java.io.IOException;
import java.util.ArrayList;

import game.investments.Investment;
import game.investments.Stock;

public class Reports {

	private static final String BORDER = "--------------------------------------------------";
	private MarketSim simulation = null;
	private Stock comparisonIndex = null;
	private String indexSymbol = null;
	private boolean indexAvailable;

	/**
	* Constructors.
	*/
	public Reports(MarketSim simulation) throws IOException {
		this(simulation, simulation.getStockIndex());
	}

	public Reports(MarketSim simulation, String indexSymbol) throws IOException {
		this.simulation = simulation;
		this.indexSymbol = indexSymbol;
		setComparisonIndex();
	}

	/**
	 * @throws IOException
	 */
	private void setComparisonIndex() {

		try {
			comparisonIndex = new Stock(indexSymbol, simulation.getStartDate(), simulation.getIntervalLength(),
					simulation.getNumberOfTurns(), simulation.getTurn());
			indexAvailable = true;
		} catch (IOException ioe) {
			indexAvailable = false;
		}
	}

	/**
	 * Return the interval gain of the index
	 * 
	 * @return net gain
	 */
	public double getIndexIntervalGain() {
		double amount = 0.0;
		if (simulation.getTurn() > 0) {
			double[] priceHistory = comparisonIndex.getPriceHistory();
			amount = priceHistory[simulation.getTurn()] - priceHistory[simulation.getTurn() - 1];
		}
		return amount;
	}

	/**
	 * Return the net gain from the start of the simulation for the index
	 * 
	 * @return net gain of the index
	 */
	public double getIndexNetGain() {
		double amount = 0.0;
		double[] priceHistory = comparisonIndex.getPriceHistory();
		amount = comparisonIndex.getPrice() - priceHistory[0];

		return amount;
	}

	/**
	 * Return the net gain from the start
	 * 
	 * @return net gain
	 */
	public double getNetGain() {
		double amount = 0.0;
		amount = simulation.getPlayer().getNetWorth() - simulation.getPlayer().getInitialMoney();

		return amount;
	}

	/**
	 * Returns the percentage gain or loss
	 * 
	 * @return percentage gain or loss
	 */
	public double getNetPercentGain() {
		double gain = 0.0;
		double initialWorth = simulation.getPlayer().getInitialMoney();
		double currentWorth = simulation.getPlayer().getNetWorth();
		gain = ((currentWorth - initialWorth) / initialWorth * 100);

		return gain;
	}

	/**
	 * Prints out the items in the investment list with their info
	 * 
	 * @return output of investments
	 */
	public String investmentReport() {

		ArrayList<Investment> investmentList = simulation.getPlayer().getInvestmentListArray();
		String outputString = "";
		outputString += printStatus();
		outputString += String.format("%-4s%-19s%11s%12s%6s%-16s%-12s\n", "#", "    Name", "  Curr. Price",
				"  Amt. Owned", "", "    Curr. Val", "Gain/Loss");

		// iterates through each investment and includes updated information
		for (int index = 0; index < investmentList.size(); index++) {
			double price = investmentList.get(index).getPrice();

			if (price > 0) {
				outputString += String.format("%-4d%-19s$%8.2f%12d%12s$%10.2f%10.2f\n", index,
						investmentList.get(index).getName(), price, investmentList.get(index).getQuantity(), "",
						investmentList.get(index).getValue(), investmentList.get(index).getChange());
			} else {
				outputString += String.format("%-4d%-19s%9s%12d%12s$%10.2f%10.2f\n", index,
						investmentList.get(index).getName(), "unavail", investmentList.get(index).getQuantity(), "",
						investmentList.get(index).getValue(), investmentList.get(index).getChange());
			}
		}
		return outputString;
	}

	/**
	 * printProgressReport() - Displays progress report
	 * 
	 * @return status output
	 * 
	 */
	public String printProgressReport() {

		// calculate the change in wealth per turn
		double wealthDelta = 0.0;
		if (simulation.getTurn() > 0)
			wealthDelta = simulation.getPlayer().getWealthHistory(simulation.getTurn())
					- simulation.getPlayer().getWealthHistory(simulation.getTurn() - 1);

		// format the data
		String output = BORDER + "\nProgress Report\n" + BORDER + "\n";

		output += String.format("Overall wealth gained/lossed:$%.2f   %.2f%%\n\n", getNetGain(), getNetPercentGain());
		output += String.format("Wealth Gained or lost from last turn:$%.2f\n", wealthDelta);

		// update the index for the current turn
		if (indexAvailable) {
			comparisonIndex.updatePrice(simulation.getTurn());
			output += String.format(
					"Index: %-15sCurrent Value: %.2f\nGain/Loss:%.2f points since start               Gain/Loss:%.2f from last turn",
					indexSymbol, comparisonIndex.getPrice(), getIndexNetGain(), getIndexIntervalGain());
		} else {
			output += "\n\nIndex data is unavailable";
		}

		return output;
	}

	/**
	 * printStatus() - Display user status
	 * 
	 * @return status output
	 * 
	 */
	public String printStatus() {
		String outputString = "";

		outputString = "Turn:" + simulation.getTurn();
		outputString += "\n" + BORDER + "\n";
		outputString += String.format("%15s $%10.2f\n", "Bank Balance:", simulation.getPlayer().getCurrentMoney());
		outputString += String.format("%15s $%10.2f\n", "Net Worth:", simulation.getPlayer().getNetWorth());
		outputString += "\n\nStock List:\n";

		return outputString;
	}// printStatus
	/**
	 * finalSummaryStats() - returns stats for summary
	 * 
	 * @return output, data to display
	 */
	public String finalSummaryStats(){
		double netGain = getNetGain();
		String strnetGain = Double.toString(netGain);
		String output = "";
		output = strnetGain;
		return output;
	}
	/**
	 * finalSummaryStats2() - returns stats for summary
	 * 
	 * @return output, data to display
	 */
	public String finalSummaryStats2(){
		String startDate = simulation.getStartDate();
		String output = "";
		output = startDate;
		return output;
		
	}
	/**
	 * finalSummaryStats3() - returns stats for summary
	 * 
	 * @return output, data to display
	 */
	public String finalSummaryStats3(){
		double Turns = simulation.getTurn();
		int interval = simulation.getIntervalLength();
		int intTurns = (int)Turns - 1;
		int totalDays = interval * intTurns;
		String strTurns = Integer.toString(totalDays);
		String output = "";
		output = strTurns;
		return output;
	}
	/**
	 * finalSummaryStats4() - returns stats for summary
	 * 
	 * @return output, data to display
	 */
	public String finalSummaryStats4(){
		double initMoney = simulation.getPlayer().getInitialMoney();
		int initMoneyInt = (int)initMoney;
		String initMoneystr = Integer.toString(initMoneyInt);
		String output = "";
		output = initMoneystr;
		return output;
	}
	/**
	 * finalSummaryStats5() - returns stats for summary
	 * 
	 * @return output, data to display
	 */
	public String finalSummaryStats5(){
		String pctGain = Double.toString(getNetPercentGain());
		String output = "";
		output = pctGain;
		return output;
	}
	/**
	 * finalSummaryStats6() - returns stats for summary
	 * 
	 * @return output, data to display
	 */
	public String finalSummaryStats6(){
		ArrayList<Investment> investmentList = simulation.getPlayer().getInvestmentListArray();
		String outputString = "";

		// iterates through each investment and includes updated information
		for (int index = 0; index < investmentList.size(); index++) {
			outputString += String.format("%-3s%3s%6d\n",
					investmentList.get(index).getName(), ":", investmentList.get(index).getQuantity());
			}
		return outputString;
	}
	
	

}
