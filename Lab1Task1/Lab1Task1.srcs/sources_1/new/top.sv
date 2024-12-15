`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:27:09 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk, reset_n
    );
    
    
    
    localparam IMEM_DEPTH = 64;
    localparam REGF_WIDTH = 16;
    localparam ALU_WIDTH = 16;
    localparam PROG_VALUE = 3;
    
    
    logic [$clog2(PROG_VALUE)-1:0] inst_add;
    logic [7:0] instruction;
    logic [ALU_WIDTH-1:0] alu_out, op1_wire, op2_wire;
    
    instruction_memory #(IMEM_DEPTH) im(
        .reset_n(reset_n), 
        .inst_address(inst_add), 
        .inst_out(instruction)
    );
    
    
    alu #(ALU_WIDTH) alu(
        .clk(clk),
        .reset_n(reset_n),
        .opcode(instruction[1:0]),
        .op1(op1_wire),
        .op2(op2_wire),
        .alu_result(alu_out)
    );
    
    
    register_file #(REGF_WIDTH) rf(
        .clk(clk),
        .reset_n(reset_n),
        .rs1(instruction[3:2]),
        .rs2(instruction[5:4]),
        .rd(instruction[7:6]),
        .in(alu_out),
        .op1(op1_wire),
        .op2(op2_wire)
    );
    
    
    program_counter #(PROG_VALUE) pc(
        .clk(clk),
        .reset_n(reset_n),
        .count(inst_add)
    );
    
    
    
    
    
endmodule
