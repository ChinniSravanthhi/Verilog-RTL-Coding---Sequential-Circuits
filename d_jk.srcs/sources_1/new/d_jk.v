`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2026 21:01:15
// Design Name: 
// Module Name: d_jk
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
module jk_ff (
    input  wire J,
    input  wire K,
    input  wire clk,
    input  wire rst_n,   // Active-low asynchronous reset
    output reg  Q,
    output wire Qn
);
    assign Qn = ~Q;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Q <= 1'b0;           // Reset
        else begin
            case ({J,K})
                2'b00: Q <= Q;    // Hold
                2'b01: Q <= 1'b0; // Reset
                2'b10: Q <= 1'b1; // Set
                2'b11: Q <= ~Q;   // Toggle
            endcase
        end
    end
endmodule
module d_to_jk_using_jk (
    input  wire D,
    input  wire clk,
    input  wire rst_n,
    output wire Q,
    output wire Qn
);
    wire J, K;

    // Generate JK inputs from D
    assign J = D;      // Set when D=1
    assign K = ~D;     // Reset when D=0

    // Instantiate JK flip-flop
    jk_ff u_jk (
        .J(J),
        .K(K),
        .clk(clk),
        .rst_n(rst_n),
        .Q(Q),
        .Qn(Qn)
    );
endmodule

