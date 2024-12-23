`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:45:46 PM
// Design Name: 
// Module Name: register_files
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


module register_file #(parameter REGF_WIDTH = 16)(
    input clk, reset_n,
    input [1:0] rs1, rs2, rd,
    input [REGF_WIDTH-1:0] in,
    output logic [REGF_WIDTH-1:0] op1, op2
    );
    
    logic [REGF_WIDTH-1:0] x [0:3];

    
    always_comb begin
        case(rs1)
            2'b00:
                op1 = x[0];
            2'b01:
                op1 = x[1];
            2'b10:
                op1 = x[2];
            2'b11:
                op1 = x[3];
        endcase
        
        
        case(rs2)
            2'b00:
                op2 = x[0];
            2'b01:
                op2 = x[1];
            2'b10:
                op2 = x[2];
            2'b11:
                op2 = x[3];
        endcase
    end
    
    
    
    
    always @(posedge clk, negedge reset_n) begin
        if (~reset_n) begin
            x[0] <= 0;
            x[1] <= 0;
            x[2] <= 1;
            x[3] <= 0;
//            $readmemb("~/cx204/support_files/fib_rf.mem", x);
        end else begin

            case(rd)
                2'b01:
                    x[1] = in;
                2'b10:
                    x[2] = in;
                2'b11:
                    x[3] = in;
            endcase
            
        end
    end
            
    initial begin
    
        $readmemb("/home/nsh1/cx204/support_files/fib_rf.mem", x);
        
    end
    
    
endmodule
