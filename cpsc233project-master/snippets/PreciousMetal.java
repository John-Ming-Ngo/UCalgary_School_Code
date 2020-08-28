
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
public class PreciousMetal extends Investment {
	public enum Metal {
		GOLD, SILVER, PLATINUM, PALLADIUM
	}
	
	public static void main(String[] args) throws IOException {

        
        PreciousMetal pmetal = new PreciousMetal(Metal.GOLD, "2010-02-01", 7, 52);

        //pmetal.loadPrice(Metal.GOLD, "2008-02-01", 7, 52);
                double[] phist = pmetal.getPriceHistory();
        int index = 0;
        for(double value: phist) {
			System.out.println(index + ":" + value);
			index++;
		}

       
    }

	// public static final int MAX_INDEX = 300;
	public static final String FILENAME = "londonfixes.csv";
	public static final String DATE_FORMAT = "yyyy-M-d";
	private Metal type;

	public Investment data = new Investment(0, 0, new double[10]);

	public PreciousMetal(Metal type, int quantity, double currentUnitPrice, double[] priceHistory) {

		setType(type);
		setCurrentUnitPrice(currentUnitPrice);
		setQuantity(quantity);

	}
	
		public PreciousMetal(Metal type, String startDate, int interval, int numberOfIntervals) {

		setType(type);
		int status = loadPrice(type, startDate, interval, numberOfIntervals);
		setQuantity(0);
		updatePrice(0);


	}

	public PreciousMetal(Metal type, String startDate, int interval, int numberOfIntervals, int index) {

		this.type = type;
		setCurrentUnitPrice(0);
		setQuantity(0);
		int status = loadPrice(type, startDate, interval, numberOfIntervals);
		updatePrice(index);

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
	public String calculateEndDate(String startdate, int interval, int numberOfIntervals) {
		String date = "";

		Calendar endDate = Calendar.getInstance();

		// find the end date calculated with the intervals
		String[] tempstr = startdate.split("-");
		endDate.set(Integer.parseInt(tempstr[0]), Integer.parseInt(tempstr[1]), Integer.parseInt(tempstr[2]));
		endDate.add(Calendar.DATE, interval * numberOfIntervals + 1);

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
	 * getSymbol- Returns the symbol of the stock
	 * 
	 * @param void
	 * @return void
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

	public int loadPrice(Metal type, String startdate, int interval, int numberOfIntervals) {

		int status = 0;

		// dates can be in format of yyyy-mm-dd

		ArrayList<Double> tempList = new ArrayList<Double>();
		String[] lines = new String[numberOfIntervals * interval];
		int linesToSkip = interval - 1;
		int column;

		switch (type) {

		case GOLD:
			column = 2;
			break;

		case SILVER:
			column = 3;
			break;

		case PLATINUM:
			column = 5;
			break;

		case PALLADIUM:
			column = 7;
			break;

		default:
			column = 2;
			System.out.println("Type not defined");

		}

		if (isValidDate(startdate, interval, numberOfIntervals)) {
			String enddate = calculateEndDate(startdate, interval, numberOfIntervals);

	System.out.println("[start]" + startdate + "   [End]" + enddate);

			Scanner inputStream = null;

			try {
				inputStream = new Scanner(new File(FILENAME));

				// throw away first 5 line headings
				for (int count = 0; count < 5; count++) {
					inputStream.nextLine();
				}

				// find first occurrence of date

				// read all input lines into array put into array all dates that
				// are between
				// start and end dates
				int index = 0;
				while (inputStream.hasNext() && index < lines.length) {
					String currentLine = inputStream.nextLine();
					String[] token = currentLine.split(",");
					String currentdate = (String) token[0];
		System.out.print(index + ":" + currentLine + "\n");

					if (dateBetween(startdate, enddate, currentdate)) {
						lines[index] = currentLine;
						index++;
					}
				}
				inputStream.close();
				
				
				System.out.println("Made it here");

				// fill in days with no data - replace with last value
				// clean/supplement the data
				//fill in days with no data - replace with last value
				lines = fillData(lines, column);
				
				System.out.println("Here Too");

				//populate the list of values
				for (int index_i = 0; index_i < lines.length; index_i++) {
					if (lines[index_i] != null) {
						System.out.println(index_i + ":" + lines[index_i]);
						String[] token = lines[index_i].split(",");
						tempList.add(Double.parseDouble(token[column]));
						index_i += linesToSkip;
						
					}
					status = 1;
				}
			} catch (IOException e) {
				System.out.println("Error opening and reading webpage:" + e);
				status = 3;
			} catch (Exception e) {
				System.out.println("An Error has occured:" + e);
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
	 * @param type
	 *            The type of precious metal
	 */
	public void setType(Metal type) {
		this.type = type;

	}

}
