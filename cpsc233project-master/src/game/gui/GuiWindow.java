package game.gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.WindowConstants;

import game.Player;

/**
 * 
 * This class is the gui view class in a mvc model
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiWindow extends JFrame {

	/**
	 * 
	 */
	public static final Color COLOR1 = new Color(230, 230, 193);
	public static final Color COLOR2 = new Color(212, 212, 144);
	public static final Color COLOR3 = new Color(193, 221, 230);
	private static final long serialVersionUID = -8292637401436496027L;
	public static final int X_SIZE = 1024;
	public static final int Y_SIZE = 768;
	public static final double V_SPLIT = 0.3;
	public static final String TITLE = "Market Sim";

	private JPanel leftPanel = new JPanel();
	private JPanel rightPanel = new JPanel();
	private JPanel statusBar = new JPanel(new BorderLayout());
	private JTextArea statusArea;
	private JTextArea performanceArea;
	private JLabel statusMessage = new JLabel("Market Sim", SwingConstants.LEFT);

	// How to access these better
	private GuiSetupMenu guiSetupMenu;
	private GuiAddInvestment guiAddInvestment;
	private GuiBuySell guiBuySell;
	private GuiLoadState guiLoadState;
	protected GuiStatusScreen statusScreen = new GuiStatusScreen();
	private JButton[] buttonListLeftPanel;
	private JButton[] buttonListRightPanel;

	// All of the areas that need to be accessible or updated by methods
	// have been made instance variables

	public GuiWindow() {
		setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		setSize(X_SIZE, Y_SIZE);
		setTitle(TITLE);
	}

	/**
	 * Displays the Add Investment Menu
	 * 
	 * @param stockList
	 *            default list of stocks to populate the combobox
	 */
	public void addInvestmentMenu(String[] stockList) {
		guiAddInvestment = new GuiAddInvestment(stockList);
		guiAddInvestment.init(leftPanel);
		buttonListLeftPanel = guiAddInvestment.getButton();
		updatePanel(leftPanel);
	}

	/**
	 * Displays the Buy and Sell menu on the left panel
	 * 
	 * @param investmentList
	 *            the list to display in combobox
	 */
	public void buySellMenu(String[] investmentList) {
		guiBuySell = new GuiBuySell(investmentList);
		guiBuySell.init(leftPanel);
		buttonListLeftPanel = guiBuySell.getButton();
		updatePanel(leftPanel);
	}

	/**
	 * Displays the final Summary on right panel
	 */
	public void finalSummary(String content, String content2, String content3, String content4, String content5,
			String content6) {

		GuiFinalSummary guiFinalSummary = new GuiFinalSummary();
		guiFinalSummary.setStats(content);
		guiFinalSummary.setStats2(content2);
		guiFinalSummary.setStats3(content3);
		guiFinalSummary.setStats4(content4);
		guiFinalSummary.setStats5(content5);
		guiFinalSummary.setStats6(content6);
		guiFinalSummary.init(rightPanel);
		updatePanel(rightPanel);
	}

	/**
	 * Returns the buy sell menu object
	 * 
	 * @return guiBuySell panel
	 */
	public GuiBuySell getGuiBuySell() {
		return guiBuySell;
	}

	/**
	 * Returns the Load State Object
	 * 
	 * @return guiSetupMenu panel
	 */
	public GuiLoadState getGuiLoadState() {
		return guiLoadState;
	}

	/**
	 * Returns the Setup Menu Object
	 * 
	 * @return guiSetupMenu panel
	 */
	public GuiSetupMenu getGuiSetupMenu() {
		return guiSetupMenu;
	}

	/**
	 * Return Add Investment Menu Object
	 * 
	 * @return guiAddStockMenu panel
	 */
	public GuiAddInvestment getInvestmentMenu() {
		return guiAddInvestment;
	}

	/**
	 * Returns a list of buttons on the left panel
	 * 
	 * @return list of buttons on right panel
	 */
	public JButton[] getLeftPanelButtons() {
		return buttonListLeftPanel;
	}

	/**
	 * Returns the performance area for updates
	 * 
	 * @return performance area
	 */
	public JTextArea getPerformanceArea() {
		return performanceArea;
	}

	/**
	 * Returns list of buttons on Right Panel
	 * 
	 * @return list of buttons on left panel
	 */
	public JButton[] getRightPanelButtons() {
		return buttonListRightPanel;
	}

	/**
	 * Returns the status area to update
	 * 
	 * @return the status area to update
	 */
	public JTextArea getStatusArea() {
		return statusArea;
	}

	/**
	 * 
	 * Initializes main graphical window
	 * 
	 */
	public void init() {
		Container pane = getContentPane();
		setSize(X_SIZE, Y_SIZE);

		Dimension panelSize = new Dimension((int) (X_SIZE * V_SPLIT), Y_SIZE);
		leftPanel.setPreferredSize(panelSize);
		statusMessage.setHorizontalTextPosition(SwingConstants.LEFT);
		statusBar.add(statusMessage, BorderLayout.WEST);

		// for debugging to assist with layout of the panels
		rightPanel.setBackground(Color.WHITE);

		pane.add(leftPanel, BorderLayout.WEST);
		pane.add(statusBar, BorderLayout.PAGE_END);
		pane.add(rightPanel, BorderLayout.CENTER);

		setVisible(true);
	}

	/**
	 * Displays the setupMenu in the right Panel
	 */
	public void loadStateMenu() {
		guiLoadState = new GuiLoadState();
		guiLoadState.init(rightPanel);
		buttonListRightPanel = guiLoadState.getButton();
		updatePanel(rightPanel);
	}

	/**
	 * Displays the main menu in the left panel
	 */
	public void mainMenu(boolean canResume) {
		GuiMainMenu guiMainMenu = new GuiMainMenu(canResume);
		guiMainMenu.init(leftPanel);
		buttonListLeftPanel = guiMainMenu.getButton();
		updatePanel(leftPanel);
	}

	/**
	 * Displays the setupMenu in the right Panel
	 */
	public void setupMenu() {
		guiSetupMenu = new GuiSetupMenu();
		guiSetupMenu.init(rightPanel);
		buttonListRightPanel = guiSetupMenu.getButton();
		statusScreen.graph.reset();
		updatePanel(rightPanel);
	}

	/**
	 * Displays the high Scores in the right panbel
	 * @throws IOException 
	 */
	public void showScores() throws IOException {
		GuiScores guiScores = new GuiScores();
		guiScores.init(rightPanel);
		updatePanel(rightPanel);

	}

	/**
	 * Displays the simulation menu on the left panel
	 */
	public void simulationMenu() {
		GuiSimulationMenu guiSimulationMenu = new GuiSimulationMenu();
		guiSimulationMenu.init(leftPanel);
		buttonListLeftPanel = guiSimulationMenu.getButton();
		updatePanel(leftPanel);
	}

	/**
	 * Displays the splash screen on the right panel
	 */
	public void splashScreen() {
		GuiSplashScreen guiSplashScreen = new GuiSplashScreen();
		guiSplashScreen.init(rightPanel);
		updatePanel(rightPanel);
	}

	/**
	 * Displays the status screen on the right panel
	 * 
	 * @param person
	 */
	public void statusScreen(Player person) {
		statusScreen.init(rightPanel, person);
		updatePanel(rightPanel);
		statusArea = statusScreen.getStatusArea();
		performanceArea = statusScreen.getPerformanceArea();
	}

	public void updateGUIStatusScreenGraph(Player person) {// please give me a
															// better method
															// name
		statusScreen.graph.updateGraph(person); // we should see how making
												// things protected will make
												// things simpler if we have
												// time
	}

	/**
	 * 
	 * updatePanel - repaints the panel
	 * 
	 * @param panel
	 *            The panel to update
	 * 
	 */
	public void updatePanel(JPanel panel) {
		panel.revalidate();
		panel.repaint();
	}

	/**
	 * 
	 * updatePanel - updates the status bar
	 * 
	 * @param message The message to display on status bar
	 *           
	 * 
	 */
	public void updateStatusMessage(String message) {
		statusMessage.setText(message);
	}

	/**
	 * 
	 * addLabelTextRows places pairs of labels and fields in rows according to
	 * layout and container This method was reproduced and modified from code
	 * originally from Oracle
	 * 
	 * @param labels array
	 *            of labels to align
	 * @param textFields array
	 *            of textfields to align
	 * @param gridbag
	 *            layout
	 * @param container the container to place the labels and textfields
	 * @param constraints the gridbag layout constrains
	 */
	public static void addLabelTextRows(JLabel[] labels, JTextField[] textFields, GridBagLayout gridbag,
			Container container, GridBagConstraints constraints) {

		addLabelTextRows( labels, textFields, gridbag, container, 0, 0, constraints);
	}

	/**
	 * 
	 * addLabelTextRows places pairs of labels and fields in rows according to
	 * layout and container This method was reproduced and modified from code
	 * originally from Oracle
	 * 
	 * @param labels
	 *           array of labels to align
	 * @param textFields
	 *            array of textfields to align
	 * @param gridbag
	 *           gridbag layout
	 * @param container to place labels and fields into
	 * @param x_offset the number of columns to offset in the gridbag layout
	 * @param y_offset the number of rows to offset in the gridbag layout
	 * @param constraints the gridbag constraints of the object
	 * 
	 */
	public static void addLabelTextRows(JLabel[] labels, JTextField[] textFields, GridBagLayout gridbag,
			Container container, int x_offset, int y_offset, GridBagConstraints constraints) {

		int numLabels = labels.length;

		for (int index = 0; index < numLabels; index++) {
			constraints.gridx = 0 + x_offset;
			constraints.gridy = index + y_offset;
			constraints.gridwidth = GridBagConstraints.RELATIVE; // next-to-last
			constraints.fill = GridBagConstraints.NONE; // reset to default
			constraints.weightx = 0.0; // reset to default
			container.add(labels[index], constraints);

			constraints.gridy = index + y_offset;
			constraints.gridx = 1 + x_offset;
			constraints.gridwidth = GridBagConstraints.REMAINDER; // end row
			constraints.fill = GridBagConstraints.HORIZONTAL;
			constraints.weightx = 1.0;
			container.add(textFields[index], constraints);
		}
	}

}