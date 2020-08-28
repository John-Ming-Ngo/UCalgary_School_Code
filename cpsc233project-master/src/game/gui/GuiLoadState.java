package game.gui;

import javax.swing.*;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.awt.*; //for layout managers and more

/**
 * 
 * This class is the layout and population of components of the setup menu
 * 
 * @author - Team 13
 * 
 * @version 0.5 alpha - 12 Mar 17
 * 
 */
public class GuiLoadState extends JPanel {

	private static final long serialVersionUID = -3730905771677031979L;
	private static final String PATH = "./saves";
	private static final String FILE_ENDING = ".txt";
	// list of buttons on panel
	private JButton buttonLoad;
	private JButton buttonCancel;

	// list of JtextFields
	private JComboBox<String> filename;

	public GuiLoadState() {

	}

	/**
	 * @return the list of buttons on the panel
	 */
	public JButton[] getButton() {
		JButton[] button = { buttonLoad, buttonCancel };
		return button;
	}

	/**
	 * Returns the filename
	 * 
	 * @return filename
	 */
	public String getChosenFilename() {
		return (String) filename.getSelectedItem();
	}

	/**
	 * Returns the list of files in a directory
	 * 
	 * @return list of files
	 */
	private String[] getFilenames() {
		// create a FileFilter and override its accept-method
		FilenameFilter fileFilter = new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return name.toLowerCase().endsWith(FILE_ENDING);
			}
		};

		// Get files in directory
		File files = new File(PATH);
		ArrayList<String> namelist = new ArrayList<String>(Arrays.asList(files.list(fileFilter)));

		// convert to String[]
		String[] filelist = new String[namelist.size()];
		filelist = namelist.toArray(filelist);

		return filelist;
	}

	/**
	 * @param panel
	 *            the panel to display the components
	 * @return the populated panel
	 */
	public JPanel init(JPanel panel) {

		GridBagConstraints constraints = new GridBagConstraints();
		GridBagLayout gridbag = new GridBagLayout();

		panel.removeAll();
		panel.setLayout(gridbag);

		// setupFrame fields

		JLabel labelFilename = new JLabel("File List");
		filename = new JComboBox<String>(getFilenames());

		// Buttons
		panel.setLayout(gridbag);

		// setupFrame buttons
		buttonLoad = new JButton("Load State");
		buttonCancel = new JButton("Cancel");

		// buttons
		constraints.insets = new Insets(5, 5, 5, 5);
		constraints.fill = GridBagConstraints.HORIZONTAL;
		constraints.weighty = 0.0;
		constraints.anchor = GridBagConstraints.PAGE_START;
		constraints.gridy = 0;
		constraints.gridx = 0;
		panel.add(labelFilename, constraints);
		constraints.gridx = 1;
		constraints.weightx = .25;
		constraints.weighty = 0.25;
		constraints.gridwidth = GridBagConstraints.REMAINDER;
		panel.add(filename, constraints);

		constraints.anchor = GridBagConstraints.PAGE_END;
		constraints.fill = GridBagConstraints.NONE;
		constraints.gridwidth = GridBagConstraints.RELATIVE;
		constraints.gridx = 0;
		constraints.weightx = 1;
		constraints.gridy++;
		panel.add(buttonLoad, constraints);
		constraints.gridwidth = GridBagConstraints.REMAINDER;
		constraints.weightx = 0.0;
		constraints.weighty = 1.0;
		constraints.gridx++;
		panel.add(buttonCancel, constraints);

		return panel;
	}
}
