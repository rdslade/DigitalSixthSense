// LINK TO GITHUB ARDUINO CODE: https://github.com/adafruit/Adafruit_DRV2605_Library
// NEED TO PORT ARDUINO CODE, motor_control.h has the functions arduino implements, may not need all of them

#include "drivers/mss_i2c/mss_i2c.h"

//int main()
//{
//    MSS_I2C_init( &g_mss_i2c0, MOTOR_CONTROL_ADDR, MSS_I2C_PCLK_DIV_256 );
//
//    uint8_t setup_buffer[3] = {1, 2, 7};
//
//    MSS_I2C_write( &g_mss_i2c0, TFMINI_ADDR, setup_buffer,
//					sizeof(setup_buffer), MSS_I2C_RELEASE_BUS );
//
//    uint8_t status = MSS_I2C_wait_complete( &g_mss_i2c0, MSS_I2C_NO_TIMEOUT );
//
//
//    printf("d", status);
//}
