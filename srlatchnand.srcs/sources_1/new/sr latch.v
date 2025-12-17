`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 19:31:43
// Design Name: 
// Module Name: sr latch
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
module sr_latch_dataflow (
    input       S,          // Inputs
    input       R,          // 
    output      Q,          // Output
    output      Qn);      //

    // NAND1
    assign Q = ~(S & Qn);

    // NAND2
    assign Qn = ~(R & Q);

endmodule