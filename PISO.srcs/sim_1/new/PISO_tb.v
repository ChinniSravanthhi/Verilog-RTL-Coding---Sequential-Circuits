`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 17:39:53
// Design Name: 
// Module Name: PISO_tb
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


module tb_PISO;

    // Testbench signals
    reg clk;
    reg rst;
    reg load;
    reg [3:0] parallel_in;
    wire serial_out;

    // Instantiate the DUT
    PISO uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        load = 0;
        parallel_in = 4'b0000;

        // Apply reset
        #12;
        rst = 0;

        // Load parallel data
        #10;
        load = 1;
        parallel_in = 4'b1011;

        // Disable load and start shifting
        #10;
        load = 0;

        // Allow enough clock cycles to shift all bits
        #60;

        // Load another value
        load = 1;
        parallel_in = 4'b1101;

        #10;
        load = 0;

        #60;

        // End simulation
        $stop;
    end

endmodule

