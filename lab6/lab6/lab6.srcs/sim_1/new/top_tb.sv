`timescale 1ns / 1ps

module top_tb;

    logic clk, reset_n;


    rv32i_top uut (
        .clk(clk),
        .reset_n(reset_n)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset_n = 0;

        #10 reset_n = 1;

        #90;
        $finish;
    end

endmodule
