`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2016 14:17:47
// Design Name: 
// Module Name: num_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module num_gen(input logic [3:0] num, output logic [14:0] num_seq);

    always_comb
        case (num)
        
        4'b0000: num_seq <= 15'b111101101101111;
        4'b0001: num_seq <= 15'b001001001001001;
        4'b0010: num_seq <= 15'b111001111100111;
        4'b0011: num_seq <= 15'b111001011001111;
        4'b0100: num_seq <= 15'b101101111001001;
        4'b0101: num_seq <= 15'b111100111001111;
        4'b0110: num_seq <= 15'b111100111101111;
        4'b0111: num_seq <= 15'b111001001001001;
        4'b1000: num_seq <= 15'b111101111101111;
        4'b1001: num_seq <= 15'b111101111001111;
        default: num_seq <= 15'b0;
        endcase
      
endmodule
