`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:08:39 PM
// Design Name: 
// Module Name: program_counter_tb
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


module program_counter_tb;

logic clk, reset_n;
logic [31:0] current, next;


always #5 clk = ~clk;

program_counter pc(clk, reset_n, next, current);

initial begin
    clk = 0; reset_n = 0; next = 32'h00000000; #10;
    reset_n = 1; next = 32'h00000000; #10;
    next = 32'h00000004; #10; 
    next = 32'h000000FF; #10;
    next = 32'h0000FFFF; #10;  
    next = 32'h00000000; #10;
    $finish; 
end


endmodule
