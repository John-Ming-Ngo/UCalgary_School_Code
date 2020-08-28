/*
*Assignment:    Week 1 Wednesday
*Author:        Jason De Boer
*ID:            30034428
*Email:         jason.deboer1@ucalgary.ca
*
*Revision:      0.1 - 11 Jan 2017
*
*
*Course:        CPSC233
*Instructor:    Prof. Nathaly Verwaal
*
*Description:
*Asks user for 3 integers and prints out the average
*
*Features:
*
*/
//package project;
//import java.util.Date;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;
//import java.util.Scanner;
import java.net.URL;
//import java.net.URLConnection;
import java.io.InputStream;

//import java.io.BufferedReader;
//import java.io.BufferedWriter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


public class Scraperyahoo extends Investment {

    	public static final String DATE_FORMAT = "yyyy-M-d";
	private static final int CLOSING_DATA_COLUMN = 4;

    public static void main(String[] args) throws IOException {

        
        Scraperyahoo myScraper = new Scraperyahoo();
        myScraper.scrapePrice("AC:TO", "2010-02-01", 7, 52);
       
        
	double[] phist = myScraper.getPriceHistory();
        int index = 0;
        for(double value: phist) {
			System.out.println(index + ":" + value);
			index++;
		}
            
    }
    
    	public int scrapePrice(String symbol, String startdate, int interval,
			int numberOfIntervals) {

		int status = 0;
		
		// example better way with symbols
		// http://www.google.com/finance/historical?q=NASDAQ:MSFT&startdate=Jan+28%2C+2016&enddate=Jan+26%2C+2017&num=30&output=csv
		// dates can be in format of yyyy-mm-dd
		
		
		//~ http://chart.finance.yahoo.com/table.csv?s=BMO.TO&a=1&b=19&c=2017&d=2&e=19&f=2017&g=d&ignore=.csv


		//~ s= xxx.TO for canadian exchange

		//~ a - endmonth starts at 0 for jan thru 11 for dec
		//~ b - end day - the day
		//~ c - end year 

		//~ d - start month starts at 0 for jan
		//~ e - start day
		//~ f - start year

		//~ g=d - I think this means daily

		//~ column g is the close (6)

		//~ NASDAQ needs only symbol ie MSFT or AAPL
		//~ NYSE needs only symbol

        
		ArrayList<Double> tempList = new ArrayList<Double>();
		String[] lines = new String[numberOfIntervals * interval];
		double[] price = new double[numberOfIntervals + 12];
		int linesToSkip = interval - 1;

		if (isValidDate(startdate, interval, numberOfIntervals)) {
			String enddate = calculateEndDate(startdate, interval, numberOfIntervals);
	
	System.out.println("[start]" + startdate + "   [end]" + enddate);
	
			//~ String stockURL = "http://www.google.com/finance/historical?q="
					//~ + symbol + "&startdate=" + startdate + "&enddate=" + enddate
					//~ + "&output=csv";
			
			//getDateCode(startdate, enddate);
					
			String stockURL = "http://chart.finance.yahoo.com/table.csv?s="
			+ symbol + getDateCode(startdate, enddate) + "&ignore=.csv";
	
			System.out.println(stockURL);
	
			// open url as an input stream to read
			try {
				URL url = new URL(stockURL); 
				InputStream webStream = url.openStream();
	
System.out.println("[Stream Open]");	
	
				// open webinput as an input steam
				Scanner webInput = new Scanner(webStream);
	
				// throw away first line headings
				webInput.nextLine();
				
				// read all input lines into array
				int index = 0;
				while (webInput.hasNext() && index < lines.length) {
					
					String currentLine = webInput.nextLine();
					String[] token = currentLine.split(",");
					String currentdate = (String) token[0];
//System.out.print(index + ":" + currentLine + "\n");		
					
					if (dateBetween(startdate, enddate, currentdate)) {
						lines[index] = currentLine;
						index++;
					}
				}
				
System.out.println("[Process array]");

                //fill in days with no data - replace with last value
		lines = invertArray(lines);
		
					//debug print lines
				for (int count = 0; count < lines.length; count++) {
					 System.out.println(count + ":" + lines[count]);
				}
		
                lines = fillData(lines);
		
			//debug print lines
				for (int count = 0; count < lines.length; count++) {
					 System.out.println(count + ":" + lines[count]);
				}

				//populate the list of values
				for (int index_i = 0; index_i < lines.length; index_i++) {
					if (lines[index_i] != null) {
						System.out.println(index_i + ":" + lines[index_i]);
						String[] token = lines[index_i].split(",");
						tempList.add(Double.parseDouble(token[CLOSING_DATA_COLUMN]));
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
		}
		
	//setPriceHistory(price);
        //priceHistory = price;
        //price = tempList.toArray(new double[tempList.size()]);
       
       
       System.out.println("[Size of array]"+ tempList.size());
       
	// set the each element of priceHistory from data
	setPriceHistory(new double[tempList.size()]);
	for (int count = 0; count < tempList.size(); count++) {
		setPriceHistory(count, (double) tempList.get(count));
	}
         
            //~ System.out.println("Final Data:");
				//~ for (int count = 0; count < priceHistory.length; count++) {
					 //~ System.out.println(priceHistory[count]);
				//~ }
		
		return status;
	}
    
    public String[] fillData(String[] array){
        
        System.out.println("[fillData]");
        System.out.println("[Array Length]" + array.length);
        
        ArrayList<String> list = new ArrayList<String>();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);
        Calendar calCurrent = Calendar.getInstance();  
        Calendar calPrevious = Calendar.getInstance(); 
            
            for (int index_i = 0; index_i < array.length; index_i++) {


		if (array[index_i] != null) {
			String[] token = array[index_i].split(",");

                        //days between prior
 
                        try {    
                            if (index_i > 0) { 
                             Date date = simpleDateFormat.parse(token[0]);
                             calCurrent.setTime(date);
                             //int daysDelta = daysBetween(calCurrent.getTime(),calPrevious.getTime());
			     int daysDelta = daysBetween(calPrevious.getTime(),calCurrent.getTime());

//System.out.println("Days= "+daysDelta + "     Index:" + index_i);
                             
                             
			     if (daysDelta > 1) {
                                 for (int index = 1; index < daysDelta; index++) {
                                     list.add(array[index_i -1 ]);
                                 }
                             }
                            }
                             
                             Date date = simpleDateFormat.parse(token[0]);
                             calPrevious.setTime(date);

                             list.add(array[index_i]);
                        }
                        catch (Exception e){
                            //handle the exception
                            System.out.println(e);
                        }
                        
                            
					}
            }

               
            String[] outputList = list.toArray(new String[list.size()]);             
        return outputList;
    }
    
    /**
     * Calculate number of days between 2 dates
     * 
     */
    
    public int daysBetween(Date d1, Date d2){
             return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
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
	public boolean isValidDate(String startdate, int interval,
			int numberOfIntervals) {
		
		//get todays date
		Calendar today = Calendar.getInstance();   
		
		//compare dates with end date
		Calendar endDate = Calendar.getInstance();

		// find the end date calculated with the intervals
		String[] tempstr = startdate.split("-");
		endDate.set(Integer.parseInt(tempstr[0]),
				Integer.parseInt(tempstr[1]), Integer.parseInt(tempstr[2]));
		endDate.add(Calendar.DATE, interval * numberOfIntervals + 60);
		
		return endDate.before(today);
	}
    
    	/**
	 * Calculates the ending date
	 * 
	 * @param startdate
	 * @param interval
	 * @param numberOfIntervals
	 * @return the end date of the period
	 */
	public String calculateEndDate(String startdate, int interval,
			int numberOfIntervals) {
		String date = "";
		
		Calendar endDate = Calendar.getInstance();

		// find the end date calculated with the intervals
		String[] tempstr = startdate.split("-");
		endDate.set(Integer.parseInt(tempstr[0]),
				Integer.parseInt(tempstr[1]), Integer.parseInt(tempstr[2]));
		endDate.add(Calendar.DATE, interval * numberOfIntervals + 60);

		date = endDate.get(Calendar.YEAR) + "-"
				+ endDate.get(Calendar.MONTH) + "-"
				+ endDate.get(Calendar.DATE);
   
		
		return date;
	}
	
	public String getDateCode(String startDate, String endDate) {
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
		
		//"&a=1&b=19&c=2017&d=2&e=19&f=2017&g=d
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
	 * @param startdate
	 * @param enddate
	 * @param currentdate
	 * @return true if currentdate is between the startdate and enddate
	 */
	private String[] invertArray(String[] array) {
		String[] processedArray = new String[array.length];
		
			int index = 0;
			for (int count = array.length - 1; count > 0; count--) {
				if ( array[count] != null) {
					processedArray[index] = array[count];
					index++;
				}
				//System.out.println(count + ":" + array[count]);
			}
		
		
		return processedArray;
	}
    
}
