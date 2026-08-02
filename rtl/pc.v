module pc(
    input clk,
    input rst,
    input [31:0] pc_next,  // The address we want to go to next
    output reg [31:0] pc_out // The address we are at right now
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            pc_out <= 32'h0000_0000; // Reset to the start of memory
        else
            pc_out <= pc_next;       // Update to the next address
    end
endmodule
