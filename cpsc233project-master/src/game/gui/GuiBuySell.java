package game.gui;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 * 
 * This class is the layout and population of components of the buy/sell menu
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiBuySell extends JPanel {

	private static final String DEFAULT_QUANTITY = "100";
	private static final long serialVersionUID = -3006574377037414776L;
	// list of buttons on panel
	private JButton buttonAddInvestment;
	private JButton buttonBuyInvestment;
	private JButton buttonSellInvestment;
	private JButton buttonDone;
	private JButton buttonAdvanceTurn;
	private JComboBox<String> selectInvestment;
	private JTextField investmentQuantity;
	private String[] investmentList;

	public GuiBuySell(String[] investmentList) {
		this.investmentList = investmentList;
	}

	/**
	 * @return list of buttons on the panel
	 */
	public JButton[] getButton() {
		JButton[] button = { buttonBuyInvestment, buttonSellInvestment, buttonDone, buttonAdvanceTurn,
				buttonAddInvestment };
		return button;
	}

	/**
	 * @return the value of the investment quantity text field
	 */
	public int getInvestmentQuantity() {
		int quantity = Integer.parseInt(investmentQuantity.getText());
		return quantity;
	}

	/**
	 * @return the value of the selectInvestment combo box
	 */
	public String getSelectedInvestment() {
		return (String) selectInvestment.getSelectedItem();
	}

	/**
	 * @return the index value of the selectInvestment combo box
	 */
	public int getSelectedInvestmentIndex() {
		return selectInvestment.getSelectedIndex();
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

		investmentQuantity = new JTextField(10);
		JLabel stockQuantityLabel = new JLabel("Quantity");
		stockQuantityLabel.setLabelFor(investmentQuantity);
		investmentQuantity.setText(DEFAULT_QUANTITY);

		JLabel[] labels = { stockQuantityLabel };
		JTextField[] textfields = { investmentQuantity };

		// frame buttons
		Icon iconDone = new ImageIcon("resources/png/dialog-accept.png");
		Icon iconSell = new ImageIcon("resources/png/dialog-fewer.png");
		Icon iconBuy = new ImageIcon("resources/png/dialog-more.png");
		Icon iconAdd = new ImageIcon("resources/png/list-add-4.png");
		Icon iconAdvanceTurn = new ImageIcon("resources/png/media-skip-forward-7.png");
		buttonAddInvestment = new JButton("Add Investment", iconAdd);
		buttonBuyInvestment = new JButton("Buy Investment", iconBuy);
		buttonSellInvestment = new JButton("Sell Investment", iconSell);
		buttonAdvanceTurn = new JButton("Advance Turn", iconAdvanceTurn);
		buttonDone = new JButton("Done", iconDone);

		// combo box for listing stocks
		selectInvestment = new JComboBox<String>(investmentList);
		selectInvestment.setSelectedIndex(0);

		// buttons
		constraints.anchor = GridBagConstraints.PAGE_START;
		constraints.insets = new Insets(5, 5, 5, 5);
		constraints.fill = GridBagConstraints.HORIZONTAL;
		constraints.gridwidth = GridBagConstraints.NONE;
		constraints.gridx = 0;
		constraints.gridy = 0;
		constraints.weighty = 0.0;
		panel.add(buttonDone, constraints);
		constraints.gridy++;
		panel.add(buttonAddInvestment, constraints);
		constraints.gridy++;
		panel.add(buttonAdvanceTurn, constraints);
		constraints.gridy++;
		panel.add(buttonBuyInvestment, constraints);
		constraints.gridy++;
		panel.add(buttonSellInvestment, constraints);
		constraints.gridy++;

		GuiWindow.addLabelTextRows(labels, textfields, gridbag, panel, 0, constraints.gridy, constraints);

		constraints.gridy += 1 + labels.length;
		constraints.weightx = 0;
		constraints.fill = GridBagConstraints.HORIZONTAL;
		constraints.gridx = 0;
		constraints.weighty = 1.0;
		panel.add(selectInvestment, constraints);

		return panel;
	}

}