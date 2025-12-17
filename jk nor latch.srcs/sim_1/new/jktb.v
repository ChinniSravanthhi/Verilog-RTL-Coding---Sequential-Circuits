`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 22:36:17
// Design Name: 
// Module Name: jktb
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
`timescale 1ns/1ps

module tb_jk_latch_nor;

    // Inputs
    reg J;
    reg K;
    reg EN;

    // Outputs
    wire Q;
    wire Qn;

    // Instantiate the JK latch
    jk_latch_nor uut (
        .J(J),
        .K(K),
        .EN(EN),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        // Initialize signals
        J = 0; K = 0; EN = 0;
        #10;

        // Test 1: Hold when EN=0
        J = 1; K = 1; EN = 0; #10;

        // Test 2: Set
        EN = 1; J = 1; K = 0; #10;

        // Test 3: Hold (EN=0)
        EN = 0; J = 0; K = 1; #10;

        // Test 4: Reset
        EN = 1; J = 0; K = 1; #10;

        // Test 5: Toggle
        EN = 1; J = 1; K = 1; #10;

        // Test 6: Toggle again
        J = 1; K = 1; EN=1; #10;

        // Test 7: No change
        J = 0; K = 0; #10;

        // Test 8: Reset
        J = 0; K = 1; #10;

        // Test 9: Set
        J = 1; K = 0; #10;

        // Test 10: Disable latch, should hold value
        EN = 0; J = 1; K = 1; #10;

        $finish;
    end

endmodule

