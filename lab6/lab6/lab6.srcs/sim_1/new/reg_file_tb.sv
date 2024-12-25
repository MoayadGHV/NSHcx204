`timescale 1ns / 1ps

module reg_file_tb;

    parameter WIDTH = 32;

    reg clk;
    reg reset_n;
    reg reg_write;
    reg [4:0] raddr1, raddr2, waddr;
    reg [WIDTH-1:0] wdata;
    wire [WIDTH-1:0] rdata1, rdata2;

    reg_file uut (
        .clk(clk),
        .reset_n(reset_n),
        .reg_write(reg_write),
        .raddr1(raddr1),
        .raddr2(raddr2),
        .waddr(waddr),
        .wdata(wdata),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    initial begin
        clk = 0;
        reset_n = 0;
        reg_write = 0;
        raddr1 = 5'd0;
        raddr2 = 5'd1;
        waddr = 5'd2;
        wdata = 32'd0;
        #10 reset_n = 1;
        #10;

        reg_write = 1;
        waddr = 5'd1;
        wdata = 32'h12345678;
        #10 reg_write = 0;
        #10;

        raddr1 = 5'd1;
        raddr2 = 5'd2;
        #10;

        reg_write = 1;
        waddr = 5'd2;
        wdata = 32'h87654321;
        #10 reg_write = 0;
        #10;

        raddr1 = 5'd1;
        raddr2 = 5'd2;
        #10;

        reg_write = 1;
        waddr = 5'd3;
        wdata = 32'habcdef01;
        #10 reg_write = 0;
        #10;

        raddr1 = 5'd3;
        raddr2 = 5'd1;
        #10;

        reg_write = 1;
        waddr = 5'd4;
        wdata = 32'hdeadbeef;
        #10 reg_write = 0;
        #10;

        raddr1 = 5'd4;
        raddr2 = 5'd3;
        #10;

        $stop;
    end

    always #5 clk = ~clk;

endmodule
