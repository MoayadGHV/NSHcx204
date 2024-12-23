`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:08:44 PM
// Design Name: 
// Module Name: ALU
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


module alu #(parameter ALU_WIDTH = 16)(
    input clk, reset_n,
    input [1:0] opcode,
    input [ALU_WIDTH-1:0] op1, op2,
    output logic [ALU_WIDTH-1:0] alu_result
    );
    
    
    logic [ALU_WIDTH-1:0] add_out, sub_out, and_out, or_out;
    
    
    assign add_out = op1 + op2;
    assign sub_out = op1 - op2;
    assign and_out = op1 & op2;
    assign or_out = op1 | op2;
    
    always_comb begin
        case(opcode)
            2'b00:
                alu_result = add_out;
            2'b01:
                alu_result = sub_out;
            2'b10:
                alu_result = and_out;
            2'b11:
                alu_result = or_out;
         endcase
     end
    
    

    
endmodule
