`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2026 20:25:59
// Design Name: 
// Module Name: sr_t
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
module sr_ff (
    input  wire S,        // Set
    input  wire R,        // Reset
    input  wire clk,      // Clock
    input  wire rst_n,    // Active-low reset
    output reg  Q,        // Output
    output wire Qn        // Complement
);
    assign Qn = ~Q;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Q <= 1'b0;    // Reset output
        else begin
            case ({S, R})
                2'b00: Q <= Q;     // Hold
                2'b01: Q <= 1'b0;  // Reset
                2'b10: Q <= 1'b1;  // Set
                2'b11: Q <= Q;     // Avoid invalid state
            endcase
        end
    end
endmodule
module t_from_sr (
    input  wire T,        // T input
    input  wire clk,
    input  wire rst_n,
    output wire Q,
    output wire Qn
);
    wire S, R;

    // SR inputs from T
    assign S = T & ~Q;
    assign R = T & Q;

    // SR Flip-Flop instance
    sr_ff u_sr (
        .S(S),
        .R(R),
        .clk(clk),
        .rst_n(rst_n),
        .Q(Q),
        .Qn(Qn)
    );
endmodule
