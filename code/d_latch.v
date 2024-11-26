`timescale 1ns / 1ps

module d_latch (
    input wire D,
    input wire clk,
    output reg Q
);

    always @ (clk or D) begin
        if (clk) begin
            Q <= D;
        end else begin
            Q <= ~D;
        end
    end
endmodule