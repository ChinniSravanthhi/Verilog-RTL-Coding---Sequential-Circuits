`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 22:32:32
// Design Name: 
// Module Name: DOWN_c
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

module down_counter(
input clk,rst,
output reg [5:0]count);
always @(posedge clk)
begin
if(rst)
begin
count<=6'b0;
end
else
begin
count<=count-1;
end
end
endmodule
