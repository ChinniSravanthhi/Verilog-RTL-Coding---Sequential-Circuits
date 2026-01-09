`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 22:25:37
// Design Name: 
// Module Name: up_counter
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

module up_counter(
input clk,rst,
output reg [3:0]count);
always @(posedge clk)
begin
if(rst)
begin
count<=4'b0;
end
else
begin
count<=count+1;
end
end
endmodule
