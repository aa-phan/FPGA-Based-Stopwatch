`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 09:05:57 PM
// Design Name: 
// Module Name: time_mux_main
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

`timescale 1ns/1ps

module time_mux_main(
    input clk,
    input reset,
    input [15:0] sw,
    output [3:0] an,
    output [6:0] sseg
    );
    
    wire[6:0] in0, in1, in2, in3;
    wire slow_clk;
    
    //Module instantiation
    hex_7seg c1 (.x(sw[3:0]), .r(in0));
    hex_7seg c2 (.x(sw[7:4]), .r(in1));
    hex_7seg c3 (.x(sw[11:8]), .r(in2));
    hex_7seg c4 (.x(sw[15:12]), .r(in3));
    
    //Module instantiation of clock divider
    clkdiv c5 (.clk(clk), .reset(reset), .clk_out(slow_clk));
    
    //Module instantiation of mux
    time_mux_state_machine c6(
        .clk(slow_clk),
        .reset(reset),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .an(an),
        .sseg(sseg));
    
endmodule
