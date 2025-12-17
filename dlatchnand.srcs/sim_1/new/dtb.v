`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 22:06:33
// Design Name: 
// Module Name: dtb
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
// File: tb_d_latch_nand.v
// Description: Testbench for D Latch using NAND gates

`timescale 1ns/1ps

module tb_d_latch_nand;
    reg D;
    reg EN;
    wire Q;
    wire Qn;

    // Instantiate the D latch
    d_latch_nand uut (
        .D(D),
        .EN(EN),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        // Test sequence
        $display("Time\tEN\tD\tQ\tQn");
        EN = 0; D = 0; #10;
        EN = 1; D = 0; #10; // Latch should reset
        EN = 1; D = 1; #10; // Latch should set
        EN = 0; D = 0; #10; // Hold previous state
        EN = 0; D = 1; #10; // Still hold
        EN = 1; D = 0; #10; // Reset again
        EN = 1; D = 1; #10; // Set again

        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, EN, D, Q, Qn);
    end
endmodule
