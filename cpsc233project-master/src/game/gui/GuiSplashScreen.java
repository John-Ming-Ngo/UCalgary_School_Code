package game.gui;

import javax.swing.*;
//import javax.swing.text.*;

import java.awt.*; //for layout managers and more

/**
 * 
 * This class is the layout and population of components of the splash screen
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiSplashScreen extends JPanel {

	private static final long serialVersionUID = -1707928135862259761L;

	public GuiSplashScreen() {

	}

	/**
	 * @param panel
	 *            the panel to display the components
	 * @return the populated panel
	 */
	public JPanel init(JPanel panel) {

		panel.removeAll();
		panel.setLayout(new BorderLayout());

		JLabel title = new JLabel();
		title.setText(
				"<html>Investement Simulator<br>------------------------------------------------------------------------------------</html>");
		title.setFont(new Font("MS Gothic", Font.BOLD, 36));

		JTextArea quote = new JTextArea();
		quote.setText("\"I will tell you how to become rich.\nClose the doors.\nBe fearful when others are greedy.\n "
				+ "Be greedy when others are fearful\"\n - Benjamin Franklin");
		quote.setBackground(GuiWindow.COLOR2);
		quote.setFont(new Font("MS Gothic", Font.ITALIC, 16));

		JTextArea instructions = new JTextArea();
		instructions.setText("Welcome to the Investement Simulator\n" + "Can you beat the historical market?\n\n"
				+ "Description: " + "This Simulation will give you the oppurtunity to play the\n"
				+ "historic market and make investements, risk-free. \n\n"
				+ "You will be able to make three types of Investements:\n " + "1: Stocks\n" + "2: Precious Metals\n"
				+ "3: Bitcoin\n\n" + "The Simulation will take real time prices/data\n"
				+ "and raise/lower your net worth based off of how well\n"
				+ "the investements did. Just like in real life.\n\n"
				+ "You will be able to track your success through various\n"
				+ "reports and graphs presented along the way, until \n"
				+ "the end, where you can decide yourself if you're ready or not.\n"
				+ "-------------------------------------------------------------------------\n" + "Author: Team 13\n"
				+ "Members: \n" + "John Ngo, Jason De Boer, Bob rao, Huidong Lu\n\n");
		instructions.setFont(new Font("MS Gothic", Font.BOLD, 12));
		instructions.setLineWrap(true);
		instructions.setBackground(GuiWindow.COLOR1);

		JTextArea description = new JTextArea();
		description.setText("Instructions: \n\n" + "1. To start a new simulation, select \"New\".\n"
				+ "2. Enter starting options.\n" + "   [Note]: The timeframe you enter must be entirely prior \n"
				+ "   to todays date or the simulation will fail to run.\n" + "3. Begin the simulation. \n"
				+ "4. Add investments to list\n" + "   This is the only way you will be able to sell or buy\n"
				+ "5. Buy/Sell investments.\n" + "6. Advance turn to the next interval\n"
				+ "7. Continue Buying/Selling and Advancing\n" + "   until simulation has ended\n\n" + "Have fun!\n");
		description.setFont(new Font("MS Gothic", Font.BOLD, 12));
		description.setBackground(GuiWindow.COLOR3);

		panel.add(title, BorderLayout.NORTH);
		panel.add(quote, BorderLayout.CENTER);
		panel.add(instructions, BorderLayout.SOUTH);
		panel.add(description, BorderLayout.EAST);
		panel.setBackground(GuiWindow.COLOR1);
		return panel;
	}

}
