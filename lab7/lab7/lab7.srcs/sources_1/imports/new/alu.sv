module alu #(
    parameter WIDTH = 32
) (
    input [WIDTH-1:0] op1,
    input [WIDTH-1:0] op2,
    input [3:0] ALU_sel,
    output logic [WIDTH-1:0] ALU_out,
    output logic ZERO
);

  always @(op1, op2) begin
    case (ALU_sel)
      // ADD
      4'b0000: ALU_out = op1 + op2;
      // SLL
      4'b0001: ALU_out = $unsigned(op1) << $unsigned(op2);
      // SLT
      4'b0010: begin
        if ($signed(op1) < $signed(op2)) ALU_out = 1;
        else ALU_out = 0;
      end
      // SLTU
      4'b0011: begin
        if ($unsigned(op1) < $unsigned(op2)) ALU_out = 1;
        else ALU_out = 0;
      end
      // XOR
      4'b0100: ALU_out = op1 ^ op2;
      // SRL
      4'b0101: ALU_out = $unsigned(op1) >> $unsigned(op2);
      // OR
      4'b0110: ALU_out = op1 | op2;
      //AND
      4'b0111: ALU_out = op1 & op2;
      // SUB
      4'b1000: ALU_out = op1 - op2;
      // SRA
      4'b1101: ALU_out = $signed(op1) >>> op2;
      //default
      default: ALU_out = 4'd0;
    endcase

    if (ALU_out == 32'd0) begin
      ZERO = 1;
    end else ZERO = 0;
  end

endmodule