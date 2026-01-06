`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2026 19:00:16
// Design Name: 
// Module Name: tff
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


module t_ff(
input clk,rst,t,
output reg q,
output qbar);
always @(posedge clk or posedge rst)
begin
if(rst)
begin
q<=0;
end
else
begin
case(t)
1'b0:q<=q;
1'b1:q<=~q;
endcase
end
end
assign qbar  =~q;
endmodule
