`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 22:34:40
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
// JK Latch using NOR gates (Level-sensitive)
// Active HIGH enable signal
module jk_latch_nor (
    input  wire J,     // J input
    input  wire K,     // K input
    input  wire EN,    // Enable (Latch control)
    output reg  Q,     // Output
    output wire Qn     // Complement output
);

    assign Qn = ~Q; // Complement output

    always @(*) begin
        if (EN) begin
            case ({J, K})
                2'b00: Q = Q;       // No change
                2'b01: Q = 1'b0;    // Reset
                2'b10: Q = 1'b1;    // Set
                2'b11: Q = ~Q;      // Toggle
                default: Q = 1'bx;  // Undefined (should not occur)
            endcase
        end
        // If EN=0, latch holds previous value
    end

endmodule
