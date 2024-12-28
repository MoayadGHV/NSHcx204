`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 03:13:51 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem #(int WIDTH = 32) (
    input clk,
    input reset_n,
    input mem_write,    
    input [WIDTH-1:0] addr,
    input [WIDTH-1:0] wdata,
    output logic [WIDTH-1:0] rdata
    );
    logic [WIDTH-1:0] dataFF [32:0];
    
    
    always @(posedge clk, negedge reset_n) begin
        if(~reset_n) begin 
            foreach(dataFF[i]) dataFF[i]='b0;
        end else if(mem_write) begin
            dataFF[addr] = wdata;
        end
        
    end
    
    
    assign rdata = dataFF[addr];

    
    
    
endmodule
