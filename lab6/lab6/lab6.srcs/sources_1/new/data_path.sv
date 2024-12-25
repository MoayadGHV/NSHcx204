`timescale 1ns / 1ps

module data_path (
    input clk,
    input reset_n,
    input [31:0] inst,          // Instruction input from instruction memory
    input reg_write,            // Control signal for write-back to registers
    input mem_write,            // Control signal for memory write
    input mem_to_reg,           // Control signal to select memory-to-reg data
    input alu_op,               // ALU operation select
    input alu_src,              // ALU source control
    input branch,               // Branch control signal
    input [3:0] alu_sel,        // ALU operation selector
    output logic [31:0] alu_out,      // ALU result
    output logic zero,                // Zero flag output from ALU
    output logic [31:0] result,       // Final result for write-back
    output logic [31:0] next_pc,      // Next program counter value
    output logic [31:0] current_pc    // Current program counter value
);

    // Internal signals for the datapath
    logic [31:0] pc_in, pc_out, pc_plus_4, imm, alu_input2, rdata1, rdata2, branch_addr, mem_data, write_data;
    logic [4:0] rs1, rs2, rd;
    logic [6:0] opcode;
    logic [2:0] funct3;
    logic [6:0] funct7;
    
    // Program Counter (PC) module
    program_counter #(32) pc (
        .clk(clk),
        .reset_n(reset_n),
        .next_pc(pc_in),
        .current_pc(pc_out)
    );
    
    // Instruction Memory (inst_mem)
    inst_mem #(32) inst_mem (
        .address(pc_out),         // Address is the current PC
        .instruction(inst)        // Instruction at that address
    );

    // Extract opcode, funct3, and funct7
    assign opcode = inst[6:0];
    assign funct3 = inst[14:12];
    assign funct7 = inst[31:25];
    
    // Program Counter + 4 for next instruction
    assign pc_plus_4 = pc_out + 4;
    
    // Imm Gen (Immediate Generator)
    imm_gen #(32) imm_gen (
        .inst(inst),
        .imm(imm)
    );
    
    // Register File (reg_file)
    reg_file reg_file (
        .clk(clk),
        .reset_n(reset_n),
        .reg_write(reg_write),
        .raddr1(rs1),
        .raddr2(rs2),
        .waddr(rd),
        .wdata(write_data),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    // ALU (Arithmetic Logic Unit)
    alu #(32) alu (
        .op1(rdata1),
        .op2(alu_src ? imm : rdata2),  // ALU input2 is either immediate or reg2
        .ALU_sel(alu_sel),
        .ALU_out(alu_out),
        .ZERO(zero)
    );
    
    // Data Memory (data_mem)
    data_mem #(32) data_mem (
        .clk(clk),
        .reset_n(reset_n),
        .mem_write(mem_write),
        .addr(alu_out),          // Address from ALU result
        .wdata(rdata2),          // Write data from reg2
        .rdata(mem_data)         // Read data from memory
    );
    
    // Branch Address Calculation
    assign branch_addr = pc_plus_4 + (imm << 1);  // Branch target address
    
    // MUX for write data (select between memory or ALU result)
    assign write_data = mem_to_reg ? mem_data : alu_out;
    
    // MUX for next PC (select between branch target or PC+4)
    assign pc_in = (branch && zero) ? branch_addr : pc_plus_4;
    
    // Extract rs1, rs2, rd from instruction
    assign rs1 = inst[19:15];
    assign rs2 = inst[24:20];
    assign rd = inst[11:7];
    
    // Result for write-back (either memory data or ALU result)
    assign result = write_data;
    
    // Current PC output
    assign current_pc = pc_out;
    
    // Next PC output
    assign next_pc = pc_in;

endmodule
