package game;

import java.util.Scanner;

public class MarketSimUtils {


	/**
	 * getValidInput - get a user valid user string
	 * 
	 * @param message
	 *            - input message
	 * @param validRegex
	 *            - options to validate as a regex
	 * @return userInput
	 * 
	 */
	public static String getValidInput(String message, String validRegex) {

		String userInput = "";

		Scanner keyboard = new Scanner(System.in);
		boolean isValid = false;

		// get user input and validate against the valid Regex.
		while (!isValid) {
			System.out.printf("%s", message);
			userInput = keyboard.next();

			if (userInput.matches(validRegex)) {
				isValid = true;
			} else {
				System.out.println("Input is invalid!");
			}
		}

		keyboard.close();
		return userInput;
	}

	/**
	 * getValidInt - get a user integer and validate from 1 through number of
	 * options
	 * 
	 * @param message
	 *            - input message
	 * @return userInput
	 * 
	 */
	public static int getValidInt(String message) {

		String userInput = "";
		int number = 0;

		Scanner keyboard = new Scanner(System.in);
		boolean validInput = false;
		String validRegex = ("[0-9]*");

		// get user input and validate against the bounds
		while (!validInput) {
			System.out.print(message);
			userInput = keyboard.next();

			// validates integer
			if (userInput.matches(validRegex)) {
				number = Integer.parseInt(userInput);
				validInput = true;
			} else {
				System.out.println("Please enter an integer!\n\n");
			}
		}
		
		keyboard.close();
		return number;
	}// getValidInt

	/**
	 * getValidInt - get a user integer and validate from 1 through number of
	 * options
	 * 
	 * @param message
	 *            - input message
	 * @param lowerbound
	 *            - lower bound of integer
	 * @param upperbound
	 *            - upper bound of integer
	 * @return userInput
	 * 
	 */
	@SuppressWarnings("resource")
	public static int getValidInt(String message, int lowerbound, int upperbound) {

		String userInput = "";
		int number = 0;

		Scanner keyboard = new Scanner(System.in);
		boolean validInput = false;
		String validRegex = ("[0-9]*");

		// get user input and validate against the bounds
		while (!validInput) {
			System.out.print(message);
			userInput = keyboard.next();

			// validates integer
			if (userInput.matches(validRegex)) {
				number = Integer.parseInt(userInput);

				// check if integer is within bounds
				if (number <= upperbound && number >= lowerbound) {
					validInput = true;
				} else {
					System.out.println("Input is invalid!\n\n");
				}
			} else {
				System.out.println("Please enter an integer!\n\n");
			}
		}
		// debug
		// System.out.println("[getValidInt number]"+number);
		return number;
	}// getValidInt

	/**
	 * Create newlines in string at approximately the length given. Finds next
	 * whitespace after the length given and inserts a newline there
	 * 
	 * @param stringIn
	 *            raw string in
	 * @param lengthToWrap
	 *            the approximate length of where to insert newline character
	 * @return the string with new lines inserted
	 */
	public static String wrapString(String stringIn, int lengthToWrap) {

		char[] charString = stringIn.toCharArray();

		// start at the desired length and find next whitespace. Insert newline
		// character at whitespace and increase index by length.
		for (int index = lengthToWrap; index < charString.length; index++) {
			if (Character.isWhitespace(charString[index])) {
				charString[index] = '\n';
				index += lengthToWrap;
			}
		}

		return new String(charString);

	}

}
