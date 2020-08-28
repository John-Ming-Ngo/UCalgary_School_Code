package game.IOStuff.audio;
import java.io.*;
import java.util.*;
import javazoom.jl.decoder.*;
import javazoom.jl.player.advanced.*;
/**
* This class handles audio file playing.
* Intended for background music playing.
* It will also work for other sounds.
* @author John Ming Ngo (Team 13)
* @version 1.0.0
*/
public class SoundLayer implements Runnable {
	
	private static final int EXPECTED_EXCEPTION_COUNT = 0;
	
	private volatile String audioFileName = null;
	private boolean repeat = false;
	private AdvancedPlayer soundtrack = null;
	private ArrayList<String> exceptions = new ArrayList<String>();
	private volatile Thread soundThread = null;
	
	/**
	* Constructor - Give it the String name of an audio file and it will try to load it up.
	* @param audioFile A String corrisponding to the name of the audio file to be loaded.
	* Can include file pathways in the name to locate the file, if not in current directory.
	*/
	public SoundLayer(String audioFile) {
		setAudioFileName(audioFile);
	}
	/**
	* This method sets or resets the actual loaded up audio file to play.
	* @param audioFile A String corrisponding to the name of the audio file to be loaded.
	* Can include file pathways in the name to locate the file, if not in current directory.
	* @return void
	*/
	private void setSoundTrack(String audioFile) throws FileNotFoundException, JavaLayerException {
		File inputFile = new File(audioFile);
		FileInputStream mp3File = new FileInputStream(inputFile);
		soundtrack = new AdvancedPlayer(mp3File);
	}
	/**
	* Setter for the audioFileName; use this if you want to change the music file being played.
	* @param audioFile A String corrisponding to the name of the audio file to be loaded.
	* Can include file pathways in the name to locate the file, if not in current directory.
	*/
	public void setAudioFileName(String audioFile) {
		audioFileName = audioFile;
	}
	/**
	* Plays the designated audio file in a continuous loop.
	*/
	private void playSound() throws FileNotFoundException, JavaLayerException {
		setSoundTrack(audioFileName);
		soundtrack.play();
	}

	/**
	* Implementing run() to make threading work.
	*/
	public void run() {
		try {
			do {
				playSound();
			} while (repeat);
		}
		catch (FileNotFoundException noFile) {
			exceptions.add(String.format("Can't find the bloody file. Please ensure %s is in the correct location. ", audioFileName));
			exceptions.add(noFile.getMessage());
		}
		catch (JavaLayerException jLayerProblems) {
			exceptions.add("JLayer problems. Sorry, that's all we know. ");
			exceptions.add(jLayerProblems.getMessage());
		}
	}
	/**
	* Declaring my own playLoop() method in order to make it as simple and straight
	* forward as possible on the end user. Also helps with exceptions. This method
	* continuously loops the played sound.
	*/
	public void playLoop() throws SoundException {
		if (exceptions.size() > EXPECTED_EXCEPTION_COUNT) {
			String message = "";
			for (String entry: exceptions) {
				message += entry;
			}
			throw new SoundException(message);
		}
		repeat = true;
		soundThread = new Thread(this);
		soundThread.start();
	}
	/**
	* Declaring my own playOnce() method in order to make it as simple and straight
	* forward as possible on the end user. Also helps with exceptions. This method
	* plays the given sound only once.
	* 
	*/
	public void playOnce() throws SoundException {
		if (exceptions.size() > EXPECTED_EXCEPTION_COUNT) {
			String message = "";
			for (String entry: exceptions) {
				message += entry;
			}
			throw new SoundException(message);
		}
		repeat = false;
		soundThread = new Thread(this);
		soundThread.start();
	}
}