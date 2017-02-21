`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2016 01:15:27 PM
// Design Name: 
// Module Name: vga_module
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


module vga_module (input logic clk, 
                   input logic [1:0] o_level,
                   input logic display,
                   input logic [8:0] seq1,
                   input logic [15:0] seq2,
                   input logic [24:0] seq3, 
                   input logic [7:0] o_combo,
                   input logic [11:0] o_score,
                   input logic [1:0] o_life,   
                   input logic [4:0] o_state, 
                   output logic vga_hsync, 
                   output logic vga_vsync, 
                   output logic vga_red0, 
                   output logic vga_green0, 
                   output logic vga_blue0);
	
	logic [9:0] counterY;	  
	logic [10:0] counterX;	
	logic valid;
	
    logic clk_out;
	clk_divide clk_div(1, clk, clk_out);
	
	sync syncVGA(clk_out, o_level, display, seq1, seq2, seq3, o_combo, o_score, o_life, o_state,
	             counterX, counterY, valid, vga_hsync, vga_vsync);
	
	logic answer; // correct and wrong answer indicator square
	int xPoz = 670;
	int yPoz = 20;
	
	always@(*) begin
	   answer <= ((counterX >= xPoz) && (counterX <  xPoz + 50)) && ((counterY >= yPoz) && (counterY < yPoz + 25)); end
    
    // color assign    
	logic red0 = valid || (answer && (o_combo == 1) && (o_score != 0));	
	logic green0 = valid || (answer && (o_combo != 1) && (o_score != 0));
	logic blue0 = valid;
		
	assign vga_red0 = red0 ? 1'b1 : 1'b0;
	assign vga_green0 = green0 ? 1'b1 : 1'b0;
	assign vga_blue0 = blue0 ? 1'b1 : 1'b0;
	
endmodule
