`timescale 1ns / 1ps

module main_control (
    input [6:0] opcode,       // 7-bit opcode from the instruction
    output logic reg_write,   // Control signal to enable register write
    output logic mem_write,   // Control signal to enable memory write
    output logic mem_to_reg,  // Control signal to select data source (memory/ALU)
    output logic [1:0] alu_op,// Control signal for ALU operation
    output logic alu_src,     // Control signal for ALU source (immediate or register)
    output logic branch       // Control signal for branch instruction
);

    always_comb begin
        // Default values
        reg_write = 0;
        mem_write = 0;
        mem_to_reg = 0;
        alu_op = 2'b00; // Default to ADD
        alu_src = 0;
        branch = 0;

        case (opcode)
            7'b0110011: begin // R-type
                reg_write = 1;
                alu_op = 2'b10; // ALU operation controlled by funct3 and funct7
            end

            7'b0000011: begin // Load
                reg_write = 1;
                mem_to_reg = 1;
                alu_src = 1;   // ALU source is an immediate value
                alu_op = 2'b00; // ADD operation for address calculation
            end

            7'b0100011: begin // Store
                mem_write = 1;
                alu_src = 1;   // ALU source is an immediate value
                alu_op = 2'b00; // ADD operation for address calculation
            end

            7'b1100011: begin // Branch
                branch = 1;
                alu_op = 2'b01; // ALU operation for branch comparison
            end

            7'b0010011: begin // I-type (Immediate Arithmetic)
                reg_write = 1;
                alu_src = 1;    // ALU source is an immediate value
                alu_op = 2'b00; // ADD operation for immediate arithmetic
            end

            default: begin
                // Default case for undefined opcodes
                reg_write = 0;
                mem_write = 0;
                mem_to_reg = 0;
                alu_op = 2'b00;
                alu_src = 0;
                branch = 0;
            end
        endcase
    end

endmodule
