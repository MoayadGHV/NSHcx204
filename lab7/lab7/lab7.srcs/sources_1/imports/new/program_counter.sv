`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:00:23 PM
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


module program_counter #( parameter WIDTH = 32)(
    input clk, reset_n,
    input [WIDTH-1:0] next_pc,
    output logic [WIDTH-1:0] current_pc
    );
    
    always @(posedge clk, negedge reset_n) begin
        if (~reset_n) 
            current_pc = 0;
        else 
            current_pc = next_pc;
        
    end
    
    
    
endmodule
