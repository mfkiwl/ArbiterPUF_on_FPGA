`timescale 1ns / 1ps

module mux_block(
    input in_up,
    input in_down,
    input sel,
    output out_up,
    output out_down
);

    mux2x1 mux_up(in_up, in_down,sel, out_up);
    mux2x1 mux_down(in_down, in_up, sel, out_down);
  
endmodule
