`timescale 1ns / 1ps

module rv32i_top (
    input clk,          // Clock signal
    input reset_n      // Active-low reset signal
);

    // Internal signals for connecting control unit and datapath
    logic [6:0] opcode;        // 7-bit opcode from instruction
    logic fun7;                 // 5th bit of funct7 field
    logic [2:0] fun3;          // 3-bit funct3 field from instruction
    logic reg_write;           // Register write control signal
    logic mem_write;           // Memory write control signal
    logic mem_to_reg;          // Memory to register control signal
    logic alu_src;             // ALU operand source control signal (immediate or register)
    logic branch;              // Branch control signal
    logic [1:0] alu_op;        // ALU operation control signal
    logic [3:0] alu_ctrl;      // ALU control signal
    
    // Datapath signals
    logic [31:0] instruction;  // Instruction fetched from memory
    logic [31:0] read_data_1, read_data_2; // Data read from register file
    logic [31:0] alu_result;   // ALU computation result
    logic [31:0] mem_data;     // Data read from memory (for load/store)
    
    assign fun7 = instruction[29];
    assign fun3 = instruction[14:12];
    // Control unit instantiation
    control_unit u_control_unit (
        .opcode(opcode),           // 7-bit opcode input
        .fun7(fun7),               // 5th bit of funct7 input
        .fun3(fun3),               // 3-bit funct3 input
        .reg_write(reg_write),     // Register write signal
        .mem_write(mem_write),     // Memory write signal
        .mem_to_reg(mem_to_reg),   // Memory to register signal
        .alu_op(alu_op),           // ALU operation type signal
        .alu_src(alu_src),         // ALU source (register/immediate)
        .branch(branch),           // Branch signal
        .alu_ctrl(alu_ctrl)        // ALU control signal
    );

    // Datapath instantiation
    data_path u_data_path (
        .clk(clk),
        .reset_n(reset_n),
        .reg_write(reg_write),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op),
        .alu_src(alu_src),
        .branch(branch),
        .alu_ctrl(alu_ctrl),
        .instruction(instruction),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2),
        .alu_result(alu_result),
        .mem_data(mem_data)
    );

endmodule
