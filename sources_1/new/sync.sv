`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2016 01:14:21 PM
// Design Name: 
// Module Name: sync
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


module sync (input logic clk, 
             input logic [1:0] o_level,
             input logic display,
             input logic [8:0] seq1,
             input logic [15:0] seq2,
             input logic [24:0] seq3, 
             input logic [7:0] o_combo,
             input logic [11:0] o_score,
             input logic [1:0] o_life,   
             input logic [4:0] o_state, 
             output logic [10:0] counterX, 
             output logic [9:0] counterY,
             output logic valid, 
             output logic vga_h_sync, 
             output logic vga_v_sync);


    logic ResetCntX, EnableCntY, ResetCntY, numberDisp, borderDisp;
   
    // counters
    always @ (posedge clk) begin
       if (ResetCntX) 
           counterX[10:0] <= 11'b0;
       else 
           counterX[10:0] <= counterX[10:0] + 1;

       if (ResetCntY) 
           counterY[9:0] <= 10'b0;
           
       else if (EnableCntY) 
           counterY[9:0] <= counterY + 1;
           
       else 
           counterY[9:0] <= counterY[9:0]; end

    // synchronizer controller    
    always @(posedge clk) begin    
        ResetCntX <= (counterX[10:0] == 1586); 
        EnableCntY <= (counterX[10:0] == 1300);
        ResetCntY <= (counterY[9:0] == 527); end
    
    // highscore register
    logic [11:0] highScore;
    always_ff@(posedge clk) begin
        if (o_score > highScore)
            highScore <= o_score; end
            
    // high score decimal conversion
    logic [14:0] high3, high2, high1, high0; 
    four_digit highScore_dig(highScore, high3, high2, high1, high0);            
 
    // score decimal conversion
    logic [14:0] sco3, sco2, sco1, sco0; 
    four_digit score_dig(o_score, sco3, sco2, sco1, sco0);
      
    // combo decimal conversion     
    logic [14:0] com3, com2, com1, com0; 
    four_digit combo_dig(o_combo, com3, com2, com1, com0);
    
    logic [14:0] sta3, sta2, sta1, sta0, state;
    
    always@(*)
        state <= o_state + 1; 
    
    // state decimal conversion  
    four_digit state_dig(state, sta3, sta2, sta1, sta0);
    
    // level & life decimal pattern
    logic [14:0] lvl, life;
    num_gen level_gen(o_level, lvl);
    num_gen life_gen(o_life, life);
    
    // score digit vga
    logic sco3v, sco2v, sco1v, sco0v;
    digit_pos sco3_pos(400, 375, sco3, counterX, counterY, sco3v);
    digit_pos sco2_pos(435, 375, sco2, counterX, counterY, sco2v);
    digit_pos sco1_pos(470, 375, sco1, counterX, counterY, sco1v);
    digit_pos sco0_pos(505, 375, sco0, counterX, counterY, sco0v);
    
    // combo digit vga
    logic com3v, com2v, com1v, com0v;
    digit_pos com3_pos(605, 375, com3, counterX, counterY, com3v);
    digit_pos com2_pos(640, 375, com2, counterX, counterY, com2v);
    digit_pos com1_pos(675, 375, com1, counterX, counterY, com1v);
    digit_pos com0_pos(710, 375, com0, counterX, counterY, com0v);
    
    // highscore digit vga
    logic high3v, high2v, high1v, high0v;
    digit_pos high3_pos(100, 20, high3, counterX, counterY, high3v);
    digit_pos high2_pos(135, 20, high2, counterX, counterY, high2v);
    digit_pos high1_pos(170, 20, high1, counterX, counterY, high1v);
    digit_pos high0_pos(205, 20, high0, counterX, counterY, high0v);
    
    // life & level digit vga
    logic levelv, lifev, statev;
    digit_pos level_pos(810, 375, lvl, counterX, counterY, levelv);
    digit_pos life_pos(1100, 20, life, counterX, counterY, lifev);
    
    // state digit vga
    logic sta1v, sta0v;
    digit_pos sta1_pos(590, 20, sta1, counterX, counterY, sta1v);
    digit_pos sta0_pos(625, 20, sta0, counterX, counterY, sta0v);      
    
    int xPoz = 475; 
    int yPoz = 100;
    
    // signal synchronizer
    always @(posedge clk) begin
		vga_h_sync <= ~((counterX[10:0] >= 1304) && (counterX[10:0] <= 1493));
		vga_v_sync <= ~((counterY[9:0] == 493) || (counterY[9:0]  == 494 ));
        
        borderDisp <= (counterX <= 1287 && counterY <= 6) || (counterX <= 1287 && (counterY >= 473 && counterY <= 479)) || ((counterX <= 13) && counterY <= 479) || ((counterX >= 1260 && counterX <= 1287) && counterY <= 479);                 
        numberDisp <= (sco3v || sco2v || sco1v || sco0v || com3v || com2v || com1v || com0v || levelv || lifev || sta1v || sta0v || high3v || high2v || high1v || high0v );
        
        if (o_level == 2'b01) begin // 3*3 pattern generator
            valid <=  (((seq1[8] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        (seq1[7] && ((counterX >= xPoz + 100) && (counterX <  xPoz + 200)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        (seq1[6] && ((counterX >= xPoz + 200) && (counterX <  xPoz + 300)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                                 
                        (seq1[5] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        (seq1[4] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        (seq1[3] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) || 
                                
                        (seq1[2] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq1[1] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq1[0] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150)))) && display) || numberDisp || borderDisp; end

        else if (o_level == 2'b10) begin // 4*4 pattern generator
            valid <=  (((seq2[15] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        (seq2[14] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        (seq2[13] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||                         
                        (seq2[12] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        
                        (seq2[11] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        (seq2[10] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||            
                        (seq2[9] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        (seq2[8] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        
                        (seq2[7] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq2[6] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq2[5] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq2[4] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        
                        (seq2[3] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200))) ||
                        (seq2[2] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200))) ||
                        (seq2[1] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200))) ||
                        (seq2[0] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200)))) && display) || numberDisp || borderDisp; end 

        else if (o_level == 2'b11) begin // 5*5 pattern generator
            valid <=  (((seq3[24] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        (seq3[23] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        (seq3[22] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||                         
                        (seq3[21] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        (seq3[20] && ((counterX >= xPoz + 400) && (counterX < xPoz + 500)) && ((counterY >= yPoz) && (counterY < yPoz + 50))) ||
                        
                        (seq3[19] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        (seq3[18] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||            
                        (seq3[17] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        (seq3[16] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        (seq3[15] && ((counterX >= xPoz + 400) && (counterX < xPoz + 500)) && ((counterY >= yPoz + 50) && (counterY < yPoz + 100))) ||
                        
                        (seq3[14] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq3[13] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq3[12] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq3[11] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        (seq3[10] && ((counterX >= xPoz + 400) && (counterX < xPoz + 500)) && ((counterY >= yPoz + 100) && (counterY < yPoz + 150))) ||
                        
                        (seq3[9] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200))) ||
                        (seq3[8] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200))) ||
                        (seq3[7] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200))) ||
                        (seq3[6] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200))) || 
                        (seq3[5] && ((counterX >= xPoz + 400) && (counterX < xPoz + 500)) && ((counterY >= yPoz + 150) && (counterY < yPoz + 200))) ||
                        
                        (seq3[4] && ((counterX >= xPoz) && (counterX < xPoz + 100)) && ((counterY >= yPoz + 200) && (counterY < yPoz + 250))) ||
                        (seq3[3] && ((counterX >= xPoz + 100) && (counterX < xPoz + 200)) && ((counterY >= yPoz + 200) && (counterY < yPoz + 250))) ||
                        (seq3[2] && ((counterX >= xPoz + 200) && (counterX < xPoz + 300)) && ((counterY >= yPoz + 200) && (counterY < yPoz + 250))) ||
                        (seq3[1] && ((counterX >= xPoz + 300) && (counterX < xPoz + 400)) && ((counterY >= yPoz + 200) && (counterY < yPoz + 250))) ||
                        (seq3[0] && ((counterX >= xPoz + 400) && (counterX < xPoz + 500)) && ((counterY >= yPoz + 200) && (counterY < yPoz + 250)))) && display) || numberDisp || borderDisp; end                         
    end   
endmodule  
