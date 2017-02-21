`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2016 11:00:54 AM
// Design Name: 
// Module Name: digit_pos
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


module digit_pos(input int xPos, yPos,
                 input logic [14:0] seq,
                 input logic [10:0] counterX, 
                 input logic [9:0] counterY, 
                 output logic valid);

        assign valid = ((seq[14] && ((counterX >= xPos) && (counterX < xPos + 10)) && ((counterY >= yPos) && (counterY < yPos + 5))) ||
                        (seq[13] && ((counterX >= xPos + 10) && (counterX < xPos + 20)) && ((counterY >= yPos) && (counterY < yPos + 5))) ||
                        (seq[12] && ((counterX >= xPos + 20) && (counterX < xPos + 30)) && ((counterY >= yPos) && (counterY < yPos + 5))) ||
                                         
                        (seq[11] && ((counterX >= xPos) && (counterX < xPos + 10)) && ((counterY >= yPos + 5) && (counterY < yPos + 10))) ||
                        (seq[10] && ((counterX >= xPos + 10) && (counterX < xPos + 20)) && ((counterY >= yPos + 5) && (counterY < yPos + 10))) ||
                         (seq[9] && ((counterX >= xPos + 20) && (counterX < xPos + 30)) && ((counterY >= yPos + 5) && (counterY < yPos + 10))) || 
                                        
                         (seq[8] && ((counterX >= xPos ) && (counterX < xPos + 10)) && ((counterY >= yPos + 10) && (counterY < yPos + 15))) ||
                         (seq[7] && ((counterX >= xPos + 10) && (counterX < xPos + 20)) && ((counterY >= yPos + 10) && (counterY < yPos + 15))) ||
                         (seq[6] && ((counterX >= xPos + 20) && (counterX < xPos + 30)) && ((counterY >= yPos + 10) && (counterY < yPos + 15))) || 
                              
                         (seq[5] && ((counterX >= xPos) && (counterX < xPos + 10)) && ((counterY >= yPos + 15) && (counterY < yPos + 20))) ||
                         (seq[4] && ((counterX >= xPos + 10) && (counterX < xPos + 20)) && ((counterY >= yPos + 15) && (counterY < yPos + 20))) ||
                         (seq[3] && ((counterX >= xPos + 20) && (counterX < xPos + 30)) && ((counterY >= yPos + 15) && (counterY < yPos + 20))) ||                         
                        
                         (seq[2] && ((counterX >= xPos) && (counterX < xPos + 10)) && ((counterY >= yPos + 20) && (counterY < yPos + 25))) ||
                         (seq[1] && ((counterX >= xPos + 10) && (counterX < xPos + 20)) && ((counterY >= yPos + 20) && (counterY < yPos + 25))) ||
                         (seq[0] && ((counterX >= xPos + 20) && (counterX < xPos + 30)) && ((counterY >= yPos + 20) && (counterY < yPos + 25))));
endmodule
