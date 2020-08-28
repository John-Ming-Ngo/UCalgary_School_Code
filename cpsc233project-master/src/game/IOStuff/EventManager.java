package game.IOStuff;

import java.util.ArrayList;
import java.io.*;
import java.util.Random;

/**
 * This class can read random events from a file called Events.txt.
 *
 * Dependencies: IOManager class.
 * 
 * @author John Ming Ngo (Team 13)
 * @version 1.0.0
 */
public class EventManager extends IOManager {

	private static Random randomGen = new Random();
	private static String FILENAME = "resources/Events.txt";

	private ArrayList<String[]> events = null;

	/**
	 * No parameters, initialize to defaults
	 */
	public EventManager() {
		super(FILENAME);
		events = new ArrayList<String[]>();
	}

	/**
	 * If user-custom events exist.
	 */
	public EventManager(ArrayList<String[]> eventData) {
		super(FILENAME);
		events = new ArrayList<String[]>();
		for (String[] entry : eventData) {
			events.add(entry);
		}
	}

	/**
	 * If user-custom fileName.
	 */
	public EventManager(String fileName) {
		super(fileName);
		events = new ArrayList<String[]>();
	}

	/**
	 * If users already have fileName and event information.
	 */
	public EventManager(String fileName, ArrayList<String[]> eventData) {
		super(fileName);
		events = new ArrayList<String[]>();
		for (String[] entry : eventData) {
			events.add(entry);
		}
	}

	/**
	 * This method loads all the event information in the events.txt file into
	 * active memory - namely, this class' events attribute.
	 *
	 */
	public void load() throws IOException {
		ArrayList<String> fileData = super.load(getFileName());
		for (String entry : fileData) {
			String[] eventInfo = entry.split("[|]");
			events.add(eventInfo);
		}
	}

	/**
	 * This method returns a random event from this class' attributes. It comes
	 * in the form of the event data, and doesn't actually do or implement this
	 * event. That is, it returns the data in the form of an ArrayList<String>.
	 * 
	 * @return randomEvent An ArrayList of Strings corrisponding to the random
	 *         event data, with all labels stripped.
	 */
	public ArrayList<String> randomEvent() throws IOException {
		load();
		int randomNumber = randomGen.nextInt(events.size());
		String[] randomEventRaw = events.get(randomNumber);
		ArrayList<String> randomEvent = new ArrayList<String>();
		for (String position : randomEventRaw) {
			randomEvent.add(extractedInfo(position));
		}
		return randomEvent;
	}
}