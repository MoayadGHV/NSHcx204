`timescale 1ns / 1ps

module alu_tb;

    parameter WIDTH = 32;

    reg [WIDTH-1:0] op1, op2;
    reg [3:0] alu_ctrl;
    wire [WIDTH-1:0] alu_result;
    wire zero;

    alu uut (
        .op1(op1),
        .op2(op2),
        .alu_ctrl(alu_ctrl),
        .alu_result(alu_result),
        .zero(zero)
    );

    initial begin
        op1 = 32'h00000005; 
        op2 = 32'h00000003; 
        alu_ctrl = 4'b0000; 
        #10;

        op1 = 32'h00000010; 
        op2 = 32'h00000004; 
        alu_ctrl = 4'b1000; 
        #10;

        op1 = 32'h00000001; 
        op2 = 32'h00000002; 
        alu_ctrl = 4'b0001; 
        #10;

        op1 = 32'h00000004; 
        op2 = 32'h00000002; 
        alu_ctrl = 4'b0001; 
        #10;

        op1 = 32'h00000001; 
        op2 = 32'h00000004; 
        alu_ctrl = 4'b0010; 
        #10;

        op1 = 32'h00000003; 
        op2 = 32'h00000007; 
        alu_ctrl = 4'b1000; 
        #10;

        op1 = 32'h00000000; 
        op2 = 32'h00000000; 
        alu_ctrl = 4'b0000; 
        #10;

        op1 = 32'h00000004; 
        op2 = 32'h000000FC; 
        alu_ctrl = 4'b0000; 
        #10;

        $stop;
    end
endmodule
