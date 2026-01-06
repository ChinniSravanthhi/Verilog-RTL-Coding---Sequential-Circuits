`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2025 20:07:13
// Design Name: 
// Module Name: g
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
module jk_ff_tb();
reg clk,rst,j,k;
wire q,qbar;
jk_ff dut(clk,rst,j,k,q,qbar);
always #5 clk=~clk;
initial clk=0;
initial begin
rst=1;
#10;
rst=0;
{j,k}=2'b00;
#10;
$display("j=%b,k=%b,q=%b,qbar=%b",j,k,q,qbar);
{j,k}=2'b01;
#10;
$display("j=%b,k=%b,q=%b,qbar=%b",j,k,q,qbar);
{j,k}=2'b10;
#10;
$display("j=%b,k=%b,q=%b,qbar=%b",j,k,q,qbar);
{j,k}=2'b11;
#10;
$display("j=%b,k=%b,q=%b,qbar=%b",j,k,q,qbar);
end
initial begin
#200;
$finish();
end
endmodule