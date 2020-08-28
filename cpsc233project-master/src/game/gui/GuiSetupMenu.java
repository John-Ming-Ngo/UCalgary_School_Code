package game.gui;

import javax.swing.*;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.awt.*; //for layout managers and more

/**
 * 
 * This class is the layout and population of components of the setup menu
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiSetupMenu extends JPanel {

	private static final long serialVersionUID = -9184924764182529872L;
	private static final String[] STOCK_INDICES = { "^DJI", "^GSPC", "^NDX" };
	private static final String PATH = "./resources";
	private static final String FILE_ENDING = ".lst";
	// list of buttons on panel
	private JButton buttonBegin;
	private JButton buttonCancel;

	// list of JtextFields
	private JTextField userName;
	private JTextField startingMoney;
	private JTextField startDate;
	private JTextField intervalLength;
	private JTextField numberTurns;
	private JComboBox<String> stockIndex;
	private JComboBox<String> filename;
	private JCheckBox randomEvents;

	public GuiSetupMenu() {

	}

	/**
	 * @return the list of buttons on the panel
	 */
	public JButton[] getButton() {
		JButton[] button = { buttonBegin, buttonCancel };
		return button;
	}

	/**
	 * Returns the filename
	 * 
	 * @return filename
	 */
	public String getChosenFilename() {
		return (String) filename.getSelectedItem();
	}

	/**
	 * Returns the list of files in a directory
	 * 
	 * @return list of files
	 */
	public String[] getFilenames() {

		// create a FileFilter and override its accept-method
		FilenameFilter fileFilter = new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return name.toLowerCase().endsWith(FILE_ENDING);
			}
		};

		// Get files in directory
		File files = new File(PATH);
		ArrayList<String> namelist = new ArrayList<String>(Arrays.asList(files.list(fileFilter)));

		// convert to String[]
		String[] filelist = new String[namelist.size()];
		filelist = namelist.toArray(filelist);

		return filelist;
	}

	/**
	 * @return interval length
	 */
	public String getIntervalLength() {
		return intervalLength.getText();
	}

	/**
	 * @return number of turns
	 */
	public String getNumberTurns() {
		return numberTurns.getText();
	}

	/**
	 * @return the random events option
	 */
	public boolean getOptionRandomEvents() {
		return randomEvents.isSelected();
	}

	/**
	 * @return start date
	 */
	public String getStartDate() {
		return startDate.getText();
	}

	/**
	 * @return starting money
	 */
	public String getStartingMoney() {
		return startingMoney.getText();
	}

	/**
	 * Returns the filename
	 * 
	 * @return filename
	 */
	public String getStockIndex() {
		return (String) stockIndex.getSelectedItem();
	}

	/**
	 * @return the user name
	 */
	public String getUserName() {
		return userName.getText();
	}

	/**
	 * @param panel
	 *            the panel to display the components
	 * @return the populated panel
	 */
	public JPanel init(JPanel panel) {

		GridBagConstraints constraints = new GridBagConstraints();
		GridBagLayout gridbag = new GridBagLayout();

		panel.removeAll();
		panel.setLayout(gridbag);

		// setupFrame fields
		JLabel labelUserName = new JLabel("Name");
		userName = new JTextField();
		userName.setText("Mr. Big Shot");

		JLabel labelStartingMoney = new JLabel("Starting Money");
		startingMoney = new JTextField();
		startingMoney.setText("250000");

		JLabel labelStartDate = new JLabel("Start Date");
		startDate = new JTextField();
		startDate.setText("2010-02-01");

		JLabel labelNumberTurns = new JLabel("Number of Intervals");
		numberTurns = new JTextField();
		numberTurns.setText("52");

		JLabel labelIntervalLength = new JLabel("Interval length (Days)");
		intervalLength = new JTextField();
		intervalLength.setText("7");

		JLabel labelStockIndex = new JLabel("Index");
		stockIndex = new JComboBox<String>(STOCK_INDICES);

		JLabel labelFilename = new JLabel("Stock List");
		filename = new JComboBox<String>(getFilenames());

		JLabel[] labels = { labelUserName, labelStartingMoney, labelStartDate, labelNumberTurns, labelIntervalLength };
		JTextField[] textfields = { userName, startingMoney, startDate, numberTurns, intervalLength };

		randomEvents = new JCheckBox(
				"<html>Enable Random Events<br> Note: Like the title says, you have no control over these. <br>"
						+ "If you want to live a bit on the edge, check this box. Your choice.</html>",
				false);

		// Buttons
		panel.setLayout(gridbag);

		// setupFrame buttons
		Icon iconBegin = new ImageIcon("resources/png/dialog-accept.png");
		Icon iconCancel = new ImageIcon("resources/png/dialog-cancel.png");
		buttonBegin = new JButton("Begin", iconBegin);
		buttonCancel = new JButton("Cancel", iconCancel);

		// buttons
		constraints.insets = new Insets(5, 5, 5, 5);
		constraints.fill = GridBagConstraints.HORIZONTAL;
		constraints.anchor = GridBagConstraints.FIRST_LINE_START;
		constraints.weighty = 0.0;

		GuiWindow.addLabelTextRows(labels, textfields, gridbag, panel, constraints);

		constraints.anchor = GridBagConstraints.PAGE_START;
		constraints.gridy++;
		constraints.gridx = 0;
		constraints.gridwidth = GridBagConstraints.RELATIVE;
		panel.add(labelStockIndex, constraints);
		constraints.gridx = 1;
		constraints.gridwidth = GridBagConstraints.REMAINDER;
		panel.add(stockIndex, constraints);

		constraints.gridy++;
		constraints.weighty = 0.25;
		constraints.gridx = 0;
		panel.add(labelFilename, constraints);
		constraints.gridx = 1;
		panel.add(filename, constraints);
		constraints.gridx = 0;
		constraints.gridy++;
		panel.add(randomEvents, constraints);

		constraints.anchor = GridBagConstraints.PAGE_END;
		constraints.fill = GridBagConstraints.NONE;
		constraints.gridwidth = GridBagConstraints.RELATIVE;
		constraints.gridx = 0;
		constraints.weightx = 1;
		constraints.gridy++;
		panel.add(buttonBegin, constraints);
		constraints.gridwidth = GridBagConstraints.REMAINDER;
		constraints.weightx = 0.0;
		constraints.weighty = 1.0;
		constraints.gridx++;
		panel.add(buttonCancel, constraints);
		panel.setBackground(GuiWindow.COLOR1);

		return panel;
	}
}
