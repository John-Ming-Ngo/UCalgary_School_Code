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
public class PreciousMetal extends Investment {
	public static final int FAILED_UNKNOWN = 0;
	public static final int SUCCESS = 1;
	public static final int FAILED_FILE_NOT_FOUND = 4;
	public static final int FAILED_DATA_ERROR = 3;
	public static final int FAILED_NOT_ENOUGH_DATA = 2;
	private static final int COL_PALLADIUM = 7;
	private static final int COL_PLATINUM = 5;
	private static final int COL_SILVER = 3;
	private static final int COL_GOLD = 2;
	private static final int COL_DATE = 0;


	public enum Metal {
		GOLD, SILVER, PLATINUM, PALLADIUM
	}

	public static final String FILENAME = "resources" + File.separator + "londonfixes.csv";
	public static final String DATE_FORMAT = "yyyy-M-dd";
	public static final String INVESTMENT_TYPE = "METAL";
	private Metal type;

	/**
	* Constructors
	*/
	public PreciousMetal(Metal type, int quantity, double currentUnitPrice, double[] priceHistory) {
		setType(type);
		setName(type.toString());
		setCurrentUnitPrice(currentUnitPrice);
		setQuantity(quantity);
		setInvestmentType(INVESTMENT_TYPE);
	}

	public PreciousMetal(Metal type, String startDate, int interval, int numberOfIntervals)
			throws NumberFormatException, IOException {
		this(type, startDate, interval, numberOfIntervals, 0, 0);
	}

	public PreciousMetal(Metal type, String startDate, int interval, int numberOfIntervals, int index)
			throws NumberFormatException, IOException {
		this(type, startDate, interval, numberOfIntervals, index, 0);

	}

	// PRIMARY USE: LOADING FROM A SAVE
	public PreciousMetal(Metal type, String startDate, int interval, int numberOfIntervals, int index, int quantity)
			throws NumberFormatException, IOException {

		this.type = type;
		setName(type.toString());
		setQuantity(quantity);
		loadPrice(type, startDate, interval, numberOfIntervals);
		updatePrice(index);
		setInvestmentType(INVESTMENT_TYPE);

	}

	public PreciousMetal(PreciousMetal metalToCopy) {
		this(metalToCopy.getType(), metalToCopy.getQuantity(), metalToCopy.getCurrentUnitPrice(),
				metalToCopy.getPriceHistory());
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
			System.out.println("Error parsing dates");
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
				} catch (ArrayIndexOutOfBoundsException aioobe) {
					throw new ArrayIndexOutOfBoundsException();
				}
			}
		}

		String[] outputList = list.toArray(new String[list.size()]);

		return outputList;
	}

	/**
	 * getSymbol- Returns the symbol of the stock
	 * 
	 * @return type of metal
	 * 
	 */
	public Metal getType() {
		return type;
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
	 * @param type
	 *            - the type of metal
	 * @param startdate
	 *            - date to get the data
	 * @param interval
	 *            - length of interval in days
	 * @param numberOfIntervals
	 *            - Number of intervals
	 * @return status, 0-failure, 1-successful, 2-not enough data, 3-Error
	 *         Opening File, 4-date extends into the future
	 * @throws NumberFormatException
	 * @throws IOException
	 * 
	 */

	public int loadPrice(Metal type, String startdate, int interval, int numberOfIntervals)
			throws NumberFormatException, IOException {

		int status = FAILED_UNKNOWN;

		// dates can be in format of yyyy-mm-dd

		ArrayList<Double> tempList = new ArrayList<Double>();
		String[] lines = new String[numberOfIntervals * interval];
		int linesToSkip = interval - 1;
		int column;

		// sets the column to get the data from in the csv file
		switch (type) {
		case GOLD:
			column = COL_GOLD;
			break;
		case SILVER:
			column = COL_SILVER;
			break;
		case PLATINUM:
			column = COL_PLATINUM;
			break;
		case PALLADIUM:
			column = COL_PALLADIUM;
			break;
		default:
			column = COL_GOLD;
			System.out.println("Type not defined");
		}

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
					String currentdate = (String) token[COL_DATE];

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

						// if first column is empty take next available value
						if (!token[column].equals(""))
							tempList.add(Double.parseDouble(token[column]));
						else
							tempList.add(0.0);
						index_i += linesToSkip;
					}
					status = SUCCESS;
				}
			} catch (FileNotFoundException fnfe) {
				status = FAILED_FILE_NOT_FOUND;
				throw new FileNotFoundException(FILENAME + " not found");
			} catch (NumberFormatException nfe) {
				status = FAILED_DATA_ERROR;
				throw new IOException("Data does not exist for this date");
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

	/**
	 * Sets the type of metal
	 * 
	 * @param type
	 *            The type of precious metal
	 */
	public void setType(Metal type) {
		this.type = type;

	}

}
