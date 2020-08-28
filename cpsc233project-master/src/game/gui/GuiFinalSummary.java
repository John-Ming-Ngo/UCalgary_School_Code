package game.gui;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;

import game.MarketSim;
import game.Reports;

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
public class GuiFinalSummary extends JPanel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1782395578247439970L;
	private String stats = "";
	private String stats2 = "";
	private String stats3 = "";
	private String stats4 = "";
	private String stats5 = "";
	private String stats6 = "";
	public GuiFinalSummary() {

	}
	// Getter and setter methods for data
	
	/**
	 * getStats()- Returns data for summary display
	 * 
	 * @return stats 
	 */
	public String getStats(){
		return stats;
	}
	/**
	 * Sets stats for summary display
	 * 
	 * @param newStats
	 *           
	 */
	public void setStats(String newStats){
		stats = newStats;
	}
	/**
	 * getStats2()- Returns data for summary display
	 * 
	 * @return stats2 
	 */
	public String getStats2(){
		return stats2;
	}
	/**
	 * Sets stats2 for summary display
	 * 
	 * @param newStats2
	 *           
	 */
	public void setStats2(String newStats2){
		stats2 = newStats2;
	}
	/**
	 * getStats3()- Returns data for summary display
	 * 
	 * @return stats3 
	 */
	public String getStats3(){
		return stats3;
	}
	/**
	 * Sets stats3 for summary display
	 * 
	 * @param newStats3
	 *           
	 */
	public void setStats3(String newStats3){
		stats3 = newStats3;
	}
	/**
	 * getStats4()- Returns data for summary display
	 * 
	 * @return stats4 
	 */
	public String getStats4(){
		return stats4;
	}
	/**
	 * Sets stats4 for summary display
	 * 
	 * @param newStats4
	 *           
	 */
	public void setStats4(String newStats4){
		stats4 = newStats4;
	}
	/**
	 * getStats5()- Returns data for summary display
	 * 
	 * @return stats5 
	 */
	public String getStats5(){
		return stats5;
	}
	/**
	 * Sets stats5 for summary display
	 * 
	 * @param newStats5
	 *           
	 */
	public void setStats5(String newStats5){
		stats5 = newStats5;
	}
	/**
	 * getStats6()- Returns data for summary display
	 * 
	 * @return stats6 
	 */
	public String getStats6(){
		return stats6;
	}
	/**
	 * Sets stats6 for summary display
	 * 
	 * @param newStats6
	 *           
	 */
	public void setStats6(String newStats6){
		stats6 = newStats6;
	}
	
	//Setting up all possible outcomes
	/**
	 * outcome1()- Returns custom reports for summary display
	 * 
	 * @return outcome1 
	 */
	
	public String outcome1(){
		String outcome1 = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "Well... I mean, what can really be said? Other than that you've\n"
				+ "officially DECIMATED the stock market. Did you cheat? Haha, just kidding.\n"
				+ "(But did you?). Since you've established the highest level of proficiency\n"
				+ "here, try out the real life version. See what happens.");
		return outcome1;
	}
	/**
	 * outcome2()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome2(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "VERY nice job. No sarcasm there. It looks like you've consistently \n"
				+ "managed to make a hefty profit, without showing much of any regression at all.\n"
				+ "Think you're ready for the big times? Maybe you are. Maybe you want to try again,\n"
				+ "get the best possible outcome. Your call. You've done quite the amazing job here\n.");
		return outcome;
	}
	/**
	 * outcome3()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome3(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "You've turned a pretty good profit here. However, this does not nessecarily mean\n"
				+ "that you will be able to do this in the long run, consistently. Maybe you got lucky.\n"
				+ "Being honest, that seems unlikely, but we can't know for sure. Try running the \n"
				+ "simulation again. For a lot longer this time.");
		return outcome;
	}
	/**
	 * outcome4()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome4(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "Not a bad run. Quite exceptional, actually. You've managed to turn a great profit,\n"
				+ "consistently, day after day. Can't really just be luck :). So, very good run here, \n"
				+ "but maybe you can do better. The only person that can confirm that is you.");
		return outcome;
	}
	/**
	 * outcome5()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome5(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "Solid simulation. You got some money in the bank. However, didn't play for so long, \n"
				+ "did you? Not even two years. I'm not going to say that you wouldn't be able to\n"
				+ "keep up this pace, but we'll really never know, will we? Actually, we can, if \n"
				+ "you run the simulation again. For a lot longer, this time.");
		return outcome;
	}
	/**
	 * outcome6()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome6(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "Nice job here. You turned a solid profit. Not anything AMAZING, mind you, but\n"
				+ "definetly not bad either. You're on the upper edge of proficiency, on the cusp\n"
				+ "of being able to do something great. Try again. See if you can become great.\n");
		return outcome;
	}
	/**
	 * outcome7()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome7(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "Well, obviously this wasn't too bad. You turned a profit. Not a massive one, \n"
				+ "but enough for this whole thing not to be a big waste of time. With that said,\n"
				+ "this wasn't anything impressive. Run the simulation again. See if you can make \n"
				+ "it impressive.");
		return outcome;
	}
	/**
	 * outcome8()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome8(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "So you've ended up with more money than you've started with. Not a whole lot\n"
				+ "more, but it's something. Obviously, it could have gone better. Not saying you\n"
				+ "did inherently bad, just not really good at all. You can do better, can't you? \n"
				+ "Try again.");
		return outcome;
	}
	/**
	 * outcome9()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome9(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "From the looks of it, you ended up not doing much of anything at all.\n"
				+ "You did end up turning a profit, or at the least didn't lose any money,\n"
				+ "but would it have been worth the time spent? Maybe. It's practice after all.\n"
				+ "Try again, see if you can do better.");
		return outcome;
	}
	/**
	 * outcome10()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome10(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "You didn't do great. It wasn't a disaster, but it wasn't good either. \n"
				+ "Emphasis on \"wasnt good\". You ended up losing money. Albeit, not too\n"
				+ "much, but enough to warrant this as not a great use of time... "
				+ "Practice a lot more before trying this in real life. \n");
		return outcome;
		
	}
	/**
	 * outcome11()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome11(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "Definetly not a good run here. I'll say it: You lost a lot of money. This\n"
				+ "is obviously never a good thing. I wouldn't say this is enough to sink you\n"
				+ "financially, but it's not going to help you either. A LOT more practice is\n"
				+ "needed here.");
		return outcome;
	}
	/**
	 * outcome12()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome12(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "Ouch... Not the best outcome, eh? In fact, it was abysmal. You're out of a\n"
				+ "TON of money. Maybe you make a lot of off your day job. Hopefully so, \n"
				+ "you're going to need it. Practice some more.");
		return outcome;
	}
	/**
	 * outcome13()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome13(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "Yeah, this was bad. You lost so much money it's painful to think about. \n"
				+ "On top of that, you actually exerted time and effort into losing this money.\n"
				+ "Isn't it usually the other way around? If this happened in real life, your\n"
				+ "stock skills would be the least of your worries. Maybe you got unlucky, who\n"
				+ "knows. What we do know is you need to make drastic changes to your strategies.\n");
		return outcome;
	}
	/**
	 * outcome14()- Returns custom reports for summary display
	 * 
	 * @return outcome
	 */
	public String outcome14(){
		String outcome = ("Analysis:\n"
				+ "----------------------------------------------------------------------\n"
				+ "I don't know how you managed to do this. You might need to get a second job.\n"
				+ "Maybe a third. Unless, you were extremely rich from the beggining, you should\n"
				+ "probably declare bankruptcy.");
		return outcome;
	}
	
	/**
	 * @param panel
	 *            the panel to display the components
	 * @return the populated panel
	 */
	public JPanel init(JPanel panel) {
		
		panel.removeAll();
		panel.setLayout(new BorderLayout());
		//Parsing and converting nessecary data(it is a lot). 
		double dblGain = Double.parseDouble(stats);
		double dblDays = Double.parseDouble(stats3);
		double perDay = dblGain/dblDays;
		double perDayRounded = Math.round(perDay*100.00)/100.00;
		String strPerDay = Double.toString(perDayRounded);
		String strPerDayAdj = "";
		if (perDay>0.0){
			strPerDayAdj = ("gained " + strPerDay.substring(1));
		}
		else{
			strPerDayAdj = ("lost " + strPerDay.substring(1));
		}
		double finalScore = (perDayRounded * (dblDays/100));
		double finalScoreRounded = Math.round(finalScore*100.00)/100.00;
		double endMoney = Double.parseDouble(stats) + Double.parseDouble(stats4);
		int intEndMoney = (int)endMoney;
		String strEndMoney = Integer.toString(intEndMoney);
		double dblPctGain = Double.parseDouble(stats5);
		double dblPctGainRounded = Math.round(dblPctGain*100.00)/100.00;
		String dblPctGainStr = Double.toString(dblPctGainRounded);
		// Setting up title
		JLabel title = new JLabel();
		title.setText("<html> SIMULATION HAS ENDED <br> ------------------------------<br> <html>");
		title.setFont(new Font("MS Gothic", Font.BOLD, 45));
		// Setting up Summary
		JTextArea summary = new JTextArea();
		summary.setText("FINAL SUMMARY:\n\n\n"
				+ "----------------------------------------------------------------\n\n"
				+ "The Date you started on was " + stats2 + ".\n\n"
				+ "----------------------------------------------------------------\n\n"
				+ "Since then, it has been " + stats3 + " days.\n\n"
				+ "----------------------------------------------------------------\n\n"
				+ "You started off with " + stats4 + " dollars in the bank. \n\n"
				+ "----------------------------------------------------------------\n\n"
				+ "Your net worth is now " + strEndMoney + " dollars.\n\n"
				+ "----------------------------------------------------------------\n\n"
				+ "You've gained " + dblPctGainStr + "% of your original bank balance.\n\n"
				+ "----------------------------------------------------------------\n\n"
				+ "For each simulated day, you've " + strPerDayAdj + " $\n\n"
				+ "----------------------------------------------------------------\n\n"
				+ "Your final score is " + finalScoreRounded + " (See scores+analysis)\n\n"
				+ "----------------------------------------------------------------\n\n");
		
		summary.setFont(new Font("MS Gothic", Font.BOLD, 13));
		summary.setBackground(GuiWindow.COLOR1);
		//Setting up List
		JTextArea list = new JTextArea();
		list.setBackground(GuiWindow.COLOR3);
		list.setFont(new Font("MS Gothic", Font.BOLD, 13));
		list.setText("Investments made/\n "
				+ "Still owned:\n " 
				+ "------------------\n"
				+ stats6
				+ "------------------\n");
		//Setting up Scores	
		JTextArea scores = new JTextArea();
		scores.setText("Scores:        \n"
				+ "--------\n"
				+ ">10000.00:\n"
				+ "Stock God\n\n"
				+ ">5000.00:\n"
				+ "Stock master\n\n"
				+ ">1000.00:\n"
				+ "Stock expert\n\n"
				+ ">500.00:\n"
				+ "Proficient\n\n"
				+ ">100.00:\n"
				+ "Adequate\n\n"
				+ ">0.00:\n "
				+ "Neutral\n\n"
				+ "<0.00\n"
				+ "Neutral\n\n"
				+ "<-100.00:\n"
				+ "Amateur\n\n"
				+ "<-500.00:\n"
				+ "Incompetent\n\n"
				+ "<-1000.00:\n"
				+ "Appaling\n\n"
				+ "<-5000.00:\n"
				+ "Disaster\n\n"
				+ "<-10000.00:\n"
				+ "...how?");
		scores.setBackground(new Color(193,221,230));
		scores.setFont(new Font("MS Gothic", Font.BOLD, 12));
		// Setting up the report
		JTextArea report = new JTextArea();
		report.setBackground(new Color(212,212,144));
		report.setFont(new Font("MS Gothic", Font.BOLD, 15));
		if (finalScoreRounded>10000.00){
			report.setText(outcome1());
		}
		else if ((finalScoreRounded>=5000.00 && finalScoreRounded<10000.00)&&(dblDays>500.00)){
			report.setText(outcome2());
		}
		else if ((finalScoreRounded>=5000.00 && finalScoreRounded<10000.00)&&(dblDays<500.00)){
			report.setText(outcome3());
		}
		else if ((finalScoreRounded>=2500.00 && finalScoreRounded<5000.00)&&(dblDays>500.00)){
			report.setText(outcome4());
		}
		else if ((finalScoreRounded>=2500.00 && finalScoreRounded<5000.00)&&(dblDays<500.00)){
			report.setText(outcome5());
		}
		else if ((finalScoreRounded>=1000.00 && finalScoreRounded<2500.00)){
			report.setText(outcome6());
		}
		else if ((finalScoreRounded>=500.00 && finalScoreRounded<1000.00)){
			report.setText(outcome7());
		}
		else if ((finalScoreRounded>=100.00 && finalScoreRounded<500.00)){
			report.setText(outcome8());
		}
		else if ((finalScoreRounded>=0.00 && finalScoreRounded<100.00)){
			report.setText(outcome9());
		}
		else if ((finalScoreRounded>=-100.00 && finalScoreRounded<0.00)){
			report.setText(outcome10());
		}
		else if ((finalScoreRounded>=-500.00 && finalScoreRounded<-100.00)){
			report.setText(outcome11());
		}
		else if ((finalScoreRounded>=-1000.00 && finalScoreRounded<-500.00)){
			report.setText(outcome12());
		}
		else if ((finalScoreRounded>=-5000.00 && finalScoreRounded<10000.00)){
			report.setText(outcome13());
		}
		else{
			report.setText(outcome14());
		}
		
		//Display
		panel.add(title, BorderLayout.NORTH);
		panel.add(summary, BorderLayout.CENTER);
		panel.add(report, BorderLayout.SOUTH);
		panel.add(list, BorderLayout.EAST);
		panel.add(scores, BorderLayout.WEST);
		return panel;
	}
	
	

}
