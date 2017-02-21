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


module level3_fsm(input logic clk,
                  input logic reset,
                  input logic en,
                  input logic entered,
                  output logic combo,
                  output logic life,
                  output logic [24:0] seq,
                  output logic [4:0] o_state,
                  output logic answer);
                              
           logic [4:0] state, nextState;
           logic[24:0] random = 25'b1010101010101010101010101;
           
           // 25 states                     
           localparam S0 = 5'b00000;      
           localparam S1 = 5'b00001;           
           localparam S2 = 5'b00010;
           localparam S3 = 5'b00011;   
           localparam S4 = 5'b00100; 
           localparam S5 = 5'b00101;
           localparam S6 = 5'b00110;
           localparam S7 = 5'b00111;
           localparam S8 = 5'b01000;
           localparam S9 = 5'b01001;
           localparam S10 = 5'b01010;
           localparam S11 = 5'b01011;
           localparam S12 = 5'b01100;  
           localparam S13 = 5'b01101;    
           localparam S14 = 5'b01110;
           localparam S15 = 5'b01111;
           localparam S16 = 5'b10000;
           localparam S17 = 5'b10001;  
           localparam S18 = 5'b10010;    
           localparam S19 = 5'b10011;
           localparam S20 = 5'b10100;
           localparam S21 = 5'b10101;
           localparam S22 = 5'b10110;  
           localparam S23 = 5'b10111;    
           localparam S24 = 5'b11000;
           localparam S25 = 5'b11001;
                                                        
           always_ff@(posedge clk)
                     if (reset) state <= S0;
                     else if (en)  state <= nextState;      
                                     
           always_comb
                case(state)
                 S0: if (entered == random[24]) begin
                        combo <= 1'b1;
                        life <= 1'b1;
                        answer <= 1'b0;
                        nextState <= S1; end
                     else begin
                        combo <= 1'b0;
                        life <= 1'b0;
                        answer <= 1'b0;
                        nextState <= S0; end
                                            
                 S1: if (entered == random[23]) begin
                        combo <= 1'b1;
                        life <= 1'b1;
                        answer <= 1'b0;
                        nextState <= S2; end
                     else begin
                        combo <= 1'b0;
                        life <= 1'b0;
                        answer <= 1'b0;
                        nextState <= S1; end 
                             
                 S2: if (entered == random[22]) begin
                        combo <= 1'b1;
                        life <= 1'b1;
                        answer <= 1'b0;
                        nextState <= S3; end
                     else begin
                        combo <= 1'b0;
                        life <= 1'b0;
                        answer <= 1'b0;
                        nextState <= S2; end 
                             
                 S3: if (entered == random[21]) begin
                        combo <= 1'b1;
                        life <= 1'b1;
                        answer <= 1'b0;
                        nextState <= S4; end
                     else begin
                        combo <= 1'b0;
                        life <= 1'b0;
                        answer <= 1'b0;
                        nextState <= S3; end 
                             
                S4: if (entered == random[20]) begin
                        combo <= 1'b1;
                        life <= 1'b1;
                        answer <= 1'b0;
                        nextState <= S5; end
                    else begin
                        combo <= 1'b0;
                        life <= 1'b0;
			            answer <= 1'b0;
                        nextState <= S4; end 
                             
                 S5: if (entered == random[19]) begin
                        combo <= 1'b1;
                        life <= 1'b1;
			            answer <= 1'b0;
                        nextState <= S6; end
                     else begin
			            combo <= 1'b0;
                        life <= 1'b0;
                        answer <= 1'b0;
                        nextState <= S5; end 
                             
                 S6: if (entered == random[18]) begin
                        combo <= 1'b1;
                        life <= 1'b1;
                        answer <= 1'b0;
                        nextState <= S7; end
                     else begin
                        combo <= 1'b0;
                        life <= 1'b0;
                        answer <= 1'b0;
                        nextState <= S6; end 
                      
	             S7: if (entered == random[17]) begin
                         combo <= 1'b1;
                         life <= 1'b1;
                         answer <= 1'b0;
                         nextState <= S8; end
                     else begin
                         combo <= 1'b0;
                         life <= 1'b0; 
                         answer <= 1'b0;
                         nextState <= S7; end            
                                             
                  S8: if (entered == random[16]) begin
                         combo <= 1'b1;
                         life <= 1'b1;
                         answer <= 1'b0;
                         nextState <= S9; end
                      else begin
                         combo <= 1'b0;
                         life <= 1'b0; 
                         answer <= 1'b0;
                         nextState <= S8; end 
                                      
                 S9: if (entered == random[15]) begin
                         combo <= 1'b1;
                         life <= 1'b1;
                         answer <= 1'b0;
                         nextState <= S10; end
                     else begin
                         combo <= 1'b0;
                         life <= 1'b0; 
                         answer <= 1'b0;
                         nextState <= S9; end    
                                                  
                S10: if (entered == random[14]) begin
                         combo <= 1'b1;
                         life <= 1'b1;
                         answer <= 1'b0;
                         nextState <= S11; end
                    else begin
                         combo <= 1'b0;
                         life <= 1'b0; 
                         answer <= 1'b0;
                         nextState <= S10; end 
                                      
               S11: if (entered == random[13]) begin
                         combo <= 1'b1;
                         life <= 1'b1;
                         answer <= 1'b0;
                         nextState <= S12; end
                    else begin
                         combo <= 1'b0;
                         life <= 1'b0; 
                         answer <= 1'b0;
                         nextState <= S11; end 
                S12: if (entered == random[12]) begin
                         combo <= 1'b1;
                         life <= 1'b1;
                         answer <= 1'b0;
                         nextState <= S13; end
                     else begin
                         combo <= 1'b0;
                         life <= 1'b0; 
                         answer <= 1'b0;
                         nextState <= S12; end          
		        S13: if (entered == random[11]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S14; end
                     else begin
                          combo <= 1'b0;
                          life <= 1'b0; 
                          answer <= 1'b0;
                          nextState <= S13; end               
                                      
                 S14: if (entered == random[10]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S15; end
                      else begin
                          combo <= 1'b0;
                          life <= 1'b0; 
                          answer <= 1'b0;
                          nextState <= S14; end 
                                                  
                 S15: if (entered == random[9]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S16; end
                       else begin
                          combo <= 1'b0;
                          life <= 1'b0; 
                          answer <= 1'b0;
                          nextState <= S15; end
                 S16: if (entered == random[8]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S17; end
                      else begin
                          combo <= 1'b0;
                          life <= 1'b0;
                          answer <= 1'b0;
                          nextState <= S16; end
                                                                                
                 S17: if (entered == random[7]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S18; end
                      else begin
                          combo <= 1'b0;
                          life <= 1'b0;
                          answer <= 1'b0;
                          nextState <= S17; end 
                                                                 
                 S18: if (entered == random[6]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S19; end
                      else begin
                          combo <= 1'b0;
                          life <= 1'b0;
                          answer <= 1'b0;
                          nextState <= S18; end 
                                                                 
                 S19: if (entered == random[5]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S20; end
                      else begin
                          combo <= 1'b0;
                          life <= 1'b0;
                          answer <= 1'b0;
                          nextState <= S19; end 
                                                                 
                 S20: if (entered == random[4]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S21; end
                     else begin
                          combo <= 1'b0;
                          life <= 1'b0;
                          answer <= 1'b0;
                          nextState <= S20; end 
                                                                 
                 S21: if (entered == random[3]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S22; end
                      else begin
                          combo <= 1'b0;
                          life <= 1'b0;
                          answer <= 1'b0;
                          nextState <= S21; end 
                                                                 
                 S22: if (entered == random[2]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S23; end
                       else begin
                          combo <= 1'b0;
                          life <= 1'b0;
                          answer <= 1'b0;
                          nextState <= S22; end 
                                                                 
                 S23: if (entered == random[1]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b0;
                          nextState <= S24; end
                       else begin
                          combo <= 1'b0;
                          life <= 1'b0; 
                          answer <= 1'b0;
                          nextState <= S24; end            
                                                                                 
                 S24: if (entered == random[0]) begin
                          combo <= 1'b1;
                          life <= 1'b1;
                          answer <= 1'b1;
                          nextState <= S0; end
                      else begin
                          combo <= 1'b0;
                          life <= 1'b0; 
                          answer <= 1'b0;
                          nextState <= S24; end                                                                                                                                                   
                  endcase         
        assign seq = random;      
        assign o_state = state;                      
 endmodule
