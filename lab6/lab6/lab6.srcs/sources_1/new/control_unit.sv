`timescale 1ns / 1ps

module control_unit (
    input [6:0] opcode,          // 7-bit opcode from the instruction
    input fun7,                   // 5th bit of the funct7 field
    input [2:0] fun3,             // funct3 field
    output logic reg_write,       // Enables writing data to register
    output logic mem_write,       // Enables writing data to memory
    output logic mem_to_reg,      // Selects data source for writing back to register
    output logic [1:0] alu_op,    // ALU operation control
    output logic alu_src,         // ALU operand source (immediate or register)
    output logic branch,          // Indicates branch instruction
    output logic [3:0] alu_ctrl   // 4-bit ALU control signal
);

    // Instantiate the Main Control Unit
    main_control u_main_control (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op),
        .alu_src(alu_src),
        .branch(branch)
    );

    // Instantiate the ALU Control Unit
    alu_control u_alu_control (
        .alu_op(alu_op),
        .fun7(fun7),
        .fun3(fun3),
        .alu_ctrl(alu_ctrl)
    );

endmodule