`timescale 1ns / 1ps

module fifo_tb;

  reg clk, rst, wr, rd;
  reg [7:0] data_in;
  reg [7:0] tempdata;
  wire [7:0] data_out;
  wire [3:0] fifo_cnt;
  wire empty, full;

  // Instantiate FIFO
  fifo dut(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .wr(wr),
    .rd(rd),
    .empty(empty),
    .full(full),
    .fifo_cnt(fifo_cnt),
    .data_out(data_out)
  );

  // Clock generation: 10 ns period
  initial clk = 0;
  always #5 clk = ~clk;

  // Initialize
  initial begin
    rst = 1; wr = 0; rd = 0; data_in = 0; tempdata = 0;
    #15;
    rst = 0;

    // Sequence of pushes and pops
    push(1);
    push(2);
    pop(tempdata);

    push(10);
    push(20);
    push(30);
    push(40);
    push(50);
    push(60);
    push(70);
    push(80);
    push(90);   // Should trigger "full" after 8 pushes
    push(100);
    push(110);

    pop(tempdata);
    pop(tempdata);
    pop(tempdata);

    push(140);

    // Pop all remaining
    repeat(10) pop(tempdata);

    push(5);
    pop(tempdata);

    $finish;
  end

  // Push task: write data to FIFO safely
  task push(input [7:0] data);
  begin
    @(posedge clk); // wait for clock edge
    if(full)
      $display("%0t: cannot push %d, FIFO full", $time, data);
    else begin
      data_in = data;
      wr = 1;
      @(posedge clk); // write happens on rising edge
      wr = 0;
      $display("%0t: pushed %d", $time, data);
    end
  end
  endtask

  // Pop task: read data from FIFO safely
  task pop(output [7:0] data);
  begin
    @(posedge clk);
    if(empty) begin
      $display("%0t: cannot pop, FIFO empty", $time);
      data = 8'hxx; // indicate invalid read
    end
    else begin
      rd = 1;
      @(posedge clk); // read happens on rising edge
      data = data_out;
      rd = 0;
      $display("%0t: popped %d", $time, data);
    end
  end
  endtask

endmodule
