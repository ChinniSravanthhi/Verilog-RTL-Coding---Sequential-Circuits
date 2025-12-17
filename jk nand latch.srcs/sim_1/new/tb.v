`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 23:03:18
// Design Name: 
// Module Name: tb
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
module tb_jk_latch_nand;

    reg J;
    reg K;
    reg clk;
    wire Q;
    wire Qn;

    // Instantiate the JK latch
    jk_latch_nand uut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        // Initialize signals
        J = 0; K = 0; clk = 0;

        $monitor("Time=%0t | J=%b K=%b clk=%b | Q=%b Qn=%b",
                  $time, J, K, clk, Q, Qn);

        // -------- HOLD --------
        #10 J = 0; K = 0; clk = 1;
        #10 clk = 0;

        // -------- SET --------
        #10 J = 1; K = 0; clk = 1;
        #10 clk = 0;

        // -------- HOLD --------
        #10 J = 0; K = 0; clk = 1;
        #10 clk = 0;

        // -------- RESET --------
        #10 J = 0; K = 1; clk = 1;
        #10 clk = 0;

        // -------- TOGGLE --------
        #10 J = 1; K = 1; clk = 1;
        #10 clk = 0;

        // -------- TOGGLE AGAIN --------
        #10 J = 1; K = 1; clk = 1;
        #10 clk = 0;

        #20 $finish;
    end

endmodule
