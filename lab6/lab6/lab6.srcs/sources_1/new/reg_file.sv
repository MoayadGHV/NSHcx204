`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:35:36 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input clk, reset_n, reg_write,
    input [4:0] raddr1, raddr2, waddr,
    input [31:0] wdata,
    output logic [31:0] rdata1, rdata2
    );
    
    logic [31:0] reg_arr [0:4];
    
    
    always @(posedge clk, negedge reset_n) begin
        if (~reset_n) begin
            for (int i = 1; i < 5; i++) begin
                reg_arr[i] = 32'd0;
            end
        end else begin  
            if (~reg_write) begin
                rdata1 = reg_arr[raddr1];
                rdata2 = reg_arr[raddr2];
            end
            
            if (reg_write) begin
                reg_arr[waddr] = wdata;
            end
        end
    end
    
    
endmodule
