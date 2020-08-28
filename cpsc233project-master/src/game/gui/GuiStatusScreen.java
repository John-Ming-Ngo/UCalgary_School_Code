package game.gui;

import javax.swing.*;

import game.Player;

import java.awt.BorderLayout;
import java.awt.*; //for layout managers and more

/**
 * 
 * This class is the layout and population of components of the status screen
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiStatusScreen extends JPanel {

	private static final long serialVersionUID = 1L;
	private final static int LINES = 15;
	private final static int COLS = 60;
	// list of buttons on panel
	private JButton buttonBegin;
	private JButton buttonCancel;
	private JTextArea status;
	private JTextArea performance;
	protected GuiGraph graph = new GuiGraph();


	public GuiStatusScreen() {

	}

	/**
	 * @return list of buttons on panel
	 */
	public JButton[] getButton() {
		JButton[] button = { buttonBegin, buttonCancel };
		return button;
	}

	/**
	 * @return the graph area
	 */
	public GuiGraph getGraphArea() {
		return graph;
	}

	/**
	 * @return the performance area
	 */
	public JTextArea getPerformanceArea() {
		return performance;
	}

	/**
	 * @return the status are
	 */
	public JTextArea getStatusArea() {
		return status;
	}

	/**
	 * @param panel
	 *            the panel to display the components
	 * @param person
	 * @return the newly populated panel
	 */
	public JPanel init(JPanel panel, Player person) {

		panel.removeAll();
		panel.setLayout(new BorderLayout());
		JScrollPane scrollPane = null;
		JPanel subpanel = new JPanel(new BorderLayout());

		// add turn status to panel
		status = new JTextArea(LINES, COLS);
		status.setLineWrap(true);
		status.setWrapStyleWord(true);
		status.setFont(new Font(Font.MONOSPACED, Font.PLAIN, 12));
		status.setBackground(GuiWindow.COLOR1);

		performance = new JTextArea(9, COLS);
		performance.setLineWrap(true);
		performance.setWrapStyleWord(true);
		performance.setFont(new Font("Courier", Font.PLAIN, 12));
		performance.setBackground(GuiWindow.COLOR2);

		graph.setPreferredSize(new Dimension(600, 300));
		graph.init(person);

		scrollPane = new JScrollPane(status);
		subpanel.add(performance, BorderLayout.PAGE_END);
		subpanel.add(scrollPane, BorderLayout.CENTER);

		panel.add(subpanel, BorderLayout.CENTER);
		panel.add(graph, BorderLayout.PAGE_END);

		return panel;
	}

}
