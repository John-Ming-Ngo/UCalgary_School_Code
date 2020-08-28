//Author: John Ming Ngo, 30020834

//Handles various exceptions; currently handles IRQ exceptions. Meant for use with main.c

//Possible sources of exceptions.
#define SWITCH_A 23
#define SWITCH_B 24

// Header files
#include "uart.h"
#include "gpio.h"
#include "irq.h"
#include "sysreg.h"

// Reference to the global shared value
extern unsigned int LIGHTSTATE;

/**
This function handles IRQ exceptions thrown throughout the course of the program's running.
Parameters: None.
Returns: None.
Global Influence: Affects the program's global variable 'state'.
*/

void IRQ_handler()
{
    // Handle GPIO interrupts in general
    if (*IRQ_PENDING_2 == 0x00100000) {
		if (*GPEDS0 == (0x1 << SWITCH_A)) {
			*GPEDS0 = (0x1 << SWITCH_A);
			LIGHTSTATE = 1;
		}
		if (*GPEDS0 == (0x1 << SWITCH_B)) {
			*GPEDS0 = (0x1 << SWITCH_B);
			LIGHTSTATE = 0;
		}
    }
    return;
}
