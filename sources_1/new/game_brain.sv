`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2016 09:47:16
// Design Name: 
// Module Name: game_brain
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


module game_brain(input logic clk,
                  input logic reset,
                  input logic en,
                  input logic button,
                  input logic [1:0] level,
                  output logic [8:0] seq1,
                  output logic [15:0] seq2,
                  output logic [24:0] seq3, 
                  output logic answer,
                  output logic [7:0] o_combo,
                  output logic [11:0] o_score,
                  output logic [1:0] o_life,
                  output logic [4:0] o_state);
                  
    logic en_lv1, en_lv2, en_lv3, cmb1, lf1, ans1, 
          cmb2, lf2, ans2, cmb3, lf3, ans3, clk_en;
    logic [7:0] mx;
    logic [4:0] state1, state2, state3;
        
    decoder dec(level, en_lv1, en_lv2, en_lv3);
    
    logic e1, e2, e3;
    assign e1 = (en == 0) ? 0: en_lv1;
    assign e2 = (en == 0) ? 0: en_lv2;
    assign e3 = (en == 0) ? 0: en_lv3;
    
    level1_fsm lv1(clk, reset, e1, button, cmb1, lf1, seq1, state1, ans1);   
    level2_fsm lv2(clk, reset, e2, button, cmb2, lf2, seq2, state2, ans2);    
    level3_fsm lv3(clk, reset, e3, button, cmb3, lf3, seq3, state3, ans3);   
    mux4 mux( {state1, cmb1, lf1, ans1}, {state2, cmb2, lf2, ans2}, {state3, cmb3, lf3, ans3}, level, mx);
    
    calc_module calc(clk, reset, en, mx[2], level, mx[1], o_combo, o_score, o_life);
     
    assign answer = mx[0]; 
    assign o_state = {mx[7], mx[6], mx[5], mx[4], mx[3]};         
endmodule
