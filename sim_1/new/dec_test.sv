`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2016 22:37:21
// Design Name: 
// Module Name: dec_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// ////////////////////////////////////////////////////////////


module dec_test();

    logic [11:0] decimal;
    logic [3:0] tho, hun, ten, one;   //, hun, ten, one;
    
    dec_conv dut(decimal, tho, hun, ten, one);
    
    initial 
    begin
    decimal = 8'b11111111; #10;
    end
    
endmodule
