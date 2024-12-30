`timescale 1ns / 1ps

module data_path (
   input clk, reset_n,
   input reg_write, 
   input mem_write,
   input memtoreg,
   input alu_src,
   input [3:0] alu_ctrl,
   input pc_sel,
   input branch,
   output logic [6:0] opcode,
   output logic [2:0] func3,
   output logic [6:0] func7,
   output logic zero, less
);

    logic [31:0] next_pc, current_pc, instruction, imm, reg_wdata, reg_rdata1, reg_rdata2, alu_op2, mem_rdata, pc_plus4, pc_jump, alu_result;

    
    program_counter pc(
        clk, 
        reset_n, 
        next_pc, 
        current_pc
    );

    inst_mem rom(
        current_pc, 
        instruction
    );
    
    imm_gen immGen(
        instruction, 
        imm
    );
    
    reg_file rf(
        clk, 
        reset_n, 
        reg_write, 
        instruction[19:15], 
        instruction[24:20], 
        instruction[11:7], 
        reg_wdata, 
        reg_rdata1, 
        reg_rdata2
    );
    
    mux1sel ALUin_mux(
        reg_rdata2, 
        imm, 
        alu_src, 
        alu_op2
    );
    
    alu alu(
        reg_rdata1, 
        alu_op2, 
        alu_ctrl, 
        alu_result, 
        zero,
        less
    );
    
    data_mem datamem(
        clk, 
        reset_n, 
        mem_write, 
        alu_result, 
        reg_rdata2, 
        mem_rdata
    );
    
    mux1sel datamemOut_mux(
        alu_result,
        mem_rdata, 
        memtoreg, 
        reg_wdata
    );
    
    assign pc_plus4 = current_pc + 32'h00000004;
    assign pc_jump = current_pc + imm;
    assign pc_sel = zero & branch;
    
    mux1sel pcSel(
        pc_plus4, 
        pc_jump, 
        pc_sel, 
        next_pc
    );
    
    assign opcode = instruction[6:0];
    assign func3 = instruction[14:12];
    assign func7 = instruction[31:25];

endmodule
