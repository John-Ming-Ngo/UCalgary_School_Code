package game.IOStuff.audio;
import java.io.*;

public class SoundException extends Exception {
	
	private Throwable exception;
	
	/**
	* Constructors
	*/
	public SoundException() {
		
	}
	
	public SoundException(String message) {
		super(message);
	}
	
	public SoundException(String message, Throwable otherException) {
		super(message);
		exception = otherException;
	}
	
	/**
	* Standard exception methods.
	*/
	public Throwable getException() {
		return exception;	
	}
	
	public void printStackTrace() {
		printStackTrace(System.err);	
	}
	
	public void printStackTrace(PrintStream ps) {
		if (exception == null) {
			super.printStackTrace(ps);	
		}
		else {
			exception.printStackTrace();
		}
	}
}