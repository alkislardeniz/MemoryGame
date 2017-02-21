`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2016 21:49:49
// Design Name: 
// Module Name: decoder
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


module decoder(input logic [1:0] level,
               output logic lv1_en,
               output logic lv2_en,
               output logic lv3_en);

    always_comb
        case(level)
          
        2'b01: begin lv1_en = 1'b1;
                     lv2_en = 1'b0;
                     lv3_en = 1'b0; end
                     
        2'b10: begin lv1_en = 1'b0;
                     lv2_en = 1'b1;
                     lv3_en = 1'b0; end                     
       
        2'b11: begin lv1_en = 1'b0;
                     lv2_en = 1'b0;
                     lv3_en = 1'b1; end         
                     
        2'b00: begin lv1_en = 1'b0;
                     lv2_en = 1'b0;
                     lv3_en = 1'b0; end  
                       
        endcase                              
endmodule
