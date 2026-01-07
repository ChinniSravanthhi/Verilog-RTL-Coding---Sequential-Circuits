`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2026 20:27:49
// Design Name: 
// Module Name: sr_t_tb
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
//////////////////////////////////////////////////////////////////////////////////
module tb_t_from_sr;
    reg T, clk, rst_n;
    wire Q, Qn;

    // DUT
    t_from_sr dut (
        .T(T),
        .clk(clk),
        .rst_n(rst_n),
        .Q(Q),
        .Qn(Qn)
    );

    // Clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $display("Time\tT | Q Qn");
        $monitor("%0t\t%b | %b %b", $time, T, Q, Qn);

        // Reset
        rst_n = 0;
        T = 0;
        #12 rst_n = 1;

        // Test cases
        #10 T = 0;   // Hold
        #10 T = 1;   // Toggle
        #10 T = 1;   // Toggle again
        #10 T = 0;   // Hold
        #10 T = 1;   // Toggle
        #20 $finish;
    end
endmodule

