#include "drivers/mss_uart/mss_uart.h"

#define TFMINI_ADDR 0x10

int main()
{
	MSS_UART_init
	     (
	         &g_mss_uart1,
	         MSS_UART_115200_BAUD,
	         MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT
	     );

    uint8_t setup_buffer[8] = {0x42, 0x57, 0x02, 0x00, 0x00, 0x00, 0x01, 0x06};

    MSS_UART_polled_tx( &g_mss_uart1, setup_buffer, sizeof(setup_buffer) );

    uint8_t rx_buff[8];

    int rx_size = MSS_UART_get_rx( &g_mss_uart1, rx_buff, sizeof(rx_buff) );

}
