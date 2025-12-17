`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2025 18:36:54
// Design Name: 
// Module Name: tb_t_latch
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


module tb_t_latch();
reg T,EN;
wire Q;
t_latch tb_t_latch (.T(T), .EN(EN), .Q(Q));
initial begin
$monitor("Time=%0t|EN=%b T=%b| Q=%b", $time, EN, T,Q);
EN =0; T=0;
#5 EN=1; T=1;
#5 T=0;
#5 T=1;
#5 EN=0; T=1;
#5 $finish;
end
endmodule
