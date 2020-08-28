//Author: John Ming Ngo, 30020834.
//This program is that of a maze, where the charecter can control a red square point and must navigate to its end.

//HTML RGB color codes, from:
//https://htmlcolorcodes.com/
//Credit to Professor Manzala for finding these and formatting them.
#define WHITE	  0x00FFFFFF
#define RED		  0x00FF0000
#define BLUE	  0x000000FF
#define YELLOW	0x00FFFF00
#define CYAN 		0x0033f6ff
#define GREEN	  0x00008000

//Frame buffer constants, for initializing the mailbox and framebuffer.
//Credit to Professor Manzala for making these these and formatting them.
#define FRAMEBUFFER_WIDTH	   1024	 //In pixels
#define FRAMEBUFFER_HEIGHT	  768	 //In pixels
#define FRAMEBUFFER_DEPTH	  	 32	 //Bits per pixel (4 bytes per pixel)
#define FRAMEBUFFER_ALIGNMENT 	4	 //Framebuffer address preferred alignment
#define VIRTUAL_X_OFFSET	   0
#define VIRTUAL_Y_OFFSET	   0
#define PIXEL_ORDER_BGR		   0	 //Needed for the above color codes

//Display Constants
#define SQUARE_SIZE 64
#define TRUE 1

//Maze constants
#define MAZE_HEIGHT 12
#define MAZE_WIDTH 16

//GPIO SNES button codes
#define START 0x08
#define UP 		0x10
#define DOWN	0x20
#define LEFT	0x40
#define RIGHT	0x80

//SNES Pin codes
#define LATCH 9
#define CLOCK 11
#define CONTROL 10

//Frame buffer global variables
//Credit to Professor Manzala for making these these and formatting them.
unsigned int frameBufferWidth, frameBufferHeight, frameBufferPitch;
unsigned int frameBufferDepth, frameBufferPixelOrder, frameBufferSize;
unsigned int *frameBuffer;

//Include files
#include "uart.h"
#include "gpio.h"
#include "systimer.h"
#include "mailbox.h"

//Function prototypes

//SNES input/output functions.
unsigned short get_SNES();
void init_output_pin(int pin);
void set_pin(int pin);
void clear_pin(int pin);
void init_input_pin(int pin);
unsigned int get_pin(int pin);

//Maze Processing Functions
void processMoves(short moves, int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]);
void processMoveUp(int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]);
void processMoveDown(int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]); //Need mazeDim1, mazeDim2 in order to pass in arbitrary size array.
void processMoveRight(int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]);
void processMoveLeft(int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]);

//Visual Functions.
void initFrameBuffer();
void drawSquare(int rowPixel, int columnPixel, int squareSize, unsigned int color);
void drawPlayer(int playerPosition[2]);
void drawMaze(int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]);

//Debugging Functions.
//They're just the UART Functions, meh.

//Global Variables

//Maze Variables:
int maze[MAZE_HEIGHT][MAZE_WIDTH] = {
	{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	{1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
	{2, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1},
	{1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1},
	{1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1},
	{1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1},
	{1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1},
	{1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1},
	{1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 3},
	{1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1},
	{1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1},
	{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};
int startPosition[2] = {2, 0};
int endPosition[2] = {8, 15};

//Initalize player variables:
int playerPosition[2] = {2, 0};

//The main function. Sorta obvious.
void main() {

	//Initialize relevant variables.
	unsigned short start = 0x0000;
	unsigned short moves = 0x0000;
	//Initiate UART communications.
	uart_init();
	//Initialize the Frame buffer
	initFrameBuffer();

	//Start of SNES initialization.
	//Initiate pin 9 for SNES Latch output
	init_output_pin(LATCH);
	//Initiate pin 11 for SNES Clock output
	init_output_pin(CLOCK);
	//Initiate pin 10 for SNES controls input.
	init_input_pin(CONTROL);
	//Clear SNES Latch Line
	clear_pin(LATCH);
	//Set the Clock line to high.
	set_pin(CLOCK);
	//End SNES Initalization.

	//Set the screen to display the maze.
	drawMaze(MAZE_HEIGHT, MAZE_WIDTH, maze);
	uart_puts("Main went and variables initalized. \n");
	//Main Game Loop
	while (TRUE) {
		//Loop meant to hold the player until they press start.
		while (start != TRUE) {
			moves = get_SNES();
			if (moves&START) {
				start = TRUE;
				//Restarts the player's position back at the beginning.
				playerPosition[0] = startPosition[0];
				playerPosition[1] = startPosition[1];
				//Helps with debugging
				uart_puts("Pressed start. \n");
			}
			//microsecond_delay(1667);
		}

		//Main in-game loop.
		while (start == TRUE) {
			//Get and process the moves.
			moves = get_SNES();
			processMoves(moves, playerPosition, sizeof(maze) / sizeof(maze[0]), sizeof(maze[0]) / sizeof(maze[0][0]), maze);
			//Draw the maze.
			drawMaze(MAZE_HEIGHT, MAZE_WIDTH, maze);
			drawPlayer(playerPosition);
			//UART Debug messages.
			uart_puts("Player Position: (");
			uart_puthex(playerPosition[0]);
			uart_puts(",");
			uart_puthex(playerPosition[1]);
			uart_puts(") \n");

			//If the player wins, lock the screen and colour the player green.
			if ((playerPosition[0] == endPosition[0]) && (playerPosition[1] == endPosition[1])) {
				drawSquare(endPosition[0] * SQUARE_SIZE, endPosition[1] * SQUARE_SIZE, SQUARE_SIZE, GREEN);
				start = 0;
			}
			//microsecond_delay(1667);
		}
	}
	return;
}
/**
This function gets the button input feedback from the SNES controller. Requires the SNES to have been initialized.
Parameters: None
Returns:
	data: The integer corrisponding to the combination of buttons on the SNES pressed.
*/
unsigned short get_SNES()
{
	unsigned short data = 0;
	unsigned int value;
	// Set LATCH to high for 12 microseconds. This causes the controller to
	// latch the values of button presses into its internal register. The
	// first serial bit also becomes available on the DATA line.
	set_pin(LATCH);
	microsecond_delay(12);
	clear_pin(LATCH);
	// Output 16 clock pulses, and read 16 bits of serial data
	for (int pulse_number = 0; pulse_number < 16; pulse_number++) {
		// Delay 6 microseconds (half a cycle)
		microsecond_delay(6);
		// Clear the CLOCK line (creates a falling edge)
		clear_pin(CLOCK);
		// Read the value on the input DATA line
		value = get_pin(CONTROL);
		// Store the bit read. Note we convert a 0 (which indicates a button
		// press) to a 1 in the returned 16-bit integer. Unpressed buttons
		// will be encoded as a 0.
		if (value == 0) {
			data |= (0x1 << pulse_number);
		}
		// Delay 6 microseconds (half a cycle)
		microsecond_delay(6);
		// Set the CLOCK to 1 (creates a rising edge). This causes the
		// controller to output the next bit, which we read half a
		// cycle later.
		set_pin(CLOCK);
	}
	// Return the encoded data
	return data;
}


/**
This function initalizes a pin to be an output pin.
Parameters: pin - Integer input selecting the pin we want to deal with.
Returns: Nothing
*/
void init_output_pin(int pin) {
	unsigned int pinRange; //Used to determine the register and the pin in register to activate.
	register unsigned int r = 0; //Used to store said register.
	pinRange = pin/10; //Used to identify which GPFSEL register to select.
	switch (pinRange) {
		case 0:
			r = *GPFSEL0;
			break;
		case 1:
			r = *GPFSEL1;
			break;
		case 2:
			r = *GPFSEL2;
			break;
		case 3:
			r = *GPFSEL3;
			break;
		case 4:
			r = *GPFSEL4;
			break;
		case 5:
			r = *GPFSEL5;
			break;
	}
	pinRange = pin % 10; //Used to identify the pin to select.
	r &= ~(0x7 << (pinRange*3));
	r |= (0x1 << (pinRange*3));

	pinRange = pin/10; //Used to identify which GPFSEL register to select.
	switch (pinRange) {
		case 0:
			*GPFSEL0 = r;
			break;
		case 1:
			*GPFSEL1 = r;
			break;
		case 2:
			*GPFSEL2 = r;
			break;
		case 3:
			*GPFSEL3 = r;
			break;
		case 4:
			*GPFSEL4  = r;
			break;
		case 5:
			*GPFSEL5 = r;
			break;
	}

	// Disable pullup/pulldown
	*GPPUD = 0x0;
	r = 150;
	while (r--) {
	  asm volatile("nop");
	}
	*GPPUDCLK0 = (0x1 << pin);
	r = 150;
	while (r--) {
	  asm volatile("nop");
	}
	*GPPUDCLK0 = 0;
}

/**
This function sets an output pin. Note that the pin should be initialized before this.
Parameters: pin - Integer input selecting the pin we want to deal with.
Returns: Nothing
*/
void set_pin(int pin){
	register unsigned int r;
	r = (0x1 << pin);
	*GPSET0 = r;
}

/**
This function clears an output pin. Note that the pin should be initialized before this.
Parameters: pin - Integer input selecting the pin we want to deal with.
Returns: Nothing
*/
void clear_pin(int pin){
	register unsigned int r;
	r = (0x1 << pin);
	*GPCLR0 = r;
}

/**
This function initalizes a pin to take GPIO input.
Parameters: pin - Integer input selecting the pin we want to deal with.
Returns: Nothing
*/
void init_input_pin(int pin) {
	unsigned int pinRange; //Used to determine the register and the pin in register to activate.
	register unsigned int r = 0; //Used to store said register.
	pinRange = pin/10; //Used to identify which GPFSEL register to select.
	switch (pinRange) {
		case 0:
			r = *GPFSEL0;
			break;
		case 1:
			r = *GPFSEL1;
			break;
		case 2:
			r = *GPFSEL2;
			break;
		case 3:
			r = *GPFSEL3;
			break;
		case 4:
			r = *GPFSEL4;
			break;
		case 5:
			r = *GPFSEL5;
			break;
	}
	pinRange = pin % 10; //Used to identify the pin to select.
	r &= ~(0x7 << (pinRange*3));

	pinRange = pin/10; //Used to identify which GPFSEL register to select.
	switch (pinRange) {
		case 0:
			*GPFSEL0 = r;
			break;
		case 1:
			*GPFSEL1 = r;
			break;
		case 2:
			*GPFSEL2 = r;
			break;
		case 3:
			*GPFSEL3 = r;
			break;
		case 4:
			*GPFSEL4  = r;
			break;
		case 5:
			*GPFSEL5 = r;
			break;
	}

	//Disable internal pullup/pulldown.
	*GPPUD = 0x0;
	r = 150;
	while (r--) {
		asm volatile("nop");
	}
	*GPPUDCLK0 = (0x1 << pin);
	r = 150;
	while (r--) {
		asm volatile("nop");
	}
	*GPPUDCLK0 = 0;
}

/**
This function gets any GPIO input data for a given pin.
Parameters: pin - the pin to check.
Returns: The value of the pin - 0 or 1.
*/
unsigned int get_pin(int pin) {
	register unsigned int r;
	// Get the current contents of the GPIO Pin Level Register 0
	r = *GPLEV0;
	// Isolate the relevant input pin, and return its value (a 0 if low, or a 1 if high)
	return ((r >> pin) & 0x1);
}

/**
This function processes the movements of the player.
Parameters:
	moves: The short corrisponding to the moves returned by the SNES controller.
	playerPosition: The array corrisponding to the {row, column} of the player's position.
	mazeDim1: The number of rows in the maze.
	mazeDim2: The number of columns in the maze.
	maze: The array corrisponding to the maze' data.
Returns: None
*/
void processMoves(short moves, int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]) {
	if (moves&UP) {
		processMoveUp(playerPosition, mazeDim1, mazeDim2, maze);
		//Helps with debugging
		uart_puts("Move Up.");
	}
	else if (moves&DOWN) {
		processMoveDown(playerPosition, mazeDim1, mazeDim2, maze);
		//Helps with debugging
		uart_puts("Move Down.");
	}
	else if (moves&LEFT) {
		processMoveLeft(playerPosition, mazeDim1, mazeDim2, maze);
		//Helps with debugging
		uart_puts("Move Left.");
	}
	else if (moves&RIGHT) {
		processMoveRight(playerPosition, mazeDim1, mazeDim2, maze);
		//Helps with debugging
		uart_puts("Move right.");
	}
	return;
}
/**
This function processes the case when the player is trying to move up.
Parameters:
	playerPosition: The array corrisponding to the {row, column} of the player's position.
	mazeDim1: The number of rows in the maze.
	mazeDim2: The number of columns in the maze.
	maze: The array corrisponding to the maze' data.
Returns: None
*/
void processMoveUp(int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]) {
	int nextPosRow, nextPosColumn;
	nextPosRow = playerPosition[0] - 1;
	if (nextPosRow < 0) {
		nextPosRow = 0;
	}
	nextPosColumn = playerPosition[1];
	int nextPosThing = maze[nextPosRow][nextPosColumn];
	if (nextPosThing != 1) {//if the next place isn't a wall
		playerPosition[0] = nextPosRow;
		playerPosition[1] = nextPosColumn;
	}
	return;
}
/**
This function processes the case when the player is trying to move down.
Parameters:
	playerPosition: The array corrisponding to the {row, column} of the player's position.
	mazeDim1: The number of rows in the maze.
	mazeDim2: The number of columns in the maze.
	maze: The array corrisponding to the maze' data.
Returns: None
*/
void processMoveDown(int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]) {
	int nextPosRow, nextPosColumn;
	nextPosRow = playerPosition[0] + 1;
	if (nextPosRow > mazeDim1) {
		nextPosRow = mazeDim1;
	}
	nextPosColumn = playerPosition[1];
	int nextPosThing = maze[nextPosRow][nextPosColumn];
	if (nextPosThing != 1) {//if the next place isn't a wall
		playerPosition[0] = nextPosRow;
		playerPosition[1] = nextPosColumn;
	}
	return;
}
/**
This function processes the case when the player is trying to move right.
Parameters:
	playerPosition: The array corrisponding to the {row, column} of the player's position.
	mazeDim1: The number of rows in the maze.
	mazeDim2: The number of columns in the maze.
	maze: The array corrisponding to the maze' data.
Returns: None
*/
void processMoveRight(int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]) {
	int nextPosRow, nextPosColumn;
	nextPosRow = playerPosition[0];
	nextPosColumn = playerPosition[1] + 1;
	if (nextPosColumn < 0) {
		nextPosColumn = 0;
	}
	int nextPosThing = maze[nextPosRow][nextPosColumn];
	if (nextPosThing != 1) {//if the next place isn't a wall
		playerPosition[0] = nextPosRow;
		playerPosition[1] = nextPosColumn;
	}
	return;
}
/**
This function processes the case when the player is trying to move left.
Parameters:
	playerPosition: The array corrisponding to the {row, column} of the player's position.
	mazeDim1: The number of rows in the maze.
	mazeDim2: The number of columns in the maze.
	maze: The array corrisponding to the maze' data.
Returns: None
*/
void processMoveLeft(int playerPosition[2], int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]) {
	int nextPosRow, nextPosColumn;
	nextPosRow = playerPosition[0];
	nextPosColumn = playerPosition[1] - 1;
	if (nextPosColumn > mazeDim2) {
		nextPosColumn = mazeDim2;
	}
	int nextPosThing = maze[nextPosRow][nextPosColumn];
	if (nextPosThing != 1) {//if the next place isn't a wall
		playerPosition[0] = nextPosRow;
		playerPosition[1] = nextPosColumn;
	}
	return;
}
/**
This function draws the maze on the video feed.
Parameters:
	mazeDim1: The number of rows in the maze.
	mazeDim2: The number of columns in the maze.
	maze: The array corrisponding to the maze' data.
Returns: None
*/
void drawMaze(int mazeDim1, int mazeDim2, int maze[mazeDim1][mazeDim2]){
	int squareType;
	for (int i = 0; i < mazeDim1; i++) {
		for (int j = 0; j < mazeDim2; j++) {
			squareType = maze[i][j];
			switch (squareType) {
				case 0:
					drawSquare(i*SQUARE_SIZE,j*SQUARE_SIZE,SQUARE_SIZE,WHITE);
					break;
				case 1:
					drawSquare(i*SQUARE_SIZE,j*SQUARE_SIZE,SQUARE_SIZE,BLUE);
					break;
				case 2:
					drawSquare(i*SQUARE_SIZE,j*SQUARE_SIZE,SQUARE_SIZE,YELLOW);
					break;
				case 3:
					drawSquare(i*SQUARE_SIZE,j*SQUARE_SIZE,SQUARE_SIZE,CYAN);
					break;
			}
		}
	}
	return;
}
/**
This function draws the square representing the player.
Parameters:
	playerPosition: An input integer array of two entries,
		one of the row, and the other of the column of
		the player's position on the maze.
Returns: None
*/
void drawPlayer(int playerPosition[2]) {
	drawSquare(playerPosition[0]*SQUARE_SIZE,playerPosition[1]*SQUARE_SIZE,SQUARE_SIZE,RED);
	return;
}
/**
This function initalizes the frame buffer and HDMI video output.
Parameters: None
Returns: None
*/
void initFrameBuffer()
{
	//Initialize the mailbox variables.
	mailbox_buffer[0] = 35 * 4;
	mailbox_buffer[1] = MAILBOX_REQUEST;

	mailbox_buffer[2] = TAG_SET_PHYSICAL_WIDTH_HEIGHT;
	mailbox_buffer[3] = 8;
	mailbox_buffer[4] = 8;
	mailbox_buffer[5] = FRAMEBUFFER_WIDTH;
	mailbox_buffer[6] = FRAMEBUFFER_HEIGHT;

	mailbox_buffer[7] = TAG_SET_VIRTUAL_WIDTH_HEIGHT;
	mailbox_buffer[8] = 8;
	mailbox_buffer[9] = 8;
	mailbox_buffer[10] = FRAMEBUFFER_WIDTH;
	mailbox_buffer[11] = FRAMEBUFFER_HEIGHT;

	mailbox_buffer[12] = TAG_SET_VIRTUAL_OFFSET;
	mailbox_buffer[13] = 8;
	mailbox_buffer[14] = 8;
	mailbox_buffer[15] = VIRTUAL_X_OFFSET;
	mailbox_buffer[16] = VIRTUAL_Y_OFFSET;

	mailbox_buffer[17] = TAG_SET_DEPTH;
	mailbox_buffer[18] = 4;
	mailbox_buffer[19] = 4;
	mailbox_buffer[20] = FRAMEBUFFER_DEPTH;

	mailbox_buffer[21] = TAG_SET_PIXEL_ORDER;
	mailbox_buffer[22] = 4;
	mailbox_buffer[23] = 4;
	mailbox_buffer[24] = PIXEL_ORDER_BGR;

	mailbox_buffer[25] = TAG_ALLOCATE_BUFFER;
	mailbox_buffer[26] = 8;
	mailbox_buffer[27] = 8;
	// Request: alignment; Response: frame buffer address
	mailbox_buffer[28] = FRAMEBUFFER_ALIGNMENT;
	mailbox_buffer[29] = 0;	   // Response: Frame buffer size

	mailbox_buffer[30] = TAG_GET_PITCH;
	mailbox_buffer[31] = 4;
	mailbox_buffer[32] = 4;
	mailbox_buffer[33] = 0;	   // Response: Pitch

	mailbox_buffer[34] = TAG_LAST;


	//Make a mailbox request using the above mailbox data structure
	if (mailbox_query(CHANNEL_PROPERTY_TAGS_ARMTOVC)) {
	// If here, the query succeeded, and we can check the response

	//Get the returned frame buffer address, masking out 2 upper bits
		mailbox_buffer[28] &= 0x3FFFFFFF;
		frameBuffer = (void *)((unsigned long)mailbox_buffer[28]);

	//Read the frame buffer settings from the mailbox buffer
		frameBufferWidth = mailbox_buffer[5];
		frameBufferHeight = mailbox_buffer[6];
		frameBufferPitch = mailbox_buffer[33];
		frameBufferDepth = mailbox_buffer[20];
		frameBufferPixelOrder = mailbox_buffer[24];
		frameBufferSize = mailbox_buffer[29];

		//Confirms the frame buffer was initialized.
		uart_puts("Frame Buffer Initialized\n");
	}
	else {
		//Explains sadly that the frame buffer wasn't initialized.
		uart_puts("Cannot initialize frame buffer\n");
	}
}
/**
This function draws a square on the video feed/frame buffer.
Parameters:
	rowPixel: The top left pixel row of the square to be drawn, for localizing it.
	columnPixel: The top left pixel column of the square to be drawn, for localizing it.
	squareSize: The size of the square to be drawn.
	color: The integer value corrispnding to the intended colour of the square.
Returns: None.
*/
void drawSquare(int rowPixel, int columnPixel, int squareSize, unsigned int color) {
	int row, column, rowEnd, columnEnd;
	unsigned int *pixel = frameBuffer;

	//Calculate where the row and columns end
	rowEnd = rowPixel + squareSize;
	columnEnd = columnPixel + squareSize;

	//Draw the square row by row, from the top down
	for (row = rowPixel; row < rowEnd; row++) {
	// Draw each pixel in the row from left to right
		for (column = columnPixel; column < columnEnd; column++) {
		//Draw the individual pixel by setting its
		//RGB value in the frame buffer
			pixel[(row * frameBufferWidth) + column] = color;
		}
	}
}
