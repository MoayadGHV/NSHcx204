`timescale 1ns / 1ps

module alu_tb;

    parameter WIDTH = 32;

    reg [WIDTH-1:0] op1, op2;
    reg [3:0] ALU_sel;
    wire [WIDTH-1:0] ALU_out;
    wire ZERO;

    alu #(WIDTH) uut (
        .op1(op1),
        .op2(op2),
        .ALU_sel(ALU_sel),
        .ALU_out(ALU_out),
        .ZERO(ZERO)
    );

    initial begin
        op1 = 32'h00000005;
        op2 = 32'h00000003;
        ALU_sel = 4'b0000;
        #10;

        op1 = 32'h00000010;
        op2 = 32'h00000004;
        ALU_sel = 4'b0000;
        #10;

        op1 = 32'h00000004;
        op2 = 32'h00000002;
        ALU_sel = 4'b0001;
        #10;

        op1 = 32'h00000005;
        op2 = 32'h00000003;
        ALU_sel = 4'b0010;
        #10;

        op1 = 32'h00000005;
        op2 = 32'h00000007;
        ALU_sel = 4'b0011;
        #10;

        op1 = 32'h00000005;
        op2 = 32'h00000003;
        ALU_sel = 4'b0100;
        #10;

        op1 = 32'hFFFFFFFF;
        op2 = 32'h00000004;
        ALU_sel = 4'b0101;
        #10;

        op1 = 32'h00000005;
        op2 = 32'h00000003;
        ALU_sel = 4'b0110;
        #10;

        op1 = 32'h00000005;
        op2 = 32'h00000003;
        ALU_sel = 4'b0111;
        #10;

        op1 = 32'h00000010;
        op2 = 32'h00000004;
        ALU_sel = 4'b1000;
        #10;

        op1 = 32'hFFFFFFFF;
        op2 = 32'h00000004;
        ALU_sel = 4'b1101;
        #10;

        op1 = 32'h00000000;
        op2 = 32'h00000000;
        ALU_sel = 4'b1000;
        #10;

        $stop;
    end

endmodule
