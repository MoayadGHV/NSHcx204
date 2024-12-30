`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2024 01:57:03 PM
// Design Name: 
// Module Name: branch_controller
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


module branch_controller(
    input [2:0] func3,
    input branch, 
    input zero, less,
    output logic pcSel 
    );
    
    always_comb begin
        case(func3)
            3'b000: pcSel = (zero & branch) ? 1 : 0;
            3'b001: pcSel = (!zero & branch) ? 1 : 0;
            3'b100: pcSel = (less & branch) ? 1 : 0;
            3'b101: pcSel = ((!less | 0) & branch) ? 1 : 0;
            3'b110: pcSel = (less & branch) ? 1 : 0;
            3'b111: pcSel = ((!less | 0) & branch) ? 1 : 0;
        default pcSel = 0;
        endcase
    end
        
        
    
    
endmodule
