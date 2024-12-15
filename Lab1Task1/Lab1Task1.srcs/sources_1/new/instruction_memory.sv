`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:22:23 PM
// Design Name: 
// Module Name: InstructionMem
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


module instruction_memory #(parameter IMEM_DEPTH = 64)(
    input reset_n,
    input [1:0] inst_address,
    output logic [7:0] inst_out
    );
    
    logic [7:0] instructions [0:IMEM_DEPTH-1];
    
    
        
    
    initial begin
    
        $readmemb("/home/nsh1/cx204/support_files/fib_im.mem", instructions);
        
    end
    
    always_comb begin
        inst_out = instructions[inst_address];
    end
    
endmodule
