`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 19:34:20
// Design Name: 
// Module Name: srtb
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
// File: tb_sr_latch_nand.

module tb_sr_latch_dataflow;

    reg S, R;       // Inputs
    wire Q, Qn;     // Outputs

    // Instantiate the SR latch
    sr_latch_dataflow uut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qn(Qn)
    );

    // Test sequence
    initial begin
        // Initial state
        S = 1; R = 1; #10; // Hold state

        // Set operation (S=0, R=1)
        S = 0; R = 1; #10;

        // Hold state
        S = 1; R = 1; #10;

        // Reset operation (S=1, R=0)
        S = 1; R = 0; #10;

        // Hold state
        S = 1; R = 1; #10;

        // Invalid condition (S=0, R=0)
        S = 0; R = 0; #10;

        // Back to hold
        S = 1; R = 1; #10;

        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t | S=%b R=%b | Q=%b Qn=%b", $time, S, R, Q, Qn);
    end

endmodule

