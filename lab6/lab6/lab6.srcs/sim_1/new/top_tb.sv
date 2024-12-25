`timescale 1ns / 1ps

module top_tb;

    // Parameters
    parameter WIDTH = 32;

    // Signals
    logic clk, reset_n;

    // Instantiate the top module
    top_mod #(WIDTH) uut (
        .clk(clk),
        .reset_n(reset_n)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;

        // Apply reset
        #10 reset_n = 1;

        // Apply test stimulus
        // Instructions for the processor can be added here

        #100 $finish;
    end

endmodule
