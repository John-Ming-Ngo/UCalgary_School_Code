package game;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

import game.gui.*;
import game.investments.PreciousMetal;
import game.IOStuff.*;
import game.IOStuff.audio.SoundException;
import game.IOStuff.audio.SoundLayer;


/**
 * 
 * This class sets is the controller class for an mvc design for the Stocksim
 * class
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class SimulationController implements ActionListener {

	
	public static final String VALID_DATE = "^(19|20)\\d\\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$";
	private static final String BACKGROUND_MUSIC = "resources" + File.separator + "soundtracks" + File.separator + "03_No_Rocking_in_the_Jazzhands_Zone.mp3";
	private static final String SOUND_CLICK = "resources" + File.separator + "soundtracks" + File.separator + "click.mp3";
	// viewer
	private static boolean DEBUG = false;
	private boolean canResume;
	private boolean updateGraph = false;
	
	private GuiWindow guiWindow; //the view
	private MarketSim simulation;//the model
	// create a jframe
	private JFrame messageFrame = new JFrame("Message");
	private Reports reports = null;
	//Logging events
	private LogManager statusRecorder = new LogManager();
	

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * java.awt.event.ActionListener#actionPerformed(java.awt.event.ActionEvent)
	 */
	public void actionPerformed(ActionEvent event) {

		String command = event.getActionCommand();
		statusRecorder.addLine("Button clicked: " + command);
		
		//play click sound
		SoundLayer soundClick = new SoundLayer(SOUND_CLICK);
		try {
			soundClick.playOnce();
		} catch (SoundException e) {
			e.printStackTrace();
		}

		try {
			switch (command) {

			// Main Menu Options
			case "Quit":
				//guiWindow.dispose();
				//System.exit used here, to shutdown music thread, which does not stop otherwise
				System.exit(0);
				break;

			case "Show Scores":
				showScores();
				break;

			case "Resume":
				showSimulationMenu();
				break;

			case "Load":
				showLoadMenu();
				break;

			case "New":
				showSetup();
				break;

			// Setup Menu Buttons
			case "Begin":
				setupSimulation();
				break;

			case "Cancel":
				showSplashScreen();
				break;

			// Simulation Menu Buttons
			case "Add Investment":
				showAddInvestment();
				break;

			case "Buy/Sell Investment":
				showBuySellInvestment();
				break;

			case "Advance Turn":
				advanceTurn();
				break;

			case "Main Menu":
				showMainMenu();
				break;

			// add stock menu
			case "Add Stock":
				addStock();
				break;

			case "Add BitCoin":
				addBitCoin();
				break;

			case "Add Precious Metal":
				addPreciousMetal();
				break;

			case "Done":
				showSimulationMenu();
				break;

			// buy sell stock menu
			case "Buy Investment":
				buyInvestment();
				break;

			case "Sell Investment":
				sellInvestment();
				break;

			default:
				System.out.println(event.getActionCommand());

				// Load state menu
			case "Load State":
				loadState();
				break;

			}// end switch
		} 

		catch (Exception e) {
			if (DEBUG) {
				System.out.print(
						"If you see this message DEBUG is set to true on SimulationController.java. Turn off to remove this stack trace\n");
				System.out.println(e + "\n");
				e.printStackTrace();
			}
			
			guiWindow.updateStatusMessage(e.getMessage());
		}
	}

	/**
	 * Adds BitCoin to the investment list
	 * 
	 * @throws IOException
	 */
	public void addBitCoin() throws IOException {
		int status = simulation.getPlayer().addBitCoin(simulation.getStartDate(), simulation.getIntervalLength(),
				simulation.getNumberOfTurns(), simulation.getTurn());

		simulation.getPlayer().updatePortfolio(simulation.getTurn());
		
		String message = "";
		switch (status) {
		case Player.FAILED_INVESTMENT_ON_LIST:
			message = "Investment already exists.";
			break;
		case Player.SUCCESS_INVESTMENT_ADDED:
			message = "Investment Added To List";
			break;
		default:
			message = "Issue adding BitCoin.";
		}
		guiWindow.updateStatusMessage(message);
		statusRecorder.addLine("Adding BitCoin:");
		statusRecorder.addLine(message);
		updateGraph =false;
		guiUpdateStatus();
	}

	/**
	 * Adds action listeners to all buttons in the list
	 * 
	 * @param button
	 *            list of buttons
	 */
	private void addListener(JButton[] button) {
		for (JButton thisbutton : button) {
			thisbutton.addActionListener(this);
		}
	}

	/**
	 * Adds Precious Metals to the investment list
	 * 
	 * @throws IOException
	 * @throws NumberFormatException
	 */
	public void addPreciousMetal() throws NumberFormatException, IOException {
		String type = guiWindow.getInvestmentMenu().getSelectedMetal();

		// type enum
		PreciousMetal.Metal metalType = PreciousMetal.Metal.valueOf(type);

		int status = simulation.getPlayer().addMetal(metalType, simulation.getStartDate(),
				simulation.getIntervalLength(), simulation.getNumberOfTurns(), simulation.getTurn());

		simulation.getPlayer().updatePortfolio(simulation.getTurn());

		String message = "";
		switch (status) {
		case Player.FAILED_INVESTMENT_ON_LIST:
			message = "Investment already exists.";
			break;
		case Player.SUCCESS_INVESTMENT_ADDED:
			message = "Investment Added To List";
			break;
		default:
			message = "Issue adding stock";
		}
		guiWindow.updateStatusMessage(message);
		statusRecorder.addLine("Adding Precious metal: " + type);
		statusRecorder.addLine(message);
		updateGraph = false;
		guiUpdateStatus();
	}

	/**
	 * Adds stock to the investment list
	 * 
	 * @throws IOException
	 */
	public void addStock() throws IOException {
		String symbol = guiWindow.getInvestmentMenu().getSelectedStock();

		// if symbol is a list item with - then strip the description
		// information
		if (symbol.contains("-")) {
			symbol = symbol.substring(0, symbol.indexOf("-"));
		}

		int status = simulation.getPlayer().addStock(symbol.toUpperCase(), simulation.getStartDate(),
				simulation.getIntervalLength(), simulation.getNumberOfTurns(), simulation.getTurn());

		simulation.getPlayer().updatePortfolio(simulation.getTurn());
		String message = "";
		switch (status) {
		case Player.FAILED_INVESTMENT_ON_LIST:
			message = "Investment already exists.";
			break;
		case Player.SUCCESS_INVESTMENT_ADDED:
			message = "Investment Added To List";
			break;
		default:
			message = "Issue adding stock";
		}
		guiWindow.updateStatusMessage(message);
		statusRecorder.addLine("Adding Stock: " + symbol);
		statusRecorder.addLine(message);
		updateGraph = false;
		guiUpdateStatus();
	}

	/**
	 * Advances the turn counter by one and updates simulation and display
	 * 
	 * @throws IOException
	 */
	public void advanceTurn() throws IOException {

		try {
			String[] eventData = simulation.advanceTurn();
			simulation.getPlayer().updatePortfolio(simulation.getTurn());
			guiWindow.updateStatusMessage("Turn:" + simulation.getTurn());

			if (eventData != null) {
				JOptionPane.showMessageDialog(messageFrame, eventData[1], eventData[0], JOptionPane.WARNING_MESSAGE);
			}
			updateGraph = true;

			guiUpdateStatus();
			guiUpdatePerformance();
		} finally {
			if (simulation.isSimulationComplete()) {
				canResume = false;
				guiWindow.updateStatusMessage("Simulation Completed");
				showFinalSummary();
				showMainMenu();
				statusRecorder.save();
			}
		}
	}

	/**
	 * Buys the quantity of the selected stock
	 * 
	 * @throws NumberFormatException
	 */
	public void buyInvestment() throws NumberFormatException {

		try {
			int stockIndex = guiWindow.getGuiBuySell().getSelectedInvestmentIndex();
			int stockQty = guiWindow.getGuiBuySell().getInvestmentQuantity();
			int status = simulation.getPlayer().buyInvestment(stockIndex, stockQty);
			updateGraph = false;
			guiUpdateStatus();

			// update the status bar
			String message = "";
			switch (status) {
			case Player.FAILED_NEGATIVE_UNIT:
				message = "Can not buy a negative number of units. Enter a positive integer.";
				break;
			case Player.SUCCESS_TRANSACTION_COMPLETE:
				message = stockQty + " units bought";
				break;
			case Player.FAILED_NOT_ENOUGH_MONEY:
				message = "There is not nough money in your account to buy that many";
				break;
			case Player.FAILED_INVESTMENT_ON_LIST:
				message = "Investment not on list";
				break;
			case Player.FAILED_INVESTMENT_UNAVAILABLE:
				message = "Investment unavailable at this time";
				break;
			default:
				message = "Unknown Issue";
			}
			guiWindow.updateStatusMessage(message);
			statusRecorder.addLine("Buying " + stockQty);
			statusRecorder.addLine(message);
		} catch (NumberFormatException e) {
			throw new NumberFormatException("Please enter a valid number into quantity field");
		}

	}

	/**
	 * guiUpdatePerformance() updates the performance display
	 * 
	 */
	public void guiUpdatePerformance() {
		String content = reports.printProgressReport();
		statusRecorder.addLine(content);
		guiWindow.getPerformanceArea().setText(content);
	}

	/**
	 * 
	 * guiUpdateStatus() updates the status display
	 */
	public void guiUpdateStatus() {

		String content = reports.investmentReport();
		statusRecorder.addLine(content);
		guiWindow.getStatusArea().setText(content);
		
		if (simulation.getTurn() != 0 && updateGraph == true) {
			guiWindow.updateGUIStatusScreenGraph(simulation.getPlayer());
		}
	}

	/**
	 * Initialize main
	 */
	public void init() {
		statusRecorder.addLine("Beginning game...");
		mainControl();
	}

	/**
	 * Loads a previous state of the simulation with the file selected
	 * 
	 * @throws IOException
	 */
	public void loadState() throws IOException {
		String filename = guiWindow.getGuiLoadState().getChosenFilename();
		String playerName = filename.substring(0, filename.lastIndexOf("."));
		statusRecorder.addLine("Loading game:");
		statusRecorder.addLine("Player: " + playerName);
		// start or replace simulation instance
		simulation = new MarketSim();
		simulation.loadGame(playerName);
		reports = new Reports(simulation, simulation.getStockIndex());
		canResume = true;
		showSimulationMenu();
		showStatus();
	}

	/**
	 * Sets up the main control
	 */
	public void mainControl() {

		guiWindow = new GuiWindow();
		canResume = false;
		guiWindow.init();
		showMainMenu();
		showSplashScreen();
		SoundLayer soundTrack = new SoundLayer(BACKGROUND_MUSIC);
		try {
			soundTrack.playLoop();
		}
		catch (SoundException soundError) {
			guiWindow.updateStatusMessage("Sound configured incorrectly");
		}
		
	}

	/**
	 * Sells the quantity of the selected stock
	 * 
	 * @throws NumberFormatException
	 */
	public void sellInvestment() throws NumberFormatException {
		try {
			int investmentIndex = guiWindow.getGuiBuySell().getSelectedInvestmentIndex();
			int investmentQty = guiWindow.getGuiBuySell().getInvestmentQuantity();
			int status = simulation.getPlayer().sellInvestment(investmentIndex, investmentQty);
			guiUpdateStatus();
			
			// update the status bar
			String message = "";
			switch (status) {
			case Player.FAILED_NEGATIVE_UNIT:
				message = "Can not sell a negative number of units. Enter a positive integer.";
				break;
			case Player.SUCCESS_TRANSACTION_COMPLETE:
				message = investmentQty + " units sold";
				break;
			case Player.FAILED_NOT_ENOUGH_UNITS:
				message = "Not enough units to sell";
				break;
			case Player.FAILED_INVESTMENT_ON_LIST:
				message = "Investment not on list";
				break;
			default:
				message = "Unknown Issue";
			}
			guiWindow.updateStatusMessage(message);
			statusRecorder.addLine("Selling investment:");
			statusRecorder.addLine(message);
		} catch (NumberFormatException nfe) {
			throw new NumberFormatException("Number entered is too large or not a number");
		}
	}

	/**
	 * Sets up the simulation
	 * 
	 * @throws IOException
	 */
	public void setupSimulation() throws NumberFormatException, IOException {
		boolean inputIsValid = true;

		// read input from textfields
		try {
			double money = Double.parseDouble(guiWindow.getGuiSetupMenu().getStartingMoney());
			String date = guiWindow.getGuiSetupMenu().getStartDate();
			int numberOfTurns = Integer.parseInt(guiWindow.getGuiSetupMenu().getNumberTurns());
			int intervalLength = Integer.parseInt(guiWindow.getGuiSetupMenu().getIntervalLength());
			String userName = guiWindow.getGuiSetupMenu().getUserName();

			// validate input
			if (money < 0 || money > +Double.MAX_VALUE) {
				inputIsValid = false;
				guiWindow.updateStatusMessage(
						"Starting money is invalid: Please enter a smaller value for money value between 0 and "
								+ Double.MAX_VALUE);
			}
			if (!date.matches(VALID_DATE)) {
				inputIsValid = false;
				guiWindow.updateStatusMessage("Date invalid: Please enter a valid date (yyyy-mm-dd)");
			}
			if (intervalLength < 0 || intervalLength > 365) {
				inputIsValid = false;
				guiWindow.updateStatusMessage("Invterval length not valid: Please enter an integer between 0 and 365");
			}
			if (numberOfTurns < 1 || numberOfTurns > Integer.MAX_VALUE) {
				inputIsValid = false;
				guiWindow.updateStatusMessage(
						"Number of turns invalid : Please enter a smaller integer between 1 and " + Integer.MAX_VALUE);
			}

			// set parameters if input is valid
			if (inputIsValid) {
				simulation = new MarketSim();
				simulation.getPlayer().setUserName(userName);
				simulation.setIntervalLength(intervalLength);
				simulation.setNumberOfTurns(numberOfTurns);
				simulation.setDate(date);
				simulation.getPlayer().setInitialMoney(money);
				simulation.getPlayer().setCurrentMoney(money);
				simulation.setIndex(guiWindow.getGuiSetupMenu().getStockIndex());
				simulation.setStockNameList(guiWindow.getGuiSetupMenu().getChosenFilename());
				simulation.setOptionRandomEvents(guiWindow.getGuiSetupMenu().getOptionRandomEvents());

				reports = new Reports(simulation, guiWindow.getGuiSetupMenu().getStockIndex());

			}
		} catch (NumberFormatException e) {
			throw new NumberFormatException("An invalid entry was entered into one of your fields.");
		} finally {
			// close window and go to main sim
			canResume = true;
			showSimulationMenu();
			showStatus();
		}
	}

	/**
	 * Displays the add stock screen
	 * 
	 * @throws FileNotFoundException
	 */
	public void showAddInvestment() throws FileNotFoundException {
		ArrayList<String> list = simulation.getStockIndexList();
		String[] stockList = list.toArray(new String[list.size()]);
		guiWindow.addInvestmentMenu(stockList);
		addListener(guiWindow.getLeftPanelButtons());
	}

	/**
	 * Display the buy/sell investment menu
	 */
	public void showBuySellInvestment() {
		String[] investmentList = simulation.getPlayer().getInvestmentList();
		if (investmentList != null) {
			guiWindow.buySellMenu(investmentList);
			addListener(guiWindow.getLeftPanelButtons());
		} else {
			guiWindow.updateStatusMessage("There are no investments in your list!");
		}
	}

	/**
	 * Display the final summary
	 */
	public void showFinalSummary() {
		String content = reports.finalSummaryStats();
		String content2 = reports.finalSummaryStats2();
		String content3 = reports.finalSummaryStats3();
		String content4 = reports.finalSummaryStats4();
		String content5 = reports.finalSummaryStats5();
		String content6 = reports.finalSummaryStats6();
		
		guiWindow.finalSummary(content,content2,content3,content4,content5,content6);

	}

	/**
	 * Displays the main menu
	 */
	public void showLoadMenu() {
		guiWindow.loadStateMenu();
		addListener(guiWindow.getRightPanelButtons());
	}

	/**
	 * Displays the main menu
	 */
	public void showMainMenu() {
		guiWindow.mainMenu(canResume);
		addListener(guiWindow.getLeftPanelButtons());
	}

	/**
	 * Displays the high scores
	 * @throws IOException 
	 */
	public void showScores() throws IOException {
		guiWindow.showScores();
	}

	/**
	 * Display the setup menu
	 */
	public void showSetup() {
		guiWindow.setupMenu();
		addListener(guiWindow.getRightPanelButtons());
	}

	/**
	 * Display the simulation menu
	 */
	public void showSimulationMenu() {
		guiWindow.simulationMenu();
		addListener(guiWindow.getLeftPanelButtons());
	}

	/**
	 * Displays the splash screen
	 */
	public void showSplashScreen() {
		guiWindow.splashScreen();
	}

	/**
	 * Displays the status screen
	 */
	public void showStatus() {
		guiWindow.statusScreen(simulation.player1);
		guiUpdateStatus();
		guiUpdatePerformance();
	}

	/**
	 * Main method to start the gui
	 * 
	 * @param args
	 *            Command Line String
	 */
	public static void main(String[] args) {
		SimulationController simGui = new SimulationController();
		simGui.init();
	}
}
