//mb_blink.c
//
//Provided boilerplate "LED Blink" code for ECE 385
//First released in ECE 385, Fall 2023 distribution
//
//Note: you will have to refer to the memory map of your MicroBlaze
//system to find the proper address for the LED GPIO peripheral.
//
//Modified on 7/25/23 Zuofu Cheng

#include <stdio.h>
#include <xparameters.h>
#include <xil_types.h>
#include <sleep.h>

#include "platform.h"

#define MOD 65536

volatile uint32_t* led_gpio_data = XPAR_AXI_GPIO_0_BASEADDR;  //Hint: either find the manual address (via the memory map in the block diagram, or
															 //replace with the proper define in xparameters (part of the BSP). Either way
															 //this is the base address of the GPIO corresponding to your LEDs
															 //(similar to 0xFFFF from MEM2IO from previous labs).
volatile uint32_t* accu =  XPAR_AXI_GPIO_1_BASEADDR;

volatile uint32_t* clr =  XPAR_AXI_GPIO_2_BASEADDR;

volatile uint32_t* acc = XPAR_AXI_GPIO_3_BASEADDR;

int main()
{
    init_platform();
    int dum = 0;
	while (1+1 != 3)
	{
		sleep(1);
		if (*clr) {
			dum = 0; // clear
			while (*clr); // debounce
		} else if (*acc) {
			if (((MOD - dum) <= (*accu))) {
				printf("Overflow!\r\n");
			}
			dum = (dum + *accu) % MOD; // accu
			while (*acc); // debounce
		}
		*led_gpio_data = dum;
		printf("Led On!\r\n");
		sleep(1);
		*led_gpio_data = 0; //blinks LED
		printf("Led Off!\r\n");
	}

    cleanup_platform();

    return 0;
}
