`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2026 20:33:52
// Design Name: 
// Module Name: sr_d_ff
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
module tb_d_from_sr;
    reg D, clk, rst_n;
    wire Q, Qn;

    // DUT
    d_from_sr dut (
        .D(D),
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
        $display("Time\tD | Q Qn");
        $monitor("%0t\t%b | %b %b", $time, D, Q, Qn);

        // Reset
        rst_n = 0;
        D = 0;
        #12 rst_n = 1;

        // Test cases
        #10 D = 0;   // Q should be 0
        #10 D = 1;   // Q should be 1
        #10 D = 1;   // Q should hold 1
        #10 D = 0;   // Q should go 0
        #10 D = 1;   // Q should go 1
        #20 $finish;
    end
endmodule
