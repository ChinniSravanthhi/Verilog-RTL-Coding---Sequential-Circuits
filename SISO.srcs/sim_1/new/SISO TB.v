`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 17:23:04
// Design Name: 
// Module Name: SISO TB
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
module SISO_tb();
reg clk,rst;
reg serial_in;
wire serial_out;
SISO dut(clk,rst,serial_in,serial_out);
initial clk=0;
always #5 clk=~clk;
initial begin
rst=1;
serial_in=0;
#10;
rst=0;
#10;
serial_in=1;
#10;
serial_in=0;
#10;
serial_in=1;
#10;
serial_in=1;
#10;
serial_in=0;
#10;

#50;
rst=1;
#10;
rst=0;
#10;
$finish();
end
endmodule
