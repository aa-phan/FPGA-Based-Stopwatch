`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 01:52:09 PM
// Design Name: 
// Module Name: clkdiv
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

module clkdiv(
    input clk,
    input reset,
    output slow_clk,
    output faster_clk,
    output tick
    );
    
    reg[19:0] COUNT;
    
    assign faster_clk = COUNT[14];
    assign slow_clk = COUNT[19];
    
    always @(posedge clk or posedge reset)
        begin
            if(reset)
            begin
            COUNT <= 0;
            end
            else
                COUNT <= COUNT + 1;
        end
    assign tick = ((COUNT == 1000000)?1'b1:1'b0);
    
    
endmodule
