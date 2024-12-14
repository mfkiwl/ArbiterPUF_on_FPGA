`timescale 1ns / 1ps

module LFSR_128 (
    input clk,
    input rst,
    input en,
    output reg [127:0] stage
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage <= 128'h9acbe941a5b8202ef4ed6ba07a951d19;
        end else if (en) begin
            stage [0] <= stage [1];
            stage [1] <= stage [2];
            stage [2] <= stage [3];
            stage [3] <= stage [4];
            stage [4] <= stage [5];
            stage [5] <= stage [6];
            stage [6] <= stage [7];
            stage [7] <= stage [8];
            stage [8] <= stage [9];
            stage [9] <= stage [10];
            stage [10] <= stage [11];
            stage [11] <= stage [12];
            stage [12] <= stage [13];
            stage [13] <= stage [14];
            stage [14] <= stage [15];
            stage [15] <= stage [16];
            stage [16] <= stage [17];
            stage [17] <= stage [18];
            stage [18] <= stage [19];
            stage [19] <= stage [20];
            stage [20] <= stage [21];
            stage [21] <= stage [22];
            stage [22] <= stage [23];
            stage [23] <= stage [24];
            stage [24] <= stage [25];
            stage [25] <= stage [26];
            stage [26] <= stage [27];
            stage [27] <= stage [28];
            stage [28] <= stage [29];
            stage [29] <= stage [30];
            stage [30] <= stage [31];
            stage [31] <= stage [32];
            stage [32] <= stage [33];
            stage [33] <= stage [34];
            stage [34] <= stage [35];
            stage [35] <= stage [36];
            stage [36] <= stage [37];
            stage [37] <= stage [38];
            stage [38] <= stage [39];
            stage [39] <= stage [40];
            stage [40] <= stage [41];
            stage [41] <= stage [42];
            stage [42] <= stage [43];
            stage [43] <= stage [44];
            stage [44] <= stage [45];
            stage [45] <= stage [46];
            stage [46] <= stage [47];
            stage [47] <= stage [48];
            stage [48] <= stage [49];
            stage [49] <= stage [50];
            stage [50] <= stage [51];
            stage [51] <= stage [52];
            stage [52] <= stage [53];
            stage [53] <= stage [54];
            stage [54] <= stage [55];
            stage [55] <= stage [56];
            stage [56] <= stage [57];
            stage [57] <= stage [58];
            stage [58] <= stage [59];
            stage [59] <= stage [60];
            stage [60] <= stage [61];
            stage [61] <= stage [62];
            stage [62] <= stage [63];
            stage [63] <= stage [64];
            stage [64] <= stage [65];
            stage [65] <= stage [66];
            stage [66] <= stage [67];
            stage [67] <= stage [68];
            stage [68] <= stage [69];
            stage [69] <= stage [70];
            stage [70] <= stage [71];
            stage [71] <= stage [72];
            stage [72] <= stage [73];
            stage [73] <= stage [74];
            stage [74] <= stage [75];
            stage [75] <= stage [76];
            stage [76] <= stage [77];
            stage [77] <= stage [78];
            stage [78] <= stage [79];
            stage [79] <= stage [80];
            stage [80] <= stage [81];
            stage [81] <= stage [82];
            stage [82] <= stage [83];
            stage [83] <= stage [84];
            stage [84] <= stage [85];
            stage [85] <= stage [86];
            stage [86] <= stage [87];
            stage [87] <= stage [88];
            stage [88] <= stage [89];
            stage [89] <= stage [90];
            stage [90] <= stage [91];
            stage [91] <= stage [92];
            stage [92] <= stage [93];
            stage [93] <= stage [94];
            stage [94] <= stage [95];
            stage [95] <= stage [96];
            stage [96] <= stage [97];
            stage [97] <= stage [98];
            stage [98] <= stage [99] ^ stage[0];
            stage [99] <= stage [100];
            stage [100] <= stage [101] ^ stage[0];
            stage [101] <= stage [102];
            stage [102] <= stage [103];
            stage [103] <= stage [104];
            stage [104] <= stage [105];
            stage [105] <= stage [106];
            stage [106] <= stage [107];
            stage [107] <= stage [108];
            stage [108] <= stage [109];
            stage [109] <= stage [110];
            stage [110] <= stage [111];
            stage [111] <= stage [112];
            stage [112] <= stage [113];
            stage [113] <= stage [114];
            stage [114] <= stage [115];
            stage [115] <= stage [116];
            stage [116] <= stage [117];
            stage [117] <= stage [118];
            stage [118] <= stage [119];
            stage [119] <= stage [120];
            stage [120] <= stage [121];
            stage [121] <= stage [122];
            stage [122] <= stage [123];
            stage [123] <= stage [124];
            stage [124] <= stage [125];
            stage [125] <= stage [126] ^ stage[0];
            stage [126] <= stage [127];
            stage [127] <= stage [0];
        end
    end
endmodule