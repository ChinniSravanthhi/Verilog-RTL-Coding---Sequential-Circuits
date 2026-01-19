`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2026 18:16:44
// Design Name: 
// Module Name: fifo_tb
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

module async_fifo_tb;

  parameter DATA_WIDTH = 8;
  parameter DEPTH = 8;

  // Clocks
  reg wr_clk = 0;
  reg rd_clk = 0;

  // Reset and control signals
  reg rst;
  reg wr_en, rd_en;
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  wire full, empty;

  // FIFO fill counter (for graph)
  reg [3:0] fifo_cnt = 0;

  // Instantiate FIFO
  async_fifo #(DATA_WIDTH, DEPTH) dut (
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  // ---------------- Clock Generation ----------------
  initial forever #5 wr_clk = ~wr_clk;   // Write clock = 10ns
  initial forever #7 rd_clk = ~rd_clk;   // Read clock = 14ns

  // ---------------- Test Sequence ----------------
  initial begin
    rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
    #20 rst = 0;

    // Push 10 items
    push(1);
    push(2);
    push(10);
    push(20);
    push(30);
    push(40);
    push(50);
    push(60);
    push(70);
    push(80); // should hit FIFO full if DEPTH=8

    // Pop 5 items
    pop();
    pop();
    pop();
    pop();
    pop();

    // Push more items
    push(90);
    push(100);

    // Pop all remaining
    repeat(10) pop();

    $finish;
  end

  // ---------------- Push Task ----------------
  task push(input [DATA_WIDTH-1:0] data);
  begin
    @(posedge wr_clk);
    if(full)
      $display("%0t: FIFO full, cannot push %d", $time, data);
    else begin
      data_in = data;
      wr_en = 1;
      fifo_cnt = fifo_cnt + 1;
      display_graph(data, 1); // show push
    end
    @(posedge wr_clk) wr_en = 0;
  end
  endtask

  // ---------------- Pop Task ----------------
  task pop;
  begin
    @(posedge rd_clk);
    if(empty)
      $display("%0t: FIFO empty, cannot pop", $time);
    else begin
      rd_en = 1;
      fifo_cnt = fifo_cnt - 1;
      display_graph(data_out, 0); // show pop
    end
    @(posedge rd_clk) rd_en = 0;
  end
  endtask

  // ---------------- Graph Display ----------------
  task display_graph(input [DATA_WIDTH-1:0] value, input is_push);
  integer i;
  begin
    if(is_push)
      $write("%0t: pushed %0d | FIFO: ", $time, value);
    else
      $write("%0t: popped %0d | FIFO: ", $time, value);

    for(i=0; i<fifo_cnt; i=i+1)
      $write("#"); // '#' represents one element
    $write("\n");
  end
  endtask

endmodule
