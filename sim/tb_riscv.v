`timescale 1ns / 1ps

module tb_riscv();
    reg clk;
    reg rst;

    // Instantiate the Top Module
    riscv_top dut (
        .clk(clk),
        .rst(rst)
    );

    // Clock Generation: Toggles every 5ns (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;

        // Hold reset for 20ns
        #20;
        rst = 0;

       
        #60;
        
        $display("Simulation Finished. Check waveforms!");
        $finish;
    end
endmodule
