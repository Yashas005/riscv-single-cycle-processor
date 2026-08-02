module imm_gen(
    input [31:0] inst,    // The 32-bit machine code
    output reg [31:0] imm // The extended 32-bit constant
);
    always @(*) begin
        case (inst[6:0])
            7'b0010011: // I-type (e.g., addi, lw)
                imm = {{20{inst[31]}}, inst[31:20]};
            
            7'b0100011: // S-type (e.g., sw - Store Word)
                imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
            
            7'b1100011: // B-type (e.g., beq - Branch)
                imm = {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
            
            7'b0110111: // U-type (e.g., lui)
                imm = {inst[31:12], 12'b0};
            
            7'b1101111: // J-type (e.g., jal)
                imm = {{11{inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};
                
            default: imm = 32'b0;
        endcase
    end
endmodule
