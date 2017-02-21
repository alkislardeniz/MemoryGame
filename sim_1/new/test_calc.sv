`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2016 21:56:04
// Design Name: 
// Module Name: test_calc
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


module test_calc();
    logic clk;
    logic reset;
    logic en;
    logic combo;
    logic [1:0] level;
    logic life;
    logic [7:0] o_combo;
    logic [15:0] o_score;
    logic [1:0] o_life;

    calc_module calc (clk, reset, en, combo, level, life, 
             o_combo, o_score, o_life);
    
    always
       begin 
       clk = 1; #5; 
       clk = 0; #5;
       end
            
    initial begin
    reset = 1; en = 1; combo = 1; level = 2'b01; life = 1; #10; 
    reset = 0; combo = 1; #10;
    combo = 1; #10;  
    combo = 0; life = 0; #10;
    end  
endmodule
