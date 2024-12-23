`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:59:22 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb;

logic clk, reset_n;

top topFib(clk, reset_n);

always #5 clk = ~clk;

initial begin
    clk = 0; reset_n = 0; #10;
    reset_n = 1;
    #50;
    $finish;
end

endmodule
