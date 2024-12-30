module alignment_unit(
    input [2:0] fun3,            // 3-bit function code
    input [31:0] addr,           // Memory address for load/store
    output logic aligned,          // Whether the address is aligned
    output logic [31:0] aligned_address // Address adjusted for alignment
);

    always @(*) begin
        case (fun3)
            3'b000: begin  // lb, lbu (1-byte access)
                aligned = (addr[1:0] == 2'b00);  // Address must be byte-aligned
                aligned_address = (aligned) ? addr : addr & 32'hFFFFFFFC;  // Adjust address for byte alignment
            end
            3'b001: begin  // lh, lhu (2-byte access)
                aligned = (addr[1:0] == 2'b00);  // Address must be half-word aligned
                aligned_address = (aligned) ? addr : addr & 32'hFFFFFFFE;  // Adjust address for half-word alignment
            end
            3'b010: begin  // lw (4-byte access)
                aligned = (addr[1:0] == 2'b00);  // Address must be word-aligned
                aligned_address = (aligned) ? addr : addr & 32'hFFFFFFFC;  // Adjust address for word alignment
            end
            3'b100: begin  // sb (store byte)
                aligned = (addr[1:0] == 2'b00);  // Byte-aligned
                aligned_address = addr;  // No adjustment needed for byte store
            end
            3'b101: begin  // sh (store half-word)
                aligned = (addr[1:0] == 2'b00);  // Half-word aligned
                aligned_address = addr;  // No adjustment needed for half-word store
            end
            3'b110: begin  // sw (store word)
                aligned = (addr[1:0] == 2'b00);  // Word-aligned
                aligned_address = addr;  // No adjustment needed for word store
            end
            default: begin
                aligned = 0;  // Invalid fun3 value, not aligned
                aligned_address = addr;  // No address adjustment
            end
        endcase
    end
endmodule
