`timescale 1ns / 1ps

module uart_tx (
    input wire clk,
    input wire [7:0] data,
    input wire send,
    output reg tx,
    output reg busy
);

    parameter BAUD_RATE = 9600;
    parameter CLOCK_FREQ = 100_000_000;   // 100 MHz
    parameter CLOCKS_PER_BIT = CLOCK_FREQ / BAUD_RATE;
    parameter IDLE = 1'b1;    // inactive

    reg [3:0] state = 0;
    reg [13:0] clock_counter = 0;
    reg [2:0] bit_index = 0;
    reg [7:0] tx_data = 0;
    
    parameter STATE_IDLE = 0,
               STATE_START = 1,
               STATE_DATA = 2,
               STATE_STOP = 3;
               
    always @(posedge clk) begin
        case (state)
            STATE_IDLE: begin
                tx <= IDLE;
                busy <= 0;
                if (send == 1) begin
                    tx_data <= data;
                    state <= STATE_START;
                    busy <= 1;
                    clock_counter <= 0;
                end
            end
            STATE_START: begin
                tx <= 0;  // send start bit
                if (clock_counter < CLOCKS_PER_BIT - 1)
                    clock_counter <= clock_counter + 1;
                else begin
                    clock_counter <= 0;
                    state <= STATE_DATA;
                    bit_index <= 0;
                end
            end
            STATE_DATA: begin
                tx <= tx_data[bit_index];
                if (clock_counter < CLOCKS_PER_BIT - 1)
                    clock_counter <= clock_counter + 1;
                else begin
                    clock_counter <= 0;
                    if (bit_index < 7)
                        bit_index <= bit_index + 1;
                    else
                        state <= STATE_STOP;
                end
            end
            STATE_STOP: begin
                tx <= 1;  // stop bit
                if (clock_counter < CLOCKS_PER_BIT - 1)
                    clock_counter <= clock_counter + 1;
                else begin
                    state <= STATE_IDLE;  // come to IDLE
                    busy <= 0;
                end
            end
        endcase
    end
endmodule