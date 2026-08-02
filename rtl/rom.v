module rom(
    input  [31:0] addr,
    output reg [31:0] instruction
);

always @(*) begin
    case(addr >> 2)

        0: instruction = 32'h00500093; // addi x1,x0,5
        1: instruction = 32'h00a00113; // addi x2,x0,10
        2: instruction = 32'h001101b3; // add x3,x2,x1
        3: instruction = 32'h40110233; // sub x4,x2,x1

        default:
            instruction = 32'h00000013; // NOP

    endcase
end

endmodule