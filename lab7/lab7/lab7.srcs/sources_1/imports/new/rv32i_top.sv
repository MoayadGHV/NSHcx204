`timescale 1ns / 1ps

module rv32i_top (
    input clk,        // Clock input
    input reset_n     // Active-low reset input
);

    // Signals for control unit outputs
    logic reg_write, mem_write, zero, less, mem_to_reg, alu_src, branch;
    logic [3:0] alu_ctrl;

    // Signals for data path inputs and outputs
    logic [6:0] opcode, func7;
    logic [2:0] func3;

    // Instantiate the control unit
    control_unit u_control_unit (
        .opcode(opcode),
        .func3(func3),
        .func7(func7),
        .zero(zero),
        .less(less),
        .reg_write(reg_write),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .alu_src(alu_src),
        .branch(branch),
        .alu_ctrl(alu_ctrl)
    );

    // Instantiate the data path
    data_path u_data_path (
        .clk(clk),
        .reset_n(reset_n),
        .reg_write(reg_write),
        .mem_write(mem_write),
        .memtoreg(mem_to_reg),
        .alu_src(alu_src),
        .alu_ctrl(alu_ctrl),
        .branch(branch),
        .opcode(opcode),
        .func3(func3),
        .func7(func7),
        .zero(zero),
        .less(less)
    );

endmodule

