package game.gui;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.JPanel;

import game.Player;


//Code based from stackoverflow
//https://stackoverflow.com/questions/8693342/drawing-a-simple-line-graph-in-java
//original implementation by:
//https://stackoverflow.com/users/753012/rodrigo-castro

public class GuiGraph extends JPanel {

	private static final long serialVersionUID = -6965491125640294619L;
	private static final Stroke GRAPH_STROKE = new BasicStroke(2f);
	private static int listsize = 20;
	private static int index = 0;
	private static boolean full = false;
	private static int currentsize = 1;
	private int padding = 40;
	private int labelPadding = 35;
	private Color lineColor = new Color(25, 166, 230, 180);

	private Color pointColor = new Color(0, 100, 200, 180);
	private Color gridColor = new Color(200, 200, 200, 200);
	private int pointWidth = 5;
	private int numberYDivisions = 5;
	private double[] scores = new double[listsize];
	DecimalFormat format = new DecimalFormat("#.00");

	public GuiGraph() {

	}

	public GuiGraph(double[] scores) {
		this.scores = scores;

	}

	/**
	 * getMaxScore()- Returns the max score for the graph
	 * 
	 * @return maxScore
	 */
	
	private double getMaxScore() {
		double maxScore = Double.MIN_VALUE;
		for (Double score : scores) {
			maxScore = Math.max(maxScore, score);
		}
		return maxScore;
	}

	/**
	 * getMinScore()- Returns min score for the graph 
	 * 
	 * @return minScore 
	 */
	
	private double getMinScore() {
		double minScore = Double.MAX_VALUE;
		double tempScore = 0;
		for (int i = 0; i < listsize; i++) {
			minScore = Math.min(minScore, scores[i]);
			if (minScore != Double.MIN_VALUE) {
				tempScore = minScore; // as the list is populated with Double.MIN_VALUE, it will return
			}                         // a value that is not the min value
		}
		if (minScore == Double.MIN_VALUE) {
			return tempScore;
		} else {
			return minScore;
		}
	}

	/**
	 * getNextValue()- Returns net worth of player for graph
	 * 
	 * @return person.getNetWorth()
	 */
	
	public double getNextValue(Player person) {
		return person.getNetWorth();
	}
	
	/**
	 * getScores()- Returns player scores for graph
	 * 
	 * @return scores 
	 */
	public double[] getScores() {
		return scores;
	}

	/**
	 * init()- initializing the graph for the player
	 * 
	 * @param: player
	 */
	
	public void init(Player person) {

		scores = new double[listsize];

		for (int i = 0; i < listsize; i++) {
			scores[i] = Double.MIN_VALUE;
		}

		scores[0] = getNextValue(person);
	
	}
	/**
	 * paintComponent- initializing graphics for the graph display
	 * 
	 * @param: Graphics g 
	 */
	@Override
	protected void paintComponent(Graphics g) {
		super.paintComponent(g);
		Graphics2D g2 = (Graphics2D) g;

		g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		double xScale = ((double) getWidth() - (2 * padding) - labelPadding) / (scores.length - 1);

		double yScale = 0;

		if (getMaxScore() > getMinScore()) {
			yScale = ((double) getHeight() - 2 * padding - labelPadding) / (getMaxScore() - getMinScore());
            // Prevent divide by zero
		}

		List<Point> graphPoints = new ArrayList<>();
		for (int i = 0; i < scores.length; i++) {
			if (scores[i] > Double.MIN_VALUE) {
				int x1 = (int) (i * xScale + padding + labelPadding);
				int y1 = (int) ((getMaxScore() - scores[i]) * yScale + padding);
				graphPoints.add(new Point(x1, y1));
			}
		}

		// draw white background
		g2.setColor(Color.WHITE);
		g2.fillRect(padding + labelPadding, padding, getWidth() - (2 * padding) - labelPadding,
				getHeight() - 2 * padding - labelPadding);
		g2.setColor(Color.BLACK);

		// create hatch marks and grid lines for y axis.
		for (int i = 0; i < numberYDivisions + 1; i++) {
			int x0 = padding + labelPadding;
			int x1 = pointWidth + padding + labelPadding;
			int y0 = getHeight()
					- ((i * (getHeight() - padding * 2 - labelPadding)) / numberYDivisions + padding + labelPadding);
			int y1 = y0;
			if (scores.length > 0) {
				g2.setColor(gridColor);
				g2.drawLine(padding + labelPadding + 1 + pointWidth, y0, getWidth() - padding, y1);
				g2.setColor(Color.BLACK);

				String yLabel = format.format(
						(((getMinScore() + (getMaxScore() - getMinScore()) * ((i * 1.0) / numberYDivisions)) * 100))
								/ 100.0)
						+ "";
				FontMetrics metrics = g2.getFontMetrics();
				int labelWidth = metrics.stringWidth(yLabel);
				g2.drawString(yLabel, x0 - labelWidth - 5, y0 + (metrics.getHeight() / 2) - 3);
			}
			g2.drawLine(x0, y0, x1, y1);
		}

		// and for x axis
		for (int i = 0; i < scores.length; i++) {
			if (scores.length > 1) {
				int x0 = i * (getWidth() - padding * 2 - labelPadding) / (scores.length - 1) + padding + labelPadding;
				int x1 = x0;
				int y0 = getHeight() - padding - labelPadding;
				int y1 = y0 - pointWidth;
				if ((i % ((int) ((scores.length / 20.0)) + 1)) == 0) {
					g2.setColor(gridColor);
					g2.drawLine(x0, getHeight() - padding - labelPadding - 1 - pointWidth, x1, padding);
					g2.setColor(Color.BLACK);

					String xLabel = (i + index) + " "; // BAR

					FontMetrics metrics = g2.getFontMetrics();
					int labelWidth = metrics.stringWidth(xLabel);
					g2.drawString(xLabel, x0 - labelWidth / 2, y0 + metrics.getHeight() + 3);
				}
				g2.drawLine(x0, y0, x1, y1);
			}

		}
		if (full) {//if the scores list is full (no Double.MIN_VALUES)
			index++;//It will offset the graph's x axis
		}
		// create x and y axes

		g2.drawString("Net Worth", (getWidth() - padding) / 2, padding / 2);

		g2.drawLine(padding + labelPadding, getHeight() - padding - labelPadding, padding + labelPadding, padding);
		g2.drawLine(padding + labelPadding, getHeight() - padding - labelPadding, getWidth() - padding,
				getHeight() - padding - labelPadding);

		Stroke oldStroke = g2.getStroke();
		g2.setColor(lineColor);
		g2.setStroke(GRAPH_STROKE);
		for (int i = 0; i < graphPoints.size() - 1; i++) {
			int x1 = graphPoints.get(i).x;
			int y1 = graphPoints.get(i).y;
			int x2 = graphPoints.get(i + 1).x;
			int y2 = graphPoints.get(i + 1).y;
			g2.drawLine(x1, y1, x2, y2);
		}

		g2.setStroke(oldStroke);
		g2.setColor(pointColor);
		for (int i = 0; i < graphPoints.size(); i++) {
			int x = graphPoints.get(i).x - pointWidth / 2;
			int y = graphPoints.get(i).y - pointWidth / 2;
			int ovalW = pointWidth;
			int ovalH = pointWidth;
			g2.fillOval(x, y, ovalW, ovalH);
		}
	}

	/**
	 * setScores()- Setter method for player scores
	 * 
	 * @param scores 
	 */
	
	public void setScores(double[] scores) {
		this.scores = scores;
		invalidate();
		this.repaint();
	}

	/**
	 * reset()- Method to reset graph 
	 * 
	 */
	
	public void reset() {
		index = 0;
		currentsize = 1;
		full = false;
		for (int i = 0; i < listsize; i++) {
			scores[i] = Double.MIN_VALUE;

		}

	}

	/**
	 * updateGraph()- Method to update graph 
	 * 
	 * @param Person 
	 */
	
	public void updateGraph(Player person) {

		if (currentsize < listsize) { // while the list is not completely
										// full,
										// invoked every new turn so it can
										// actually get a value
			scores[currentsize] = getNextValue(person); 
														
			currentsize++; // then it increases

		} else { // list is full
			full = true;
			for (int i = 0; i < listsize; i++) {

				if (i == listsize - 1) {
					scores[i] = getNextValue(person); // only replace the last
														// element with
					// new value
				} else {
					scores[i] = scores[i + 1]; // else move everything up
				}
			}

		}
		this.repaint();

	}

}
