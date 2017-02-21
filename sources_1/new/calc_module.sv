`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2016 19:52:43
// Design Name: 
// Module Name: calc_module
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


module calc_module(input logic clk,
                   input logic reset,
                   input logic en,
                   input logic combo,
                   input logic [1:0] level,
                   input logic life,
                   output logic [7:0] o_combo,
                   output logic [11:0] o_score,
                   output logic [1:0] o_life);

    logic [7:0] combo_i = 8'b1;
    logic [1:0] life_i = 2'b11;
    logic [15:0] score_i = 16'b0;
    
    // combo calculation
    always_ff@(posedge clk)
        if (reset | combo == 0)  
             combo_i <= 8'b1;
        else if (en & combo == 1 & life_i != 0)  
            combo_i <= combo_i + 1;
         
    // life calculation
    always_ff@(posedge clk)
         if (reset)  
              life_i <= 2'b11;
         else if (en & life == 0)  
          begin
             if (life_i != 0)
               life_i <= life_i - 1;
          end         
 
    // score calculation 
    always_ff@(posedge clk)
         if (reset)  
             score_i <= 16'b0;
         else if (en & life_i != 0)  
           begin
              score_i <= score_i + (level * combo_i);
            end         
        
    assign o_score = score_i; 
    assign o_combo = combo_i;
    assign o_life = life_i;     
endmodule
