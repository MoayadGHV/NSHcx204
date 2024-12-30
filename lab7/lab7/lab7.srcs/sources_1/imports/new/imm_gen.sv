`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 11:14:29 AM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen #(parameter WIDTH = 32)(
    input [WIDTH-1:0] inst,
    output logic [WIDTH-1:0] imm
    );
    
    logic [6:0] opcode;
    
    assign opcode = inst[6:0];
    
    always_comb begin
        case (opcode)
            
            7'b0010011: 
                imm = {{20{inst[31]}}, inst[31:20]}; 
     
            7'b0100011: 
                imm = {{20{inst[31]}}, inst[31:25], inst[11:7]}; 
            
            7'b1100011:
                imm = {{19{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
                
            7'b0110111:
                imm = {inst[31:12], {12{1'b0}}};
            
            7'b0010111:
                imm = {inst[31:12], {12{1'b0}}};
                
            7'b1101111:
                imm = {inst[31:12], {12{1'b0}}};
            default: begin
                imm = 32'b0;
            end
        endcase
    end
    
endmodule
