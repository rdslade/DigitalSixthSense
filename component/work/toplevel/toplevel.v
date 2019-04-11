//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Apr 11 14:51:12 2019
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// toplevel
module toplevel(
    // Inputs
    MSS_RESET_N,
    UART_0_RXD,
    UART_1_RXD,
    // Outputs
    FAB_INT_OUT,
    UART_0_TXD,
    UART_1_TXD,
    // Inouts
    I2C_0_SCL,
    I2C_0_SDA,
    I2C_1_SCL,
    I2C_1_SDA
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  MSS_RESET_N;
input  UART_0_RXD;
input  UART_1_RXD;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output FAB_INT_OUT;
output UART_0_TXD;
output UART_1_TXD;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  I2C_0_SCL;
inout  I2C_0_SDA;
inout  I2C_1_SCL;
inout  I2C_1_SDA;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   core_0_FAB_CLK;
wire   FAB_INT_OUT_net_0;
wire   I2C_0_SCL;
wire   I2C_0_SDA;
wire   I2C_1_SCL;
wire   I2C_1_SDA;
wire   MSS_RESET_N;
wire   UART_0_RXD;
wire   UART_0_TXD_net_0;
wire   UART_1_RXD;
wire   UART_1_TXD_net_0;
wire   UART_1_TXD_net_1;
wire   UART_0_TXD_net_1;
wire   FAB_INT_OUT_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign UART_1_TXD_net_1  = UART_1_TXD_net_0;
assign UART_1_TXD        = UART_1_TXD_net_1;
assign UART_0_TXD_net_1  = UART_0_TXD_net_0;
assign UART_0_TXD        = UART_0_TXD_net_1;
assign FAB_INT_OUT_net_1 = FAB_INT_OUT_net_0;
assign FAB_INT_OUT       = FAB_INT_OUT_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------core
core core_0(
        // Inputs
        .UART_0_RXD  ( UART_0_RXD ),
        .UART_1_RXD  ( UART_1_RXD ),
        .MSS_RESET_N ( MSS_RESET_N ),
        .FABINT      ( FAB_INT_OUT_net_0 ),
        // Outputs
        .UART_0_TXD  ( UART_0_TXD_net_0 ),
        .UART_1_TXD  ( UART_1_TXD_net_0 ),
        .FAB_CLK     ( core_0_FAB_CLK ),
        // Inouts
        .I2C_1_SDA   ( I2C_1_SDA ),
        .I2C_1_SCL   ( I2C_1_SCL ),
        .I2C_0_SCL   ( I2C_0_SCL ),
        .I2C_0_SDA   ( I2C_0_SDA ) 
        );

//--------timer
timer timer_0(
        // Inputs
        .clk         ( core_0_FAB_CLK ),
        // Outputs
        .FAB_INT_OUT ( FAB_INT_OUT_net_0 ) 
        );


endmodule
