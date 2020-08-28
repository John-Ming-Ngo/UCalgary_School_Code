package game.gui;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import java.util.*;
import game.IOStuff.*;

//for layout managers and more

/**
 * 
 * This class is the layout and population of components of the final summary
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiScores extends JPanel {

	private static final long serialVersionUID = -7942172456061200410L;

	public GuiScores() {

	}

	/**
	 * @param panel
	 *            the panel to display the components
	 * @return the populated panel
	 * @throws IOException 
	 */
	public JPanel init(JPanel panel) throws IOException {

		panel.removeAll();
		panel.setLayout(new BorderLayout());

		JLabel title = new JLabel();
		title.setText("<html>High Scores</html>");
		title.setFont(new Font("MS Gothic", Font.BOLD, 60));


		//Listing the high scores.
		ScoreManager scoreManager = new ScoreManager();
		String content = "";
		int count = 1;
		ArrayList<String> scoreInfo = scoreManager.getScoreData();
		for (String userScores:scoreInfo) {
			content += String.format("%-8d-%s\n", count , userScores);
			count++;
		}
		
		//textarea for scores
		JTextArea scorebox = new JTextArea();
		scorebox.setText(content);
		scorebox.setFont(new Font("MS Gothic", Font.PLAIN, 14));
		scorebox.setBackground(GuiWindow.COLOR3);
		
		JScrollPane scrollPane = new JScrollPane(scorebox);
		
		panel.add(title, BorderLayout.NORTH);
		panel.add(scrollPane, BorderLayout.CENTER);
		
		return panel;
	}

}

