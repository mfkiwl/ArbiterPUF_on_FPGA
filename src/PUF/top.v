`timescale 1ns / 1ps

module top #(parameter N = 128) (
    input wire in,
    input wire reset,
    input wire clk,
    input wire btn_send,
    input wire switch_lfsr,
    input wire reset_lfsr,
    output wire busy,
    output wire tx
);
    
    wire [N-1:0] sel;
    assign sel = 128'h9acbe941a5b8202ef4ed6ba07a951d19;
    LFSR_128 lfsr (
        .clk(clk),
        .rst(reset_lfsr),
        .en(switch_lfsr),
        .stage(sel)
    );
    
    wire out;
    
    reg send = 0;
    reg [7:0] data;
    reg sending = 0;
    reg [7:0] bit_index = 0;
    
    wire uart_busy;
    assign busy = uart_busy;

    uart_tx uart (
        .clk(clk),
        .data(data),
        .send(send),
        .tx(tx),
        .busy(uart_busy)
    );
    
    reg button_sync1, button_sync2;
    reg button_prev;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            button_sync1 <= 0;
            button_sync2 <= 0;
        end else begin
            button_sync1 <= btn_send;
            button_sync2 <= button_sync1;
        end
    end

    always @(posedge clk or negedge reset) begin
        if (!reset)
            button_prev <= 0;
        else
            button_prev <= button_sync2;
    end

    wire button_pressed = (button_sync2 && !button_prev);
    
    // Intermediate signals for multiplexer stages
    wire [N-1:0] m;
    wire [N-1:0] n;
    
    // First multiplexer block
    mux_block block0 (
        .in_up(in),
        .in_down(in),
        .sel(sel[0]),
        .out_up(m[0]),  
        .out_down(n[0])
    );
    
    generate
        genvar i;
        for (i = 0; i < N-1; i = i+1) begin: mux_block_chain
            mux_block block (
                .in_up(m[i]),
                .in_down(n[i]),
                .sel(sel[i+1]),
                .out_up(m[i+1]),
                .out_down(n[i+1])
            );
        end
    endgenerate
    
    d_latch latch (
        .D(m[N-1]),
        .clk(n[N-1]),
        .Q(out)
    );
    
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            send <= 1'b0;
        end else begin
            if (button_pressed && !uart_busy) begin
                data <= (out) ? 49 : 48;
                send <= 1'b1;
            end else begin
                send <= 1'b0;
            end
        end
    end
endmodule