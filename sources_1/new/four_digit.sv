`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2016 08:55:31
// Design Name: 
// Module Name: four_digit
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


module four_digit(input logic [11:0] o_score, 
                  output logic [14:0] sco3, sco2, sco1, sco0);
 
    logic [3:0] tho, hun, ten, one;
    
    // binary to decimal conversion
    dec_conv score_conv(o_score, tho, hun, ten, one);
    
    // sequence generation
    num_gen sc3(tho, sco3); // 4th digit of the number
    num_gen sc2(hun, sco2); // 3th digit of the number
    num_gen sc1(ten, sco1); // 2nd digit of the number
    num_gen sc0(one, sco0); // 1st digit of the number
endmodule
