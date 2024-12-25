`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 03:02:02 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] op1, op2,
    input [3:0] alu_ctrl,
    output logic [31:0] alu_result,
    output logic zero
    );
    
    always_comb begin
        if (alu_ctrl == 4'b0000) 
            alu_result = op1 + op2;
        else if (alu_ctrl == 4'b1000)
            alu_result = op1 - op2;
        else if (alu_ctrl == 4'b0001)
            alu_result = op1 << op2;
        else if (alu_ctrl == 4'b0010) begin
            if (op1 > op2)
                alu_result = op1 << op2;
        end
        
        if (alu_result == 32'd0)
            zero = 1;
        else 
            zero = 0;
    end
    
    
    
    
endmodule
