`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2016 16:29:49
// Design Name: 
// Module Name: mux4
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


module mux4(input logic [7:0] d1, d2, d3,
            input logic [1:0] s,
            output logic [7:0] y);

    always@(*) begin
        if (s == 2'b01)
            y <= d1;
    
        else if (s == 2'b10)
            y <= d2;
            
        else if (s == 2'b11)
            y <= d3; end       
                         
endmodule
