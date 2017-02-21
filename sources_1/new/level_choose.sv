`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2016 11:22:59
// Design Name: 
// Module Name: level_choose
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


module level_choose(input logic clk,
                    input logic reset,
                    input logic en,
                    input logic ans,
                    input logic [1:0] life,
                    output logic disp,
                    output logic [1:0] level);

        logic [2:0] state, nextState;
        
        localparam S0 = 3'b000;      
        localparam S1 = 3'b001;           
        localparam S2 = 3'b010;
        localparam S3 = 3'b011;   
        localparam S4 = 3'b100; 
        localparam S5 = 3'b101;
        
        always_ff@(posedge clk)
            if (reset | life == 2'b00) state <= S0;
            else if (en)  state <= nextState;      
                                     
        always_comb
         case(state)
             S0: nextState <= S1;
             
             S1: if (ans) nextState <= S2;
                 else     nextState <= S1;
             
             S2: nextState <= S3;
             
             S3: if (ans) nextState <= S4;
                 else     nextState <= S3;
             
             S4: nextState <= S5;
             
             S5: if (ans) nextState <= S0;
                 else     nextState <= S5;
             endcase  
         
         // decides levels and pattern display     
         assign disp = ((state == S0) | (state == S2) | (state == S4));  
         assign level[0] = ~((state == S2) | (state == S3));
         assign level[1] = ~((state == S0) | (state == S1));
endmodule
