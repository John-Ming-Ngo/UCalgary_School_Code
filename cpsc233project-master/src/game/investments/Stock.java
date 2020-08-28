package game.investments;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;
import java.net.URL;
import java.net.UnknownHostException;
import java.io.InputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

/**
 * 
 * This stock class extends the investment class and holds methods and fields
 * unique to the stock investment
 * 
 * @author Team 13
 * 
 */
public class Stock extends Investment {

	public static final int FAILED_WEB_PAGE_ERROR = 3;
	public static final int FAILED_NOT_ENOUGH_DATA = 2;
	public static final int SUCCESS = 1;
	public static final int FAILED_UNKNOWN = 0;
	public static final int MAX_INDEX = 364;
	public static final String DATE_FORMAT = "yyyy-M-d";
	private static final int COL_CLOSING_PRICES = 4;
	private static final int COL_DATE = 0;
	public static final String INVESTMENT_TYPE = "STOCK";
	private String stockSymbol;
	private Investment data = new Investment(0, 0, new double[10]);

	/**
	* Constructors
	*/
	public Stock(Stock stockToCopy) {
		this(stockToCopy.getName(), stockToCopy.getSymbol(), stockToCopy.getQuantity(),
				stockToCopy.getCurrentUnitPrice(), stockToCopy.getPriceHistory());
	}

	public Stock(String name, String symbol, int quantity, double price, double[] priceHistory) {
		setName(symbol);
		stockSymbol = symbol;
		setCurrentUnitPrice(price);
		setQuantity(quantity);
		setPriceHistory(priceHistory);
		setInvestmentType(INVESTMENT_TYPE);
	}

	public Stock(String symbol, String startDate, int interval, int numberOfIntervals, int index) throws IOException {
		this(symbol, startDate, interval, numberOfIntervals, index, 0);

	}

	// PRIMARY USE: LOADING FROM A SAVE.
	public Stock(String symbol, String startDate, int interval, int numberOfIntervals, int index, int quantity)
			throws IOException {
		setName(symbol);
		stockSymbol = symbol;
		setCurrentUnitPrice(0);
		setQuantity(quantity);
		scrapePrice(symbol, startDate, interval, numberOfIntervals);
		updatePrice(index);
		setInvestmentType(INVESTMENT_TYPE);

	}

	public Stock(String name, String symbol, String startDate, int interval, int numberOfIntervals) throws IOException {
		this(symbol, startDate, interval, numberOfIntervals, 0, 0);
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
	 * dateBetween determines if the current date is between the start and end
	 * dates
	 * 
	 * @param startdate
	 *            start date
	 * @param enddate
	 *            end date
	 * @param currentdate
	 *            current date to check
	 * @return true if currentdate is between the startdate and enddate
	 */
	private boolean dateBetween(String startdate, String enddate, String currentdate) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);
		Date date1;
		Date date2;
		Date date3;

		try {
			date1 = simpleDateFormat.parse(startdate);
			date2 = simpleDateFormat.parse(enddate);
			date3 = simpleDateFormat.parse(currentdate);

			return ((date3.getTime() > date1.getTime()) && (date3.getTime() < date2.getTime()));
		} catch (Exception e) {
			// exception
		}

		return false;
	}

	/**
	 * Calculate number of days between 2 dates
	 * 
	 */

	private int daysBetween(Date date1, Date date2) {
		// number of milliseconds in one day is 1000 * 60 * 60 * 24
		// (milliseconds * seconds * minutes * hours)
		return (int) ((date2.getTime() - date1.getTime()) / (1000 * 60 * 60 * 24));
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
	private String[] fillData(String[] array) {

		ArrayList<String> list = new ArrayList<String>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);
		Calendar calCurrent = Calendar.getInstance();
		Calendar calPrevious = Calendar.getInstance();

		for (int index_i = 0; index_i < array.length; index_i++) {

			if (array[index_i] != null) {
				String[] token = array[index_i].split(",");

				try {
					if (index_i > 0) {
						Date date = simpleDateFormat.parse(token[0]);
						calCurrent.setTime(date);

						int daysDelta = daysBetween(calPrevious.getTime(), calCurrent.getTime());

						if (daysDelta > 1) {
							for (int index = 1; index < daysDelta; index++) {
								list.add(array[index_i - 1]);
							}
						}
					}

					Date date = simpleDateFormat.parse(token[0]);
					calPrevious.setTime(date);

					list.add(array[index_i]);
				} catch (Exception e) {
					// handle the exception
					System.out.println(e);
				}

			}
		}

		String[] outputList = list.toArray(new String[list.size()]);
		return outputList;
	}

	/**
	 * getCopy
	 * 
	 * @param original
	 *            The stock to copy
	 * @param startDate
	 * @param interval
	 * @param numberOfIntervals
	 * @return a copy of the stock
	 * @throws IOException
	 */
	public Investment getCopy(Stock original, String startDate, int interval, int numberOfIntervals)
			throws IOException {
		// it seems the startdate, interval etc are found in stocksim

		Investment copy = new Stock(original.getName(), original.getSymbol(), startDate, interval, numberOfIntervals);

		return copy;
	}

	/**
	 * getDateCode returns a string date code used for scraping data from yahoo
	 * 
	 * @param startDate
	 *            starting date
	 * @param endDate
	 *            ending date
	 * @return the date code
	 */
	private String getDateCode(String startDate, String endDate) {
		String outputString = "";

		Calendar start = Calendar.getInstance();
		Calendar end = Calendar.getInstance();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);

		Date date1 = null;
		Date date2 = null;

		try {
			date1 = simpleDateFormat.parse(startDate);
			date2 = simpleDateFormat.parse(endDate);
		} catch (Exception e) {
			// exception
		}

		start.setTime(date1);
		end.setTime(date2);

		// example of the date code "&a=1&b=19&c=2017&d=2&e=19&f=2017&g=d
		outputString += "&a=" + (start.get(Calendar.MONTH));
		outputString += "&b=" + start.get(Calendar.DATE);
		outputString += "&c=" + start.get(Calendar.YEAR);
		outputString += "&d=" + (end.get(Calendar.MONTH));
		outputString += "&e=" + end.get(Calendar.DATE);
		outputString += "&f=" + end.get(Calendar.YEAR);
		outputString += "&g=d";

		return outputString;
	}

	/**
	 * getSymbol- Returns the symbol of the stock
	 * 
	 * @return the stock symbol
	 */
	public String getSymbol() {
		return stockSymbol;
	}

	/**
	 * Invert Array inverts the array and removes null values from the start of
	 * the array
	 * 
	 * @param array
	 *            the array to invert
	 * @return inverted array
	 */
	private String[] invertArray(String[] array) {
		String[] processedArray = new String[array.length];

		int index = 0;
		for (int count = array.length - 1; count > 0; count--) {
			if (array[count] != null) {
				processedArray[index] = array[count];
				index++;
			}
			// System.out.println(count + ":" + array[count]);
		}

		return processedArray;
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
	 * scrapeData - get data from internet source as csv file
	 * 
	 * @param symbol
	 *            - the stock symbol
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

	public int scrapePrice(String symbol, String startdate, int interval, int numberOfIntervals) throws IOException {

		int status = FAILED_UNKNOWN;

		// ~
		// http://chart.finance.yahoo.com/table.csv?s=BMO.TO&a=1&b=19&c=2017&d=2&e=19&f=2017&g=d&ignore=.csv

		// ~ s= xxx.TO for canadian exchange
		// ~ NASDAQ needs only symbol ie MSFT or AAPL
		// ~ NYSE needs only symbol
		// ~ a - endmonth starts at 0 for jan thru 11 for dec
		// ~ b - end day - the day
		// ~ c - end year
		// ~ d - start month starts at 0 for jan
		// ~ e - start day
		// ~ f - start year
		// ~ g=d - I think this means daily
		// ~ column g is the close (6)

		ArrayList<Double> tempList = new ArrayList<Double>();
		String[] lines = new String[numberOfIntervals * interval];
		// double[] price = new double[numberOfIntervals + 12];
		int linesToSkip = interval - 1;

		if (isValidDate(startdate, interval, numberOfIntervals)) {
			String enddate = calculateEndDate(startdate, interval, numberOfIntervals);

			String stockURL = "http://chart.finance.yahoo.com/table.csv?s=" + symbol + getDateCode(startdate, enddate)
					+ "&ignore=.csv";

			// open url as an input stream to read
			try {
				URL url = new URL(stockURL);
				InputStream webStream = url.openStream();

				// open webinput as an input steam
				Scanner webInput = new Scanner(webStream);

				// throw away first line headings
				webInput.nextLine();

				// read all input lines into array
				int index = 0;
				while (webInput.hasNext() && index < lines.length) {

					String currentLine = webInput.nextLine();
					String[] token = currentLine.split(",");
					String currentdate = (String) token[COL_DATE];

					if (dateBetween(startdate, enddate, currentdate)) {
						lines[index] = currentLine;
						index++;
					}
				}

				webInput.close();

				// fill in days with no data - replace with last value
				lines = invertArray(lines);
				lines = fillData(lines);

				// populate the list of values
				for (int index_i = 0; index_i < lines.length; index_i++) {
					if (lines[index_i] != null) {
						String[] token = lines[index_i].split(",");
						tempList.add(Double.parseDouble(token[COL_CLOSING_PRICES]));
						index_i += linesToSkip;
					}
					status = SUCCESS;
				}
			} catch (UnknownHostException uhe) {
				throw new UnknownHostException("Error opening and reading web data. Check your internet connection.");
			} catch (IOException ioe) {
				status = FAILED_WEB_PAGE_ERROR;
				throw new IOException("Error reading web data. Stock symbol may be incorrect or does not exist.");
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