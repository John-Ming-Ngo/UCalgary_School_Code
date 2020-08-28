// This program sets up GPIO pin 17 as an input pin, which is assumed to
// be connected to a push button switch on a breadboard. When the button is
// pushed, a 3.3V level should be applied to the pin. The pin should otherwise
// be pulled low with a pull-down resistor of 10K Ohms. The program polls this
// pin in an infinite loop, and writes its current level (low or high) to the
// console terminal.

// Include files
#include "uart.h"
#include "gpio.h"

// Function prototypes
void init_GPIO17_to_input();
unsigned int get_GPIO17();
// Function prototypes
void init_GPIO23_to_output();
void set_GPIO23();
void clear_GPIO23();



////////////////////////////////////////////////////////////////////////////////
//
//  Function:       main
//
//  Arguments:      none
//
//  Returns:        void
//
//  Description:    This function initializes GPIO pin 17 to be an input pin
//                  without an internal pull-up or pull-down resistor. It then
//                  polls the pin an infinite loop, and prints out the current
//                  state (low or high) of the pin. We will use a push button
//                  switch on the bread board circuit connected to this pin.
//                  Be sure to use a pull-down (or pull-up) resistor on the pin.
//                  In other words, do not let the input pin float. Also be
//                  sure to use 3.3V (NOT 5V) to set the pin high.
//
////////////////////////////////////////////////////////////////////////////////

void main()
{
    register unsigned int r;


    // Set up the UART serial port
    uart_init();

    // Set up GPIO pin #17 for input
    init_GPIO17_to_input();
    init_GPIO23_to_output();

    // Print out a message to the console
    uart_puts("External Switch Program starting.\n");

    // Loop forever, polling pin 17 for its current level
    while (1) {
    	// Get the current value of pin 17
    	r = get_GPIO17();

	// Determine the pin input level and print this to the console
	if (r == 0) {
	    uart_puts("Low\n");
      clear_GPIO23();
	} else {
	    uart_puts("High\n");
      set_GPIO23();
	}

        // Delay a little using a busy loop
        r = 0x0000FFFF;
    	while (r--) {
      	    asm volatile("nop");
    	}
    }
}



////////////////////////////////////////////////////////////////////////////////
//
//  Function:       init_GPIO17_to_input
//
//  Arguments:      none
//
//  Returns:        void
//
//  Description:    This function sets GPIO pin 17 to an input pin without
//                  any internal pull-up or pull-down resistors. Note that
//                  a pull-down (or pull-up) resistor must be used externally
//                  on the bread board circuit connected to the pin. Be sure
//                  that the pin high level is 3.3V (definitely NOT 5V).
//
////////////////////////////////////////////////////////////////////////////////

void init_GPIO17_to_input()
{
    register unsigned int r;


    // Get the current contents of the GPIO Function Select Register 1
    r = *GPFSEL1;

    // Clear bits 21 - 23. This is the field FSEL17, which maps to GPIO pin 17.
    // We clear the bits by ANDing with a 000 bit pattern in the field. This
    // sets the pin to be an input pin
    r &= ~(0x7 << 21);

    // Write the modified bit pattern back to the
    // GPIO Function Select Register 1
    *GPFSEL1 = r;

    // Disable the pull-up/pull-down control line for GPIO pin 17. We follow the
    // procedure outlined on page 101 of the BCM2837 ARM Peripherals manual. We
    // will pull down the pin using an external resistor connected to ground.

    // Disable internal pull-up/pull-down by setting bits 0:1
    // to 00 in the GPIO Pull-Up/Down Register
    *GPPUD = 0x0;

    // Wait 150 cycles to provide the required set-up time
    // for the control signal
    r = 150;
    while (r--) {
        asm volatile("nop");
    }

    // Write to the GPIO Pull-Up/Down Clock Register 0, using a 1 on bit 17 to
    // clock in the control signal for GPIO pin 17. Note that all other pins
    // will retain their previous state.
    *GPPUDCLK0 = (0x1 << 17);

    // Wait 150 cycles to provide the required hold time
    // for the control signal
    r = 150;
    while (r--) {
        asm volatile("nop");
    }

    // Clear all bits in the GPIO Pull-Up/Down Clock Register 0
    // in order to remove the clock
    *GPPUDCLK0 = 0;
}



////////////////////////////////////////////////////////////////////////////////
//
//  Function:       get_GPIO17
//
//  Arguments:      none
//
//  Returns:        1 if the pin level is high, and 0 if the pin level is low.
//
//  Description:    This function gets the current value of pin 17.
//
////////////////////////////////////////////////////////////////////////////////

unsigned int get_GPIO17()
{
    register unsigned int r;


    // Get the current contents of the GPIO Pin Level Register 0
    r = *GPLEV0;

    // Isolate pin 17, and return its value (a 0 if low, or a 1 if high)
    return ((r >> 17) & 0x1);
}

////////////////////////////////////////////////////////////////////////////////
//
//  Function:       init_GPIO23_to_output
//
//  Arguments:      none
//
//  Returns:        void
//
//  Description:    This function sets GPIO pin 23 to an output pin without
//                  any pull-up or pull-down resistors.
//
////////////////////////////////////////////////////////////////////////////////

void init_GPIO23_to_output()
{
    register unsigned int r;


    // Get the current contents of the GPIO Function Select Register 2
    r = *GPFSEL2;

    // Clear bits 9 - 11. This is the field FSEL23, which maps to GPIO pin 23.
    // We clear the bits by ANDing with a 000 bit pattern in the field.
    r &= ~(0x7 << 9);

    // Set the field FSEL23 to 001, which sets pin 23 to an output pin.
    // We do so by ORing the bit pattern 001 into the field.
    r |= (0x1 << 9);

    // Write the modified bit pattern back to the
    // GPIO Function Select Register 2
    *GPFSEL2 = r;

    // Disable the pull-up/pull-down control line for GPIO pin 23. We follow the
    // procedure outlined on page 101 of the BCM2837 ARM Peripherals manual. The
    // internal pull-up and pull-down resistor isn't needed for an output pin.

    // Disable pull-up/pull-down by setting bits 0:1
    // to 00 in the GPIO Pull-Up/Down Register
    *GPPUD = 0x0;

    // Wait 150 cycles to provide the required set-up time
    // for the control signal
    r = 150;
    while (r--) {
      asm volatile("nop");
    }

    // Write to the GPIO Pull-Up/Down Clock Register 0, using a 1 on bit 23 to
    // clock in the control signal for GPIO pin 23. Note that all other pins
    // will retain their previous state.
    *GPPUDCLK0 = (0x1 << 23);

    // Wait 150 cycles to provide the required hold time
    // for the control signal
    r = 150;
    while (r--) {
      asm volatile("nop");
    }

    // Clear all bits in the GPIO Pull-Up/Down Clock Register 0
    // in order to remove the clock
    *GPPUDCLK0 = 0;
}



////////////////////////////////////////////////////////////////////////////////
//
//  Function:       set_GPIO23
//
//  Arguments:      none
//
//  Returns:        void
//
//  Description:    This function sets the GPIO output pin 23
//                  to a 1 (high) level.
//
////////////////////////////////////////////////////////////////////////////////

void set_GPIO23()
{
	  register unsigned int r;

	  // Put a 1 into the SET23 field of the GPIO Pin Output Set Register 0
	  r = (0x1 << 23);
	  *GPSET0 = r;
}



////////////////////////////////////////////////////////////////////////////////
//
//  Function:       clear_GPIO23
//
//  Arguments:      none
//
//  Returns:        void
//
//  Description:    This function clears the GPIO output pin 23
//                  to a 0 (low) level.
//
////////////////////////////////////////////////////////////////////////////////

void clear_GPIO23()
{
	  register unsigned int r;

	  // Put a 1 into the CLR23 field of the GPIO Pin Output Clear Register 0
	  r = (0x1 << 23);
	  *GPCLR0 = r;
}
