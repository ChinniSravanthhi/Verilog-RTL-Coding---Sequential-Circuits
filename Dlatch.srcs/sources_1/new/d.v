`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 20:10:06
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
// D Latch using only NOR gates
module d_latch_nor (
    input  wire D,   // Data input
    input  wire EN,  // Enable (active high)
    output wire Q,   // Output
    output wire Qn   // Complement output
);
    wire S, R;       // Set and Reset signals
    wire nor1_out, nor2_out;

    // Generate S and R from D and EN
    assign S = D & EN;
    assign R = (~D) & EN;

    // SR latch using NOR gates
    nor (nor1_out, S, nor2_out); // Q = NOR(S, Qn)
    nor (nor2_out, R, nor1_out); // Qn = NOR(R, Q)

    // Assign outputs
    assign Q  = nor1_out;
    assign Qn = nor2_out;

endmodule

