`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 20:10:49
// Design Name: 
// Module Name: dtb
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
module tb_d_latch_nor;
    reg D, EN;
    wire Q, Qn;

    // Instantiate the D latch
    d_latch_nor uut (
        .D(D),
        .EN(EN),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin

        // Test sequence
        D = 0; EN = 0; #10; // Hold state
        D = 1; EN = 0; #10; // Hold state
        D = 1; EN = 1; #10; // Latch 1
        D = 0; EN = 1; #10; // Latch 0
        D = 1; EN = 1; #10; // Latch 1
        D = 0; EN = 0; #10; // Hold last value
        D = 1; EN = 0; #10; // Hold last value

        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t | D=%b EN=%b | Q=%b Qn=%b", $time, D, EN, Q, Qn);
    end
endmodule
