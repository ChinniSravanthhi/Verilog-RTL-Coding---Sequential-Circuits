`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2025 19:52:58
// Design Name: 
// Module Name: d_ff
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
module d_ff(
input clk,rst,d,
output reg  q ,qbar);
always @(posedge clk)
begin
if(rst)
begin
q <=0;
qbar <=1;
end
else begin
case(d)
1'b0:{q,qbar}<={1'b0,1'b1};
1'b1:{q,qbar}<={1'b1,1'b0};
endcase
end
end
endmodule