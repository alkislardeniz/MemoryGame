`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2016 18:22:22
// Design Name: 
// Module Name: top_module
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


module top_module(input logic clk,
                  input logic reset,
                  input logic en,
                  input logic button,
                  output logic vga_hsync, 
                  output logic vga_vsync, 
                  output logic vga_red0, 
                  output logic  vga_green0, 
                  output logic  vga_blue0);
      
    logic [1:0] level;
    logic disp;
    logic [8:0] seq1;
    logic [15:0] seq2;
    logic [24:0] seq3; 
    logic [7:0] o_combo;
    logic [11:0] o_score;
    logic [1:0] o_life;
    logic [4:0] o_state;
    
    // fsm modules      
    fsmler middle(clk, reset, en, button, 
                  level, disp, seq1, seq2, seq3, o_combo, o_score, o_life, o_state);
     
    // vga module             
    vga_module vga(clk, level, disp, seq1, seq2, seq3, o_combo, o_score, o_life, o_state,
            vga_hsync, vga_vsync, vga_red0, vga_green0, vga_blue0);                        
endmodule
