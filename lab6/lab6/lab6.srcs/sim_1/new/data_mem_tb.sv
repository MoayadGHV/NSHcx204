`timescale 1ns / 1ps

module data_mem_tb;

    parameter WIDTH = 32;

    reg clk;
    reg reset_n;
    reg mem_write;
    reg [WIDTH-1:0] addr;
    reg [WIDTH-1:0] wdata;
    wire [WIDTH-1:0] rdata;

    data_mem #(WIDTH) uut (
        .clk(clk),
        .reset_n(reset_n),
        .mem_write(mem_write),
        .addr(addr),
        .wdata(wdata),
        .rdata(rdata)
    );

    initial begin
        clk = 0;
        reset_n = 0;
        mem_write = 0;
        addr = 0;
        wdata = 0;
        #10 reset_n = 1;
        #10;

        addr = 5;
        wdata = 32'h12345678;
        mem_write = 1;
        #10 mem_write = 0;
        #10 addr = 5;

        addr = 3;
        wdata = 32'hABCDEF01;
        mem_write = 1;
        #10 mem_write = 0;
        #10 addr = 3;

        addr = 1;
        wdata = 32'h00000001;
        mem_write = 1;
        #10 mem_write = 0;
        #10 addr = 1;

        addr = 2;
        wdata = 32'h00000002;
        mem_write = 1;
        #10 mem_write = 0;
        #10 addr = 2;

        addr = 5;
        #10;

        addr = 3;
        #10;

        addr = 1;
        #10;

        addr = 2;
        #10;

        $stop;
    end

    always #5 clk = ~clk;

endmodule
