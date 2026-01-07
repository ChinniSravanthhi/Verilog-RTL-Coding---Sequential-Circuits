`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2026 21:02:18
// Design Name: 
// Module Name: d_jk_ff
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
module tb_d_to_jk_using_jk;
    reg D, clk, rst_n;
    wire Q, Qn;

    // DUT
    d_to_jk_using_jk dut (
        .D(D),
        .clk(clk),
        .rst_n(rst_n),
        .Q(Q),
        .Qn(Qn)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end

    // Test sequence
    initial begin
        $display("Time\tD | J K | Q Qn");
        $monitor("%0t\t%b | %b %b | %b %b", $time, D, D, ~D, Q, Qn);

        // Reset
        rst_n = 0;
        D = 0;
        #12 rst_n = 1;

        // Test cases
        #10 D=0;   // Q should reset
        #10 D=1;   // Q should set
        #10 D=1;   // Q should hold
        #10 D=0;   // Q should reset
        #10 D=1;   // Q should set
        #20 $finish;
    end
endmodule

