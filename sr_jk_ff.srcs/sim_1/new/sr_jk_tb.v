`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2026 19:43:47
// Design Name: 
// Module Name: sr_jk_tb
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
module tb_jk_from_sr;
    reg J, K, clk, rst_n;
    wire Q, Qn;

    // DUT
    jk_from_sr dut (
        .J(J),
        .K(K),
        .clk(clk),
        .rst_n(rst_n),
        .Q(Q),
        .Qn(Qn)
    );

    // Clock: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $display("Time\tJ K | Q Qn");
        $monitor("%0t\t%b %b | %b %b", $time, J, K, Q, Qn);

        // Initialization
        rst_n = 0;
        J = 0; K = 0;
        #12 rst_n = 1;

        // Test cases
        #10 J = 1; K = 0;   // Set
        #10 J = 0; K = 1;   // Reset
        #10 J = 1; K = 1;   // Toggle
        #10 J = 0; K = 0;   // Hold
        #20 J = 1; K = 1;   // Toggle twice

        #20 $finish;
    end
endmodule
