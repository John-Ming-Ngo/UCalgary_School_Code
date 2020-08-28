package game.gui;

import game.investments.PreciousMetal;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JPanel;

/**
 * 
 * This class is the layout and population of components of the add stock menu
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiAddInvestment extends JPanel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 858428126633289077L;
	// list of buttons on panel
	private static final int COMBOBOX_WIDTH = 35;
	private JButton buttonAddStock;
	private JButton buttonAddPreciousMetal;
	private JButton buttonAddBitCoin;
	private JButton buttonDone;
	private JComboBox<String> selectStock;
	private JComboBox<Object> selectMetal;
	private String[] stockList;
	private PreciousMetal.Metal[] metalList;

	public GuiAddInvestment() {

	}

	public GuiAddInvestment(String[] stockList) {
		this.stockList = stockList;
		this.metalList = PreciousMetal.Metal.values();
	}

	/**
	 * @return list of button components on panel
	 */
	public JButton[] getButton() {
		JButton[] button = { buttonAddStock, buttonAddBitCoin, buttonAddPreciousMetal, buttonDone };
		return button;
	}

	/**
	 * Returns the prototype width of the combobox
	 * 
	 * @return a string for the prototype width of the combobox
	 */
	private String getProtoWidth() {
		String outputString = "";
		for (int count = 0; count < COMBOBOX_WIDTH; count++) {
			outputString += "*";
		}
		return outputString;
	}

	/**
	 * @return the selected metal
	 */
	public String getSelectedMetal() {
		return (String) selectMetal.getSelectedItem().toString();
	}

	/**
	 * @return the selected stock
	 */
	public String getSelectedStock() {
		return (String) selectStock.getSelectedItem();
	}

	/**
	 * @param panel
	 *            the panel to display the components
	 * @return the new panel
	 */
	public JPanel init(JPanel panel) {

		GridBagConstraints constraints = new GridBagConstraints();
		GridBagLayout gridbag = new GridBagLayout();

		panel.removeAll();
		panel.setLayout(gridbag);

		// frame buttons
		Icon iconDone = new ImageIcon("resources/png/dialog-accept.png");
		Icon iconAddStock = new ImageIcon("resources/png/application-certificate.png");
		Icon iconAddMetal = new ImageIcon("resources/png/coins.png");
		Icon iconAddBitcoin = new ImageIcon("resources/png/money.png");
		buttonAddStock = new JButton("Add Stock", iconAddStock);
		buttonAddPreciousMetal = new JButton("Add Precious Metal", iconAddMetal);
		buttonAddBitCoin = new JButton("Add BitCoin", iconAddBitcoin);
		buttonDone = new JButton("Done", iconDone);

		// combo boxes
		selectStock = new JComboBox<String>(stockList);
		selectStock.setSelectedIndex(0);
		selectStock.setEditable(true);
		selectStock.setPrototypeDisplayValue(getProtoWidth());

		selectMetal = new JComboBox<Object>(metalList);
		selectMetal.setSelectedIndex(0);
		selectMetal.setEditable(false);
		selectMetal.setPrototypeDisplayValue(getProtoWidth());

		// add buttons
		constraints.anchor = GridBagConstraints.PAGE_START;
		constraints.insets = new Insets(5, 5, 5, 5);
		constraints.fill = GridBagConstraints.HORIZONTAL;
		constraints.gridwidth = GridBagConstraints.RELATIVE;
		constraints.gridx = 0;
		constraints.gridy = 0;
		constraints.weighty = 0.0;
		panel.add(buttonDone, constraints);
		constraints.gridx = 0;
		constraints.gridy++;
		panel.add(buttonAddStock, constraints);
		constraints.gridy++;
		constraints.weighty = 0.0;
		panel.add(selectStock, constraints);
		constraints.gridx = 0;
		constraints.gridy++;
		panel.add(buttonAddPreciousMetal, constraints);
		constraints.gridy++;
		constraints.weighty = 0.0;
		panel.add(selectMetal, constraints);
		constraints.gridy++;
		constraints.weighty = 1.0;
		panel.add(buttonAddBitCoin, constraints);

		return panel;
	}

}