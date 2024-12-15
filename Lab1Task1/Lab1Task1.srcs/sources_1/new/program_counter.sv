`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:22:27 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter #(parameter PROG_VALUE = 3)(
    input clk, reset_n,
    output logic [$clog2(PROG_VALUE)-1:0] count
    );
    
    always @(posedge clk, negedge reset_n) begin
        if (~reset_n)
            count <= 0;
        else
            count <= count + 1;
            
    end 
    
    
    
endmodule
