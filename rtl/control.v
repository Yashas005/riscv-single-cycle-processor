
module control(
    input [6:0] opcode,      // inst[6:0]
    input [2:0] funct3,      // inst[14:12]
    input [6:0] funct7,      // inst[31:25]
    output reg reg_write,    // Write to Register File?
    output reg alu_src,      // 0: Register, 1: Immediate
    output reg [3:0] alu_op  // To ALU: 0000=Add, 0001=Sub, etc.
);
    always @(*) begin
        // Default values
        reg_write = 0;
        alu_src = 0;
        alu_op = 4'b0000;

        case(opcode)
            7'b0110011: begin // R-type (add, sub, etc.)
                reg_write = 1;
                alu_src = 0;
                if (funct7 == 7'b0100000) alu_op = 4'b0001; // SUB
                else alu_op = 4'b0000; // ADD
            end

            7'b0010011: begin // I-type (addi, etc.)
                reg_write = 1;
                alu_src = 1;
                alu_op = 4'b0000; // ADDI
            end

            default: begin
                reg_write = 0;
                alu_src = 0;
                alu_op = 4'b0000;
            end
        endcase
    end
endmodule
