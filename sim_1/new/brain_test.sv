`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2016 10:54:16
// Design Name: 
// Module Name: brain_test
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


module brain_test();
    logic clk;
    logic reset;
    logic en;
    logic button;
    logic [1:0] level;
    logic [8:0] seq1;
    logic [15:0] seq2;
    logic [24:0] seq3; 
    logic answer;
    logic [7:0] o_combo;
    logic [11:0] o_score;
    logic [1:0] o_life;
    
                      
    game_brain brain (clk, reset, en, button, level, 
                      seq1, seq2, seq3, answer, o_combo, o_score, o_life);
    
    always
       begin 
       clk = 1; #5; 
       clk = 0; #5;
       end
            
    initial begin
    reset = 1; en = 1; button = 1; level = 2'b01; #10; 
    reset = 0; #10; 

    //level = 2'b10; #10; 
    end  
endmodule