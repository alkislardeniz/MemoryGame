`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2016 19:24:31
// Design Name: 
// Module Name: level_test
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


module level_test();

    logic clk, reset, en, ans, disp;
    logic [1:0] level;

    level_choose lvl(clk, reset, en, ans, disp, level);
    
    always
        begin 
        clk = 1; #5; 
        clk = 0; #5;
        end
             
    initial begin
     reset = 1; en = 1; ans = 1; #10; 
     reset = 0; ans = 0; #10; 
     ans = 1; #10; 
     ans = 0; #10; 
     ans = 1; #10; 
     ans = 0; #10; 
     ans = 1; #10; 
    end 
endmodule