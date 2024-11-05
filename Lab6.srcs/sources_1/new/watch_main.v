`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 09:23:13 PM
// Design Name: 
// Module Name: watch_main
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


module watch_main(
    input clk,
    input reset,
    input [7:0] sw,
    input [1:0] mode,
    output [3:0] an,
    output [6:0] sseg,
    output dp,
    input stop_start
    );
    
    localparam [6:0] zero = 7'b0000001;
    
    wire[6:0] in0, in1, in2, in3;
    wire[6:0] iu0, iu1, iu2, iu3;
    wire[6:0] id0, id1, id2, id3;
    wire[3:0] su0, su1, su2, su3;
    wire[3:0] sd0, sd1, sd2, sd3;
    wire tick;
    wire slow_clk, faster_clk;  
    
    clkdiv cd1(.clk(clk), .reset(reset), .slow_clk(slow_clk), .tick(tick), .faster_clk(faster_clk));
    up_count uc1(.clk(clk), .reset(reset), .tick(tick), .stop_start(stop_start), .mode(mode), .sw(sw), .seg0(su0), .seg1(su1), .seg2(su2), .seg3(su3));
    //down_count dc1();       //to be implemented
    
    hex_7seg h1(.x(su0), .r(id0));
    hex_7seg h2(.x(su1), .r(id1));
    hex_7seg h3(.x(su2), .r(id2));
    hex_7seg h4(.x(su3), .r(id3));
    
    hex_7seg h5(.x(su0), .r(iu0));
    hex_7seg h6(.x(su1), .r(iu1));
    hex_7seg h7(.x(su2), .r(iu2));
    hex_7seg h8(.x(su3), .r(iu3));
    
    assign in0 = ((mode == 2'b00 || mode == 2'b01)?id0:iu0);
    assign in1 = ((mode == 2'b00 || mode == 2'b01)?id1:iu1);
    assign in2 = ((mode == 2'b00 || mode == 2'b01)?id2:iu2);
    assign in3 = ((mode == 2'b00 || mode == 2'b01)?id3:iu3);
    
    time_mux t1(.clk(faster_clk), .reset(reset), .in0(in0), .in1(in1), .in2(in2), .in3(in3), .sseg(sseg), .an(an), .dp(dp));
        
    
    
    
endmodule
