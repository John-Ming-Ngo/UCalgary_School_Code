package game.gui;

import javax.swing.*;
import java.awt.GridBagConstraints;
import java.awt.Insets;

import java.awt.*; //for layout managers and more

/**
 * 
 * This class is the layout and population of components of the main menu
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiMainMenu extends JPanel {

	private static final long serialVersionUID = -5943700278683249763L;
	// list of buttons on panel
	private JButton buttonLoad;
	private JButton buttonNew;
	private JButton buttonResume;
	private JButton buttonQuit;
	private JButton buttonScores;
	private boolean canResume = false;

	public GuiMainMenu() {

	}

	public GuiMainMenu(boolean canResume) {
		this.canResume = canResume;
	}

	/**
	 * @return the list of buttons on the panel
	 */
	public JButton[] getButton() {
		JButton[] button = { buttonLoad, buttonNew, buttonResume, buttonQuit, buttonScores };
		return button;
	}

	/**
	 * @param panel
	 *            the panel to display the components
	 * @return the populated JPanel
	 */
	public JPanel init(JPanel panel) {

		GridBagConstraints constraints = new GridBagConstraints();
		GridBagLayout gridbag = new GridBagLayout();

		panel.removeAll();
		panel.setLayout(gridbag);

		// mainMenu buttons
		Icon iconQuit = new ImageIcon("resources/png/application-exit.png");
		Icon iconResume = new ImageIcon("resources/png/media-playback-start-7.png");
		Icon iconLoad = new ImageIcon("resources/png/document-open-5.png");
		Icon iconScores = new ImageIcon("resources/png/enumlist.png");
		Icon iconNew = new ImageIcon("resources/png/document-new-4.png");
		buttonResume = new JButton("Resume", iconResume);
		buttonNew = new JButton("New", iconNew);
		buttonLoad = new JButton("Load", iconLoad);
		buttonScores = new JButton("Show Scores", iconScores);
		buttonQuit = new JButton("Quit", iconQuit);

		// buttons
		constraints.anchor = GridBagConstraints.PAGE_START;
		constraints.fill = GridBagConstraints.HORIZONTAL;
		constraints.gridwidth = GridBagConstraints.RELATIVE;
		constraints.insets = new Insets(5, 5, 5, 5);
		constraints.gridx = 0;
		constraints.gridy = 0;
		constraints.weighty = 0.0;
		panel.add(buttonResume, constraints);
		constraints.gridy++;
		panel.add(buttonNew, constraints);
		constraints.weighty = 0.0;
		constraints.gridy++;
		panel.add(buttonLoad, constraints);
		constraints.gridy++;
		panel.add(buttonScores, constraints);
		constraints.weighty = 1.0;
		constraints.gridy++;
		panel.add(buttonQuit, constraints);

		if (!canResume) {
			buttonResume.setVisible(false);
		}

		return panel;
	}

}
