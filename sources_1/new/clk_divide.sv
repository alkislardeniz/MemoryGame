`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2016 10:14:26
// Design Name: 
// Module Name: clk_divide
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


module clk_divide (input int border, input logic clk, output logic clk_out);
 
      int count;
    
      // divides the clock 
      always@ (posedge clk) 
          begin
          count <= count + 1;
          if (count == border) 
           count <= 0; 
          if (count == 0)
           clk_out <= 1'b1;
          else        
          clk_out <= 1'b0;      
           end  
endmodule
