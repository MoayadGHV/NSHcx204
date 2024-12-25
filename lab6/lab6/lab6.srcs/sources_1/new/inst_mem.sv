`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:20:19 PM
// Design Name: 
// Module Name: inst_mem
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


module inst_mem #(parameter WIDTH = 32)(
    input [WIDTH-1:0] address,
    output logic [WIDTH-1:0] instruction
    );
    
    logic [WIDTH-1:0] instructions [0:255];
    
    initial begin
    
        $readmemb("/home/nsh1/cx204/support_files/fib_im.mem", instructions); // CHANGE DIR BEFORE STARTING
        
    end
    
    always_comb begin
        instruction = instructions[address];
    end
    
    
endmodule
