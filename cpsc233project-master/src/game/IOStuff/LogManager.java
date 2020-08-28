package game.IOStuff;

import java.util.ArrayList;
import java.time.LocalDateTime;
import java.io.*;

/**
 * This class allows one to record data in the form of strings and then output
 * it in the form of a log file. The generated log will have a file name with a
 * timestamp corresponding to when the class is instantiated.
 *
 * Dependencies: IOManager class.
 * 
 * @author John Ming Ngo (Team 13)
 * @version 1.0.0
 */
public class LogManager extends IOManager {

	/**
	 * Initialize instance variables
	 */
	private ArrayList<String> logData = null;

	/**
	 * Constructors
	 */

	/**
	 * No parameters, initialize to defaults
	 */
	public LogManager() {
		super("Log of " + LocalDateTime.now().toString().replaceAll(":", "-") + ".txt");
		logData = new ArrayList<String>();
	}

	/**
	 * If user-custom logs exist.
	 */
	public LogManager(ArrayList<String> logs) {
		super("Log of " + LocalDateTime.now().toString().replaceAll(":", "-") + ".txt");
		setLogData(logs);
	}

	/**
	 * If user-custom rate information.
	 */
	public LogManager(String date) {
		super("Log of " + date);
		logData = new ArrayList<String>();
	}

	/**
	 * If users already have logs and date information.
	 */
	public LogManager(String date, ArrayList<String> logs) {
		super("Log of " + date);
		setLogData(logs);
	}

	/**
	 * Getters and setters
	 */

	/**
	 * This method adds the given string to the logData ArrayList attribute of
	 * this class. Basically, store each line of your logs here.
	 * 
	 * @param logLine
	 *            A String corresponding to the intended string data to be
	 *            logged.
	 */
	public void addLine(String logLine) {
		logData.add(logLine);
	}

	/**
	 * Getter for log data.
	 * 
	 * @return newLogData An ArrayList<String> corresponding to the data in the
	 *         logs of this class' attribute.
	 */
	public ArrayList<String> getLogData() {
		ArrayList<String> logCopy = new ArrayList<String>();
		for (String entry : logData) {
			logCopy.add(entry);
		}
		return logCopy;
	}

	/**
	 * This method loads log information from a file into active memory.
	 * 
	 */
	public void load() throws IOException {
		logData = super.load(getFileName());
	}

	/**
	 * This method saves the log information as a file.
	 *
	 */
	public void save() throws IOException {
		ensureDirectoryExistance("logs");
		super.save(logData, "logs" + File.separator + getFileName());
	}

	/**
	 * Setter for log data.
	 * 
	 * @param newData
	 *            An ArrayList<String> corresponding to the relevant data
	 */
	public void setLogData(ArrayList<String> newData) {
		logData = new ArrayList<String>();
		for (String entry : newData) {
			logData.add(entry);
		}
	}

}