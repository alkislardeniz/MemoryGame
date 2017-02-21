`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2016 11:18:33
// Design Name: 
// Module Name: level1_fsm
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


module level1_fsm(input logic clk,
                  input logic reset,
                  input logic en,
                  input logic entered,
                  output logic combo,
                  output logic life,
                  output logic [8:0] seq,
                  output logic [4:0] o_state,
                  output logic answer);
                          
    logic [3:0] state, nextState;
    logic [8:0] random = 9'b101010101;
    
    // 9 states
    localparam S0 = 4'b0000;      
    localparam S1 = 4'b0001;           
    localparam S2 = 4'b0010;
    localparam S3 = 4'b0011;   
    localparam S4 = 4'b0100; 
    localparam S5 = 4'b0101;
    localparam S6 = 4'b0110;
    localparam S7 = 4'b0111;
    localparam S8 = 4'b1000;
        
    always_ff@(posedge clk)
        if (reset) state <= S0;
        else if (en)  state <= nextState;      
        
    always_comb
        case(state)
         S0: if (entered == random[8]) begin
               	combo <= 1'b1;
               	life <= 1'b1;
		        answer <= 1'b0;
                nextState <= S1; end
             else begin
                combo <= 1'b0;
                life <= 1'b0;
		        answer <= 1'b0;
                nextState <= S0; end
               
         S1: if (entered == random[7]) begin
                combo <= 1'b1;
                life <= 1'b1;
		        answer <= 1'b0;
                nextState <= S2; end
             else begin
                combo <= 1'b0;
                life <= 1'b0;
		        answer <= 1'b0;
                nextState <= S1; end 

         S2: if (entered == random[6]) begin
                combo <= 1'b1;
                life <= 1'b1;
		        answer <= 1'b0;
                nextState <= S3; end
             else begin
                combo <= 1'b0;
                life <= 1'b0;
		        answer <= 1'b0;
                nextState <= S2; end 

         S3: if (entered == random[5]) begin
                combo <= 1'b1;
                life <= 1'b1;
		        answer <= 1'b0;
                nextState <= S4; end
             else begin
                combo <= 1'b0;
                life <= 1'b0;
		        answer <= 1'b0;
                nextState <= S3; end 

         S4: if (entered == random[4]) begin
                combo <= 1'b1;
                life <= 1'b1;
		        answer <= 1'b0;
                nextState <= S5; end
             else begin
                combo <= 1'b0;
                life <= 1'b0;
		        answer <= 1'b0;
                nextState <= S4; end 

         S5: if (entered == random[3]) begin
                combo <= 1'b1;
                life <= 1'b1;
		        answer <= 1'b0;
                nextState <= S6; end
             else begin
                combo <= 1'b0;
                life <= 1'b0;
		        answer <= 1'b0;
                nextState <= S5; end 

         S6: if (entered == random[2]) begin
                combo <= 1'b1;
                life <= 1'b1;
		        answer <= 1'b0;
                nextState <= S7; end
             else begin
                combo <= 1'b0;
                life <= 1'b0;
		        answer <= 1'b0;
                nextState <= S6; end 

         S7: if (entered == random[1]) begin
                combo <= 1'b1;
                life <= 1'b1;
		        answer <= 1'b0;
                nextState <= S8; end
             else begin
                combo <= 1'b0;
                life <= 1'b0; 
		        answer <= 1'b0;
                nextState <= S7; end            
                
         S8: if (entered == random[0]) begin
                combo <= 1'b1;
                life <= 1'b1;
                answer <= 1'b1;
                nextState <= S0; end
             else begin
                combo <= 1'b0;
                life <= 1'b0; 
                answer <= 1'b0;
                nextState <= S8; end                                                                  
           endcase         
    assign seq = random;   
    assign o_state = state;
             
endmodule
