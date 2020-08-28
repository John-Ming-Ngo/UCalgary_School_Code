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


public class Scraper2 {
	
	public enum Metal {
	    GOLD, SILVER, PLATINUM, PALLADIUM
	}

    private double[] priceHistory;;

    public static void main(String[] args) throws IOException {

        
        Scraper myScraper = new Scraper();
        myScraper.scrapePrice(Metal.GOLD, "2008-02-01", 7, 52);
       
        
        //System.out.print(myScraper.price);

/*
 *         String question = document.select("#question .post-text").text();
        System.out.println("Question: " + question);

        Elements answerers = document.select("#answers .user-details a");
        for (Element answerer : answerers) {
            System.out.println("Answerer: " + answerer.text());
            */
            
    }
    
    	public int scrapePrice(Metal type, String startdate, int interval, int numberOfIntervals) {

		int status = 0;

		// example better way with symbols
		// http://www.google.com/finance/historical?q=NASDAQ:MSFT&startdate=Jan+28%2C+2016&enddate=Jan+26%2C+2017&num=30&output=csv
		// dates can be in format of yyyy-mm-dd

		ArrayList<Double> tempList = new ArrayList<Double>();
		String[] lines = new String[numberOfIntervals * interval];
		int linesToSkip = interval - 1;

		if (isValidDate(startdate, interval, numberOfIntervals)) {
			String enddate = calculateEndDate(startdate, interval, numberOfIntervals);

			String stockURL = "http://www.google.com/finance/historical?q=" + symbol + "&startdate=" + startdate
					+ "&enddate=" + enddate + "&output=csv";

			// open url as an input stream to read
			try {
				URL url = new URL(stockURL); // google finance url csv file
				InputStream webStream = url.openStream();

				// open webinput as an input steam
				Scanner webInput = new Scanner(webStream);

				// throw away first line headings
				webInput.nextLine();

				// read all input lines into array
				int index = 0;
				while (webInput.hasNext()) {
					lines[index] = webInput.nextLine();
					index++;
				}
				webInput.close();
				
				// fill in days with no data - replace with last value
				lines = fillData(lines);

				// lines[index] has the most recent dates first, we would like
				// the latest(which is the start date first so
				// we loop through array backwards starting at the first
				// available date
				for (int index_i = lines.length - 1; index_i >= 0; index_i--) {

					if (lines[index_i] != null) {
						String[] token = lines[index_i].split(",");
						tempList.add(Double.parseDouble(token[4]));
						index_i -= linesToSkip;
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
		else {
			status = 2;
		}
		
		if (tempList.size() < numberOfIntervals){
			status = 2;
		}
		
		//set the each element of priceHistory from data
		//setPriceHistory(new double[tempList.size()]);
		for (int count = 0; count < tempList.size(); count++) {
			//setPriceHistory(count, (double) tempList.get(count));
		}

		return status;
	}
    
    public String[] fillData(String[] array){
        
        System.out.println("[fillData]");
        System.out.println("[Array Length]" + array.length);
        
        ArrayList<String> list = new ArrayList<String>();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MMM-yy");
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
                             int daysDelta = daysBetween(calCurrent.getTime(),calPrevious.getTime());
                             //System.out.println("Days= "+daysBetween(calPrevious.getTime(),calCurrent.getTime()) + "     Index:" + index_i);
                             
                             if (daysDelta > 1) {
                                 
                                 for (int index = 1; index < daysDelta; index++) {
                                     list.add(array[index_i -1 ]);
                                 }
                                 
                             }
                             //fill in missing lines if
                             
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
    
}
