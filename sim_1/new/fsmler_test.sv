`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2016 19:03:17
// Design Name: 
// Module Name: fsmler_test
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


module fsmler_test();
    logic clk;
    logic reset;
    logic en;
    logic button;
    logic [1:0] level;
    logic disp;
    logic [8:0] seq1;
    logic [15:0] seq2;
    logic [24:0] seq3; 
    logic [7:0] o_combo;
    logic [11:0] o_score;
    logic [1:0] o_life;
    
    fsmler fsm(clk, reset, en, button, level, disp, seq1, seq2, seq3, o_combo, o_score, o_life);
    
    always
    begin 
        clk = 1; #5; 
        clk = 0; #5;
    end
        
    initial begin
        reset = 1; en = 1; button = 1;#10; 
        reset = 0; #10; 
    end      
    
    
endmodule
