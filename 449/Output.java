import java.io.PrintWriter;

public void outputTextFile(String outputFileName, List<String> textToOutput) {
	try {
		outputPrinter = new PrintWriter(outputFileName);
		for (String line:textToOutput) {
			outputPrinter.printf(line);
		}
	}
	catch (Exception e) {
		System.out.println("Uh oh. You really shouldn't have seen this.");
	}
}