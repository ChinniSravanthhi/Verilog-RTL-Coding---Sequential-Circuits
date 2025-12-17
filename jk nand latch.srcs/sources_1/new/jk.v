`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 23:01:38
// Design Name: 
// Module Name: jk
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
//======================================================
// JK Latch using NAND gates (Gate-Level Modeling)
//======================================================
//======================================================
// JK Latch using NAND gates (Gate-Level, level-sensitive)
// No asynchronous reset
//======================================================
//==============================================
// JK Latch using NAND Gates (Gate-Level Model)
//==============================================
module jk_latch_nand (
    input  wire J,      // J input
    input  wire K,      // K input
    input  wire clk,    // Enable (level-sensitive)
    output wire Q,      // Output
    output wire Qn      // Complement output
);

    wire j_gated;
    wire k_gated;

    // Gate J with clock and Qn
    nand (j_gated, J, clk, Qn);

    // Gate K with clock and Q
    nand (k_gated, K, clk, Q);

    // Cross-coupled NAND latch
    nand (Q,  j_gated, Qn);
    nand (Qn, k_gated, Q);

endmodule

