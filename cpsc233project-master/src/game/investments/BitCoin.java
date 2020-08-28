package game.investments;

//package project;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

/**
 * The class of precious metals extending the Investment class
 * 
 * @author Team 13
 * 
 * 
 */
public class BitCoin extends Investment {

	public static final int FAILED_NOT_ENOUGH_DATA = 2;
	public static final int FAILED_FILE_NOT_FOUND = 3;
	public static final int SUCCESS = 1;
	public static final int FAILED_UNKNOWN = 0;
	public static final String FILENAME = "resources" + File.separator + "bitcoin_prices.csv";
	public static final String DATE_FORMAT = "yyyy-M-d";
	public static final String INVESTMENT_TYPE = "BITCOIN";

	public BitCoin(int quantity, double currentUnitPrice, double[] priceHistory) {
		setCurrentUnitPrice(currentUnitPrice);
		setQuantity(quantity);
		setInvestmentType(INVESTMENT_TYPE);

	}

	public BitCoin(PreciousMetal bitcoinToCopy) {
		this(bitcoinToCopy.getQuantity(), bitcoinToCopy.getCurrentUnitPrice(), bitcoinToCopy.getPriceHistory());
	}

	public BitCoin(String startDate, int interval, int numberOfIntervals) throws IOException {
		this(startDate, interval, numberOfIntervals, 0, 0);
	}

	public BitCoin(String startDate, int interval, int numberOfIntervals, int index) throws IOException {
		this(startDate, interval, numberOfIntervals, index, 0);
	}

	// PRIMARY USE: LOADING FROM A SAVE
	public BitCoin(String startDate, int interval, int numberOfIntervals, int index, int quantity) throws IOException {
		setName("BitCoin");
		setCurrentUnitPrice(0);
		setQuantity(quantity);
		loadPrice(startDate, interval, numberOfIntervals);
		updatePrice(index);
		setInvestmentType(INVESTMENT_TYPE);
	}

	/**
	 * Calculates the ending date
	 * 
	 * @param startdate
	 * @param interval
	 * @param numberOfIntervals
	 * @return the end date of the period
	 */
	private String calculateEndDate(String startdate, int interval, int numberOfIntervals) {
		String date = "";

		Calendar endDate = Calendar.getInstance();

		// find the end date calculated with the intervals
		String[] tempstr = startdate.split("-");
		endDate.set(Integer.parseInt(tempstr[0]), Integer.parseInt(tempstr[1]), Integer.parseInt(tempstr[2]));
		endDate.add(Calendar.DATE, interval * numberOfIntervals + 60);

		date = endDate.get(Calendar.YEAR) + "-" + endDate.get(Calendar.MONTH) + "-" + endDate.get(Calendar.DATE);

		return date;
	}

	/**
	 * @param startdate
	 * @param enddate
	 * @param currentdate
	 * @return true if currentdate is between the startdate and enddate
	 */
	private boolean dateBetween(String startdate, String enddate, String currentdate) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);
		Date date1;
		Date date2;
		Date date3;

		// dates converted to milliseconds after epoch
		try {
			date1 = simpleDateFormat.parse(startdate);
			date2 = simpleDateFormat.parse(enddate);
			date3 = simpleDateFormat.parse(currentdate);

			return ((date3.getTime() > date1.getTime()) && (date3.getTime() < date2.getTime()));
		} catch (Exception e) {
			System.out.println("Error determining dates");
		}

		return false;
	}

	/**
	 * Cleans up the null values in array fills in gaps of dates in the array.
	 * This uses the value of the date and if any days are missing such as
	 * weekends or holidays, it writes the previous data to that day.
	 * 
	 * @param array
	 *            the array of strings to fill in the data
	 * @return array of data with all missing data for the dates filled in
	 */
	private String[] fillData(String[] array, int column) {

		ArrayList<String> list = new ArrayList<String>();
		String previousline = null;

		// loop through array and fill in data for any missing dates. The actual
		// date doesn't matter only
		// that the data for the date exists in order to iterate correctly with
		// the intervals
		for (int index_i = 0; index_i < array.length; index_i++) {

			if (array[index_i] != null) {
				String[] token = array[index_i].split(",");

				try {
					if (index_i > 0) {

						// if column is empty fill with previous value
						if (token[column].equals(null) || token[column].equals("")) {
							list.add(previousline);
						} else {
							list.add(array[index_i]);
							previousline = array[index_i];
						}
					} else {
						previousline = array[index_i];
					}
				} catch (IndexOutOfBoundsException iob) {
					throw new IndexOutOfBoundsException("Error Processing Array Data");
				}
			}
		}

		String[] outputList = list.toArray(new String[list.size()]);

		return outputList;
	}

	/**
	 * 
	 * Determines if the end date is prior to todays current date
	 * 
	 * @param startdate
	 * @param interval
	 * @param numberOfIntervals
	 * @return true if the date is prior to todays date
	 */
	private boolean isValidDate(String startdate, int interval, int numberOfIntervals) {

		// get todays date
		Calendar today = Calendar.getInstance();

		// compare dates with end date
		Calendar endDate = Calendar.getInstance();

		// find the end date calculated with the intervals
		String[] tempstr = startdate.split("-");
		endDate.set(Integer.parseInt(tempstr[0]), Integer.parseInt(tempstr[1]), Integer.parseInt(tempstr[2]));
		endDate.add(Calendar.DATE, interval * numberOfIntervals + 60);

		return endDate.before(today);
	}

	/**
	 * loadPrice - get data from internet source as csv file
	 * 
	 * @param startdate
	 *            - date to get the data
	 * @param interval
	 *            - length of interval in days
	 * @param numberOfIntervals
	 *            - Number of intervals
	 * @return status, 0-failure, 1-successful, 2-not enough data, 3-Error
	 *         Opening Web Page, 4-date extends into the future
	 * @throws IOException
	 * 
	 */

	public int loadPrice(String startdate, int interval, int numberOfIntervals) throws IOException {

		int status = FAILED_UNKNOWN;

		// dates can be in format of yyyy-mm-dd

		ArrayList<Double> tempList = new ArrayList<Double>();
		String[] lines = new String[numberOfIntervals * interval];
		int linesToSkip = interval - 1;
		int column = 1;

		// determines if the end date is beyond todays date
		if (isValidDate(startdate, interval, numberOfIntervals)) {
			String enddate = calculateEndDate(startdate, interval, numberOfIntervals);

			Scanner inputStream = null;

			try {
				// open csv data file for reading
				inputStream = new Scanner(new File(FILENAME));

				// throw away first 5 line headings
				for (int count = 0; count < 5; count++) {
					inputStream.nextLine();
				}

				// read all input lines into array put into array all dates that
				// are between
				// start and end dates
				int index = 0;
				while (inputStream.hasNext() && index < lines.length) {
					String currentLine = inputStream.nextLine();
					String[] token = currentLine.split(",");
					String currentdate = (String) token[0];

					if (dateBetween(startdate, enddate, currentdate)) {
						lines[index] = currentLine;
						index++;
					}
				}
				inputStream.close();

				// clean/supplement the data
				// fill in days with no data - replace with last value
				lines = fillData(lines, column);

				// populate the list of values
				for (int index_i = 0; index_i < lines.length; index_i++) {
					if (lines[index_i] != null) {
						String[] token = lines[index_i].split(",");

						if (!token[column].equals(""))
							tempList.add(Double.parseDouble(token[column]));
						else
							tempList.add(0.0);

						index_i += linesToSkip;
					}
					status = SUCCESS;
				}
			} catch (FileNotFoundException e) {
				status = FAILED_FILE_NOT_FOUND;
				throw new FileNotFoundException(FILENAME + " not found");
			}

		} else {
			status = FAILED_NOT_ENOUGH_DATA;
		}

		if (tempList.size() < numberOfIntervals) {
			status = FAILED_NOT_ENOUGH_DATA;
		}

		// set the each element of priceHistory from data
		setPriceHistory(new double[tempList.size()]);
		for (int count = 0; count < tempList.size(); count++) {
			setPriceHistory(count, (double) tempList.get(count));
		}

		return status;
	}

}
