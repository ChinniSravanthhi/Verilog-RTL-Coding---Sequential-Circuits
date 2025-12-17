`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 22:04:56
// Design Name: 
// Module Name: d
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
// File: d_latch_nand.v
// Description: D Latch implemented using NAND gates

module d_latch_nand (
    input  wire D,   // Data input
    input  wire EN,  // Enable (Latch control)
    output wire Q,   // Output
    output wire Qn   // Complement output
);
    wire Dn;   // NOT of D
    wire S, R; // Set and Reset signals

    // Invert D using NAND gate
    nand (Dn, D, D);

    // Generate S and R using NAND gates
    nand (S, D, EN);
    nand (R, Dn, EN);

    // Cross-coupled NAND latch
    nand (Q, S, Qn);
    nand (Qn, R, Q);

endmodule

