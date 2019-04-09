#include "tfmini.h"
#include "motor_control.h"
#include "drivers/mss_i2c/mss_i2c.h"
#include "motor_control.h"
#include<stdlib.h>
#include<stdio.h>
#include<assert.h>
#include<math.h>

double logcalculator(int pow){
	return exp(pow) + 30;
}

__attribute__ ((interrupt)) void Fabric_IRQHandler( void )
{
	int distance = measure();
		if(distance == -1){
			assert(0);
		}
		int assign_level = 5;
		int power = 2;
		int level = -1;

		while(assign_level >= 0 && level == -1){
			if(distance < logcalculator(power)){
				level = assign_level;
			}
			assign_level--;
			power++;
		}

		if(level == -1){
			// fail
			return 1;
		}

		// call the level to the motor control
		MSS_I2C_init( &g_mss_i2c1, DRV2605_ADDR, MSS_I2C_PCLK_DIV_256 );

		init();
		selectLibrary(1);

		// I2C trigger by sending 'go' command
		// default, internal trigger when sending GO command
		setMode(DRV2605_MODE_INTTRIG);

		setWaveform(0, 69 - level);
		setWaveform(1, 0);       // end waveform

		go();
    NVIC_ClearPendingIRQ( Fabric_IRQn );
}
int main(){
    NVIC_EnableIRQ(Fabric_IRQn);
    while(1){
    }
}
