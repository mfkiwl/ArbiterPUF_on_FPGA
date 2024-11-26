`timescale 1ns / 1ps

module mux2x1 (
    input in_0,
    input in_1,
    input sel,
    output wire out
);
    assign out = (sel) ? in_1 : in_0;
endmodule 
