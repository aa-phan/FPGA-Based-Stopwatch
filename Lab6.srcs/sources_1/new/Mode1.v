`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2023 09:35:40 PM
// Design Name: 
// Module Name: Mode1
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


module up_count(
    input clk,
    input reset,
    input tick,
    input stop_start,
    input [1:0] mode,
    input [7:0] sw,
    output reg[3:0] seg0,
    output reg[3:0] seg1,
    output reg[3:0] seg2,
    output reg[3:0] seg3    
    );
    
    reg stop = 0;
    
    always@(posedge clk or posedge reset)
        begin
            if(reset)       //if reset button is pressed, 
                begin
                case(mode)
                
                2'b00:begin     //mode 1, count up from 0
                seg0<=0;
                seg1<=0;
                seg2<=0;
                seg3<=0;
                stop<=0;
                end
                
                2'b01: begin        //mode 2, count up from loaded val
                seg0<=0;
                seg1<=0;
                seg2<=sw[3:0];      //second digit of seconds
                seg3<=sw[7:4];      //first digit of seconds
                stop<=0;
                end
                
                3'b10: begin
                seg0<=9;
                seg1<=9;
                seg2<=9;
                seg3<=9;
                stop<=0;
                end
                
                 2'b11: begin        //mode 2, count up from loaded val
                seg0<=0;
                seg1<=0;
                seg2<=sw[3:0];      //second digit of seconds
                seg3<=sw[7:4];      //first digit of seconds
                stop<=0;
                end
                 
                default: stop<=0;
            endcase
            end
           
            else if(stop_start)       //if the stop/start button is pressed
                 begin                    //retain current value
                 if(stop == 0)
                    stop<=1;
                 else if(stop == 1)
                    stop<=0;
                 end
            else if((tick && stop) &&(mode == 0 || mode==1))
                begin
                if(seg0==9)
                begin
                if(seg3==9 && seg2==9 && seg1 == 9) //all segments equal to max
                    seg0<=0;
                else
                    seg0<=0;
                    if(seg1==9)
                    begin
                    if(seg3==9 && seg2==9)
                        seg1<=9;
                    else
                        seg1<=0;
                        if(seg2==9 && seg3!=9)
                        begin
                        seg2<=0;
                            if(seg3>=9)
                                seg3=9;
                            else if(seg3!=9)
                                seg3<=seg3+1;
                            end
                        else if(seg2!=9)
                            seg2<=seg2+1;
                        end
                    else if(seg1!=9)
                        seg1<=seg1+1;
                    end
                else if(seg0!=9)
                    seg0<=seg0+1;
                end
                else if ((tick && stop) && (mode == 2 || mode==3))
                begin
                   if (seg0 == 0) // if seg0 reaches 0, decrement other segments
                            begin
                                if (seg1 == 0)
                                begin
                                    if (seg2 == 0)
                                    begin
                                        if (seg3 == 0)
                                            stop <= 1; // Stop counting when all segments reach 0
                                        else
                                            seg3 <= seg3 - 1;
                                    end
                                    else
                                        seg2 <= seg2 - 1;
                                end
                                else
                                    seg1 <= seg1 - 1;
                                seg0 <= 9;
                            end
                            else
                                seg0 <= seg0 - 1;
                        end
    end                    
endmodule
