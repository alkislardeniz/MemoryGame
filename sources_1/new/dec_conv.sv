`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2016 21:49:25
// Design Name: 
// Module Name: dec_conv
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


module dec_conv(input logic [11:0] decimal, 
                output logic [3:0] tho, hun, ten, one);//, hun, ten, one);
    
    logic [4:0] a;
    logic [6:0] b;
    logic [9:0] c;
    
    always@(*) begin
        a = decimal / 10'b1111101000;
        b = decimal / 7'b1100100;
        c = decimal / 4'b1010; end
    
    assign tho = a;
    assign hun = b % 4'b1010;
    assign ten = c % 4'b1010;
    assign one = decimal % 4'b1010;
    
endmodule
