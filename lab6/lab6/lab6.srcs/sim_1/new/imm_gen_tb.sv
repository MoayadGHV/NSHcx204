`timescale 1ns / 1ps

module imm_gen_tb;

    parameter WIDTH = 32;

    reg [WIDTH-1:0] inst;
    wire [WIDTH-1:0] imm;

    imm_gen #(WIDTH) uut (
        .inst(inst),
        .imm(imm)
    );

    initial begin
        inst = 32'b000000000010_00000_000_00101_0010011; // addi x5, x6, 10
        #10;
        
        inst = 32'b000000000100_00000_010_00101_0100011; // sw x5, 4(x6)
        #10;

        inst = 32'b000000000000_00000_000_00001_1100011; // BEQ x5, x6, label
        #10;

        inst = 32'b111111111111_11111_111_11111_1111111; // Invalid instruction
        #10;
        
        inst = 32'b111111111110_01011_000_01010_0010011; // addi x10, x11, -10
        #10;

        inst = 32'b000000000110_01011_010_01010_0100011; // sw x10, 100(x11)
        #10;

        inst = 32'b000000000001_00000_001_00001_1100011; // BNE x5, x6, label
        #10;

        $stop;
    end
endmodule
