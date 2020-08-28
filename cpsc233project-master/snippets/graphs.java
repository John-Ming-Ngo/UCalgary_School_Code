
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

//https://stackoverflow.com/questions/8693342/drawing-a-simple-line-graph-in-java
//Modified

public class graphs extends JPanel implements ActionListener {

	private int padding = 35;
	private int labelPadding = 25;
	private Color lineColor = new Color(25, 166, 230, 180);
	private Color pointColor = new Color(0, 100, 200, 180);
	private Color gridColor = new Color(200, 200, 200, 200);
	private static final Stroke GRAPH_STROKE = new BasicStroke(2f);
	private int pointWidth = 5;
	private int numberYDivisions = 5;

	private double[] scores;
	private Button press;
	private static int listsize = 10;
	private static int index = 0;
	private static boolean full = false;
	private static int currentsize = 1;

	public graphs(double[] scores) {
		press = new Button("Press");
		this.scores = scores;

		add(press);
		press.addActionListener(this);

	}

	@Override
	protected void paintComponent(Graphics g) {
		super.paintComponent(g);
		Graphics2D g2 = (Graphics2D) g;

		g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		double xScale = ((double) getWidth() - (2 * padding) - labelPadding) / (scores.length - 1);
		double yScale = ((double) getHeight() - 2 * padding - labelPadding) / (getMaxScore() - getMinScore());

		List<Point> graphPoints = new ArrayList<>();
		for (int i = 0; i < scores.length; i++) {
			if (scores[i] != 0) {
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
				String yLabel = ((int) ((getMinScore()
						+ (getMaxScore() - getMinScore()) * ((i * 1.0) / numberYDivisions)) * 100)) / 100.0 + "";
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
		if (full) {
			index++;
		}
		// create x and y axes
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

	private double getMinScore() {
		double minScore = Double.MAX_VALUE;
		for (Double score : scores) {
			minScore = Math.min(minScore, score);
		}
		return minScore;
	}

	private double getMaxScore() {
		double maxScore = Double.MIN_VALUE;
		for (Double score : scores) {
			maxScore = Math.max(maxScore, score);
		}
		return maxScore;
	}

	public void setScores(double[] scores) {
		this.scores = scores;
		invalidate();
		this.repaint();
	}

	public double[] getScores() {
		return scores;
	}

	public void actionPerformed(ActionEvent evt) {

		if (currentsize != listsize - 1) { // while the list is not completely full,
                                        // invoked every new turn so it can actually get a value
			scores[currentsize] = (double) Math.random() * 100; //getChange() or something similar
			currentsize++;  //then it increases

		} else { // list is full
			full = true;
			for (int i = 0; i < listsize; i++) {

				if (i == listsize - 1) {
					scores[i] = (double) Math.random() * 100; // only replace the last element with new value
				} else {
					scores[i] = scores[i + 1]; // else move everything up
				}
			}

		}
		this.repaint();

	}

	private static void createAndShowGui(double[] scores) {

		graphs mainPanel = new graphs(scores);
		mainPanel.setPreferredSize(new Dimension(1024, 516));
		JFrame frame = new JFrame("graph");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().add(mainPanel);
		frame.pack();
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);

	}

	public static void main(String[] args) {
		double[] scores = new double[listsize]; // We should have an list that is initalized with the base values for the player
		Random random = new Random();           // such as money

		scores[0] = 50;  // this should be the value for begining money like getMoney() or something

		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				createAndShowGui(scores);

			}
		});
	}
}
