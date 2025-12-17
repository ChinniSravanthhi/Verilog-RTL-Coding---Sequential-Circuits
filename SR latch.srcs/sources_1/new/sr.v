`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 18:54:21
// Design Name: 
// Module Name: sr
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
module sr_latch (
input S, // Set input
input R, // Reset input
output Q, // Normal output
output Qbar // Complementary output
);

// Gate-level implementation using NOR gates
assign Q = ~(R | Qbar);
assign Qbar = ~(S | Q);

endmodule