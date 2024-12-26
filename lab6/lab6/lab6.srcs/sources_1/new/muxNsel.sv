`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 08:56:27 AM
// Design Name: 
// Module Name: muxNsel
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


module mux1sel(
    input [31:0] muxin1, muxin2,
    input muxsel,
    output logic [31:0]muxout
    );
    
    
    always_comb begin
        case(muxsel)
            1'b0:
                muxout = muxin1;
            1'b1:
                muxout = muxin2;
        endcase
    end
    
endmodule
