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
    input [2:0] fun3,           // 3-bit function code for load/store type
    input [WIDTH-1:0] addr,     // Address for load/store
    input [WIDTH-1:0] wdata,    // Write data for store
    output logic [WIDTH-1:0] rdata,  // Read data for load
    output logic alignment_error    // Flag for alignment error
    );

    // Declare memory storage (a simple array for simulation purposes)
    logic [WIDTH-1:0] dataFF [0:1023];  // 1KB memory (addressed in words)

    // Alignment unit output signals
    logic aligned;  
    logic [WIDTH-1:0] aligned_addr;

    // Instantiate the alignment unit
    alignment_unit align_unit (
        .fun3(fun3), 
        .addr(addr), 
        .aligned(aligned), 
        .aligned_address(aligned_addr)
    );

    always @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin 
            // Reset all memory to 0 on reset
            foreach(dataFF[i]) dataFF[i] = 0;
        end else if (mem_write && aligned) begin
            // If aligned, write to memory
            dataFF[aligned_addr >> 2] = wdata; // Address is word-aligned, so divide by 4
        end
    end
    
    // Read data from memory at the aligned address
    assign rdata = dataFF[aligned_addr >> 2]; 

    // Handle alignment error: if not aligned, set the error flag
    assign alignment_error = !aligned;

endmodule

