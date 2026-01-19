`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2026 18:22:43
// Design Name: 
// Module Name: freq_div
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
module frequency_divider(
input clk,
input rst,
output reg clk_out);
reg [2:0] count;
always @(posedge clk or posedge rst)
begin
if(rst)
begin
count<=0;
clk_out<=0;
end
else begin
if(count==2) begin
clk_out<=~clk_out;
count<=0;
end else
count<=count+1;
end
end
endmodule
