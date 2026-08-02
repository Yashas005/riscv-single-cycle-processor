module reg_file(
    input clk,
    input rst,
    input rg_write_en,          // Logic '1' if we want to save data to a register
    input [4:0] rs1, rs2, rd,   // 5-bit addresses (since there are 32 registers)
    input [31:0] write_data,    // Data coming from ALU or Memory
    output [31:0] rd_data1,     // Sent to ALU Input A
    output [31:0] rd_data2      // Sent to ALU Input B
);
    reg [31:0] registers [31:0]; 

    // Asynchronous Read: Data is available as soon as the address changes
    assign rd_data1 = (rs1 == 5'b0) ? 32'b0 : registers[rs1];
    assign rd_data2 = (rs2 == 5'b0) ? 32'b0 : registers[rs2];

    // Synchronous Write: Data is saved on the clock edge
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'b0;// used <=(nonblocking assignment because to reset all the registers at a time)
        end else if (rg_write_en && (rd != 5'b0)) begin
            registers[rd] <= write_data;
        end
    end
endmodule
