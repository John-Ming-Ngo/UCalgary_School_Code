
//package project;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

/**
 * The class of precious metals extending the Investment class
 * 
 * @author
 * 
 * 
 */
public class BitCoin extends Investment {
	
	public static void main(String[] args) throws IOException {

        
        BitCoin bcoin = new BitCoin("2012-02-01", 7, 52);
        
        double[] phist = bcoin.getPriceHistory();
        int index = 0;
        for(double value: phist) {
			System.out.println(index + ":" + value);
			index++;
		}

        //pmetal.loadPrice(Metal.GOLD, "2008-02-01", 7, 52);
       
    }

	// public static final int MAX_INDEX = 300;
	public static final String FILENAME = "bitcoin_prices.csv";
	public static final String DATE_FORMAT = "yyyy-mm-dd";


	public BitCoin (int quantity, double currentUnitPrice, double[] priceHistory) {
		setCurrentUnitPrice(currentUnitPrice);
		setQuantity(quantity);

	}

	public BitCoin(String startDate, int interval, int numberOfIntervals) {
		
		setCurrentUnitPrice(0);
		setQuantity(0);
		int status = loadPrice(startDate, interval, numberOfIntervals);

	}

	public BitCoin(String startDate, int interval, int numberOfIntervals, int index) {

		setCurrentUnitPrice(0);
		setQuantity(0);
		int status = loadPrice(startDate, interval, numberOfIntervals);
		updatePrice(index);

	}

	public BitCoin(PreciousMetal metalToCopy) {
		this(metalToCopy.getQuantity(), metalToCopy.getCurrentUnitPrice(),
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
	public String calculateEndDate(String startdate, int interval, int numberOfIntervals) {
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

		//dates converted to milliseconds after epoch
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

						//if column is empty fill with previous value
						if (token[column].equals(null) || token[column].equals("")) {
							list.add(previousline);
						}
						else {
							list.add(array[index_i]);
							previousline = array[index_i];
						}
					}
					else {
						previousline = array[index_i];
					}		
				} catch (Exception e) {
					System.out.print(index_i);
					System.out.println(e);
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
	public boolean isValidDate(String startdate, int interval, int numberOfIntervals) {

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
	 * 
	 */

	public int loadPrice(String startdate, int interval, int numberOfIntervals) {

		int status = 0;

		// dates can be in format of yyyy-mm-dd

		ArrayList<Double> tempList = new ArrayList<Double>();
		String[] lines = new String[numberOfIntervals * interval];
		int linesToSkip = interval - 1;
		int column = 1;
		


		//determines if the end date is beyond todays date
		if (isValidDate(startdate, interval, numberOfIntervals)) {
			String enddate = calculateEndDate(startdate, interval, numberOfIntervals);

			Scanner inputStream = null;

			try {
				//open csv data file for reading
				inputStream = new Scanner(new File(FILENAME));

				// throw away first 5 line headings
				//~ for (int count = 0; count < 5; count++) {
					//~ inputStream.nextLine();
				//~ }

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
				//fill in days with no data - replace with last value
				lines = fillData(lines, column);

				//create the list of values from the raw data
				for (int index_i = 0; index_i < lines.length; index_i++) {

					if (lines[index_i] != null) {
						String[] token = lines[index_i].split(",");
						tempList.add(Double.parseDouble(token[column]));
						index_i += linesToSkip;
					}
					status = 1;
				}
			} catch (IOException e) {
				System.out.println("Error opening and reading file:" + e);
				status = 3;
			} catch (Exception e) {
				System.out.println("An Error has occured reading file:" + FILENAME);
				status = 0;
			}
		} else {
			status = 2;
		}

		if (tempList.size() < numberOfIntervals) {
			status = 2;
		}

		// set the each element of priceHistory from data
		setPriceHistory(new double[tempList.size()]);
		for (int count = 0; count < tempList.size(); count++) {
			setPriceHistory(count, (double) tempList.get(count));
		}

		return status;
	}
	
		/**
	 * Calculate number of days between 2 dates
	 * 
	 */

	private int daysBetween(String startdate, String enddate) {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);
		Date date1 = null;
		Date date2 = null;


		//dates converted to milliseconds after epoch
		try {
			date1 = simpleDateFormat.parse(startdate);
			date2 = simpleDateFormat.parse(enddate);
		}
		catch (Exception e) {
			//exception caught
		}
		// number of milliseconds in one day is 1000 * 60 * 60 * 24
		// (milliseconds * seconds * minutes * hours)
		return (int) ((date2.getTime() - date1.getTime()) / (1000 * 60 * 60 * 24));
	}

}
