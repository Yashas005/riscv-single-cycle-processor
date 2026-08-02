module riscv_top(
    input clk,
    input rst
);
    // Internal Wires (The "Copper Traces")
    wire [31:0] pc_out, pc_next, instr, imm, rd1, rd2, alu_res, alu_b;
    wire [3:0] alu_ctrl;
    wire reg_write, alu_src, zero;

    // 1. Program Counter
    pc PC_INST (.clk(clk), .rst(rst), .pc_next(pc_next), .pc_out(pc_out));

    // 2. PC Adder (Normal flow is PC + 4)
    assign pc_next = pc_out + 4;

    // 3. Instruction Memory (ROM)
    rom ROM_INST (.addr(pc_out), .instruction(instr));

    // 4. Control Unit (The Brain)
    control CTRL_INST (
        .opcode(instr[6:0]), .funct3(instr[14:12]), .funct7(instr[31:25]),
        .reg_write(reg_write), .alu_src(alu_src), .alu_op(alu_ctrl)
    );

    // 5. Register File
    reg_file REG_INST (
        .clk(clk), .rst(rst), .rg_write_en(reg_write),
        .rs1(instr[19:15]), .rs2(instr[24:20]), .rd(instr[11:7]),
        .write_data(alu_res), .rd_data1(rd1), .rd_data2(rd2)
    );

    // 6. Immediate Generator
    imm_gen IMM_INST (.inst(instr), .imm(imm));

    // 7. MUX for ALU Source B (Choose between Register or Immediate)
    assign alu_b = alu_src ? imm : rd2;

    // 8. ALU
    alu ALU_INST (.a(rd1), .b(alu_b), .alu_ctrl(alu_ctrl), .result(alu_res), .zero(zero));

endmodule
