`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 18:56:34
// Design Name: 
// Module Name: sr tb
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
`timescale 1ns / 1ps

module sr_latch_tb;

    reg S;
    reg R;
    wire Q;
    wire Qbar;

    // Instantiate the DUT
    sr_latch dut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        // Monitor values in simulation
        $monitor("Time=%0t | S=%b R=%b | Q=%b Qbar=%b", 
                  $time, S, R, Q, Qbar);

        // Initial condition
        S = 0; R = 0;
        #10;

        // Set state
        S = 1; R = 0;
        #10;

        // Hold state
        S = 0; R = 0;
        #10;

        // Reset state
        S = 0; R = 1;
        #10;

        // Hold state
        S = 0; R = 0;
        #10;

        // Invalid condition (not recommended)
        S = 1; R = 1;
        #10;

        $finish;
    end

endmodule
