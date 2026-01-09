`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 17:51:45
// Design Name: 
// Module Name: ringcounter
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

module ring_counter_tb();
reg clk,rst;
wire [3:0]q;
ring_counter dut (clk,rst,q);
initial clk=0;
always #5 clk=~clk;
initial begin
rst=1;
#10;
rst=0;
#10;
#200;
end
initial begin
#200;
$finish();
end
endmodule
