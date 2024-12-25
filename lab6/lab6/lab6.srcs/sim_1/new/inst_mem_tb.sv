`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:27:52 PM
// Design Name: 
// Module Name: inst_mem_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module inst_mem_tb;

logic [31:0] addrs, inst;



inst_mem IM(addrs, inst);

initial begin
    addrs = 32'h00000000; #10;
    addrs = 32'h00000001; #10;
    addrs = 32'h00000002; #10;
    addrs = 32'h00000003; #10;
    addrs = 32'h0000000F; #10;

    $finish; 
end

endmodule
