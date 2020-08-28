package game.gui;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JPanel;

/**
 * 
 * This class is the layout and population of components of the simulation menu
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiSimulationMenu extends JPanel {

	private static final long serialVersionUID = -9075313097704140766L;
	// list of buttons on panel
	private JButton buttonAddInvestment;
	private JButton buttonBuySellInvestment;
	private JButton buttonAdvanceTurn;
	private JButton buttonMainMenu;

	public GuiSimulationMenu() {

	}

	/**
	 * @return list of buttons on panel
	 */
	public JButton[] getButton() {
		JButton[] button = { buttonAddInvestment, buttonBuySellInvestment, buttonAdvanceTurn, buttonMainMenu };
		return button;
	}

	/**
	 * @param panel
	 *            the panel to display the components
	 * @return the newly populated panel
	 */
	public JPanel init(JPanel panel) {

		GridBagConstraints constraints = new GridBagConstraints();
		GridBagLayout gridbag = new GridBagLayout();

		panel.removeAll();
		panel.setLayout(gridbag);

		// panel buttons
		Icon iconMainMenu = new ImageIcon("resources/png/arrow-up-double.png");
		Icon iconAdvanceTurn = new ImageIcon("resources/png/media-skip-forward-7.png");
		Icon iconBuySell = new ImageIcon("resources/png/money-add.png");
		Icon iconAdd = new ImageIcon("resources/png/list-add-4.png");
		buttonAddInvestment = new JButton("Add Investment", iconAdd);
		buttonBuySellInvestment = new JButton("Buy/Sell Investment", iconBuySell);
		buttonAdvanceTurn = new JButton("Advance Turn", iconAdvanceTurn);
		buttonMainMenu = new JButton("Main Menu", iconMainMenu);

		// layout and add components to panel
		constraints.insets = new Insets(5, 5, 5, 5);
		constraints.anchor = GridBagConstraints.PAGE_START;
		constraints.gridwidth = GridBagConstraints.NONE;
		constraints.fill = GridBagConstraints.HORIZONTAL;
		constraints.weighty = 0.0;
		constraints.gridx = 0;
		constraints.gridy = 0;
		panel.add(buttonAddInvestment, constraints);
		constraints.gridy++;
		panel.add(buttonBuySellInvestment, constraints);
		constraints.gridy++;
		panel.add(buttonAdvanceTurn, constraints);
		constraints.weighty = 1.0;
		constraints.gridy++;
		panel.add(buttonMainMenu, constraints);

		return panel;
	}

}
