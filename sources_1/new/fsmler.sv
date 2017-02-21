`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2016 18:53:18
// Design Name: 
// Module Name: fsmler
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


module fsmler(input logic clk,
              input logic reset,
              input logic en,
              input logic button,
              output logic [1:0] level,
              output logic disp,
              output logic [8:0] seq1,
              output logic [15:0] seq2,
              output logic [24:0] seq3, 
              output logic [7:0] o_combo,
              output logic [11:0] o_score,
              output logic [1:0] o_life,
              output logic [4:0] o_state);
              
    logic clk_out;
    clk_divide div(300000000, clk, clk_out); 
    
    logic ans;
    logic [1:0] level_w;
    logic [1:0] life_w;
    
    // level chooser fsm
    level_choose chs(clk_out, reset, en, ans, life_w, disp, level_w);
    
    // resets the game if life is 0
    logic reset_new;
    always@(*) begin
    if (life_w != 2'b00)
        reset_new = reset;
    else 
        reset_new = 1'b1; end         
    
    // game logic and levels fsm  
    game_brain brain(clk_out, reset_new, en, button, level_w, seq1, seq2, seq3, ans, o_combo, o_score, life_w, o_state);
   
    assign level = level_w;
    assign o_life = life_w;                
endmodule
