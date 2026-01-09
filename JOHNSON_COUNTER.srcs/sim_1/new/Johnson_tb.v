`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 18:12:47
// Design Name: 
// Module Name: Johnson_tb
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



module johnson_tb();
reg clk,rst;
wire [3:0]count;
johnson dut (clk,rst,count);
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

