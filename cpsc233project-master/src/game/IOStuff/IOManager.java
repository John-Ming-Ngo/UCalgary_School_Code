package game.IOStuff;

import java.util.ArrayList;
import java.io.*;

/**
 * This class is a recorder which will get and record all relevant states in the
 * game. This recorder will also return the relevant states where told to do so.
 * Its main function is to save the game's relevant states to a file, or
 * conversely load the game from a save file. Secondary jobs include printing
 * out game logs, saving high scores, and generating summary reports of changes.
 * 
 * @author John Ming Ngo
 * @version 1.1.0
 */
public abstract class IOManager {

	/**
	 * Initialize attributes.
	 */
	private String fileName = "";

	/**
	 * Initialize to defaults.
	 */
	public IOManager() {
		setFileName(".txt");
	}

	/**
	 * If the fileName is specified.
	 */
	public IOManager(String aFileName) {
		setFileName(aFileName);
	}

	/**
	 * Getters and setters
	 */

	/**
	 * This method ensures the given directory exists. If it exists, it does
	 * nothing; if it doesn't exist, it makes it.
	 * 
	 * @param directoryName a path to the direectory
	 */
	public void ensureDirectoryExistance(String directoryName) {
		File directory = new File(directoryName);
		if (!directory.exists()) {
			directory.mkdirs();
		}
	}

	/**
	 * This method is used by various info-parsing functions to parse the
	 * relevant information from the relevant strings in the file. Feed in a
	 * string, it returns everything after the colon (if present), with spaces
	 * stripped from the beginning and end.
	 * 
	 * @param inputInformation
	 *            The string with information to be parsed.
	 * @return information the parsed string with the relevant info.
	 */
	public String extractedInfo(String inputInformation) {
		int interfaceIndex = inputInformation.indexOf(":");
		interfaceIndex += 1; //We want to read from the first charecter immediately after the :.
		String information = inputInformation.substring(interfaceIndex, inputInformation.length());
		information = information.replaceAll("^ ", "");
		information = information.replaceAll(" $", "");
		return information;
	}

	/**
	 * Returns the file name.
	 * 
	 * @return name of file
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * Given a file name, this method loads all the information in this file as
	 * though it were a text file. It then returns this information to the user
	 * in the form of an ArrayList<String>.
	 * 
	 * @param fileName
	 *            A String corresponding to the name of the file to be loaded.
	 *            Recommended format for the file name is: [filename].txt, where
	 *            [filename] is up to you.
	 * @return fileData An ArrayList<String> with all the information in the
	 *         file, assuming the file loaded up properly.
	 */
	public ArrayList<String> load(String fileName) throws IOException {
		ArrayList<String> fileData = new ArrayList<String>();
		try {
			FileReader saveFile = new FileReader(fileName);
			BufferedReader saveReader = new BufferedReader(saveFile);
			for (String fileInfo = saveReader.readLine(); fileInfo != null; fileInfo = saveReader.readLine()) {
				fileData.add(fileInfo);
			}
			saveReader.close();
		} catch (IOException fileError) {
			throw new IOException(String.format("%s ran into problems being loaded from.", fileName), fileError);
		}
		return fileData;
	}

	/**
	 * Given an ArrayList<String> and a fileName, this method tries to save all
	 * of the information in the ArrayList, line by line, into a text file with
	 * the same name as the file name.
	 * 
	 * @param stringList
	 *            An ArrayList<String> corresponding to the set of information
	 *            to be saved into a text file. Note that the information must
	 *            be in the form of strings.
	 * @param fileName
	 *            A String corresponding to the name of the file to be saved as.
	 *            Recommended format: [someFileName].txt, where [someFileName]
	 *            is whatever one wants.
	 */
	public void save(ArrayList<String> stringList, String fileName) throws IOException {
		try {
			PrintWriter saveWriter = new PrintWriter(fileName, "UTF-8");
			for (String sentence : stringList) {
				saveWriter.println(sentence);
			}
			saveWriter.close();
		} catch (FileNotFoundException noFileException) {
			throw new IOException(String.format(
					"%s was not found. Please inspect the relevant directory and ensure the file is in there.",
					fileName), noFileException);
		} catch (IOException fileError) {
			throw new IOException(String.format(
					"%s could not be loaded. The file may not be openable, or was deleted or misplaced halfway through.",
					fileName), fileError);
		}
	}

	/**
	 * Sets the file name.
	 * 
	 * @param aFileName - The name of the file
	 */
	public void setFileName(String aFileName) {
		aFileName.replaceAll(".*[\\/:*?\"<>|].*", ""); // prevent illegal file
														// names.
		fileName = aFileName;
	}
}
