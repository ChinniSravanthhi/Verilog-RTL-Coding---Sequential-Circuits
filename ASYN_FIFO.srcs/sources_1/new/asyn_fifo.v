`timescale 1ns / 1ps
module async_fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8
)(
    input wr_clk,
    input rd_clk,
    input rst,
    input wr_en,
    input rd_en,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output full,
    output empty
);

    localparam ADDR_WIDTH = 3; // for DEPTH=8, 2^3=8

    // Memory
    reg [DATA_WIDTH-1:0] fifo_mem [0:DEPTH-1];

    // Write and read pointers
    reg [ADDR_WIDTH:0] wr_ptr_bin, rd_ptr_bin;
    reg [ADDR_WIDTH:0] wr_ptr_gray, rd_ptr_gray;

    // Synchronized pointers across clocks
    reg [ADDR_WIDTH:0] wr_ptr_gray_rd1, wr_ptr_gray_rd2;
    reg [ADDR_WIDTH:0] rd_ptr_gray_wr1, rd_ptr_gray_wr2;

    // Binary to Gray conversion
    function [ADDR_WIDTH:0] bin2gray(input [ADDR_WIDTH:0] bin);
        bin2gray = (bin >> 1) ^ bin;
    endfunction

    // Gray to Binary conversion
    function [ADDR_WIDTH:0] gray2bin(input [ADDR_WIDTH:0] gray);
        integer i;
        begin
            gray2bin[ADDR_WIDTH] = gray[ADDR_WIDTH];
            for(i=ADDR_WIDTH-1; i>=0; i=i-1)
                gray2bin[i] = gray2bin[i+1] ^ gray[i];
        end
    endfunction

    // ---------------- Write Logic ----------------
    always @(posedge wr_clk or posedge rst) begin
        if(rst) begin
            wr_ptr_bin <= 0;
            wr_ptr_gray <= 0;
        end else if(wr_en && !full) begin
            fifo_mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= data_in;
            wr_ptr_bin <= wr_ptr_bin + 1;
            wr_ptr_gray <= bin2gray(wr_ptr_bin + 1);
        end
    end

    // ---------------- Read Logic ----------------
    always @(posedge rd_clk or posedge rst) begin
        if(rst) begin
            rd_ptr_bin <= 0;
            rd_ptr_gray <= 0;
            data_out <= 0;
        end else if(rd_en && !empty) begin
            data_out <= fifo_mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
            rd_ptr_bin <= rd_ptr_bin + 1;
            rd_ptr_gray <= bin2gray(rd_ptr_bin + 1);
        end
    end

    // ---------------- Pointer Synchronization ----------------
    // Sync read pointer to write clock
    always @(posedge wr_clk or posedge rst) begin
        if(rst) begin
            rd_ptr_gray_wr1 <= 0;
            rd_ptr_gray_wr2 <= 0;
        end else begin
            rd_ptr_gray_wr1 <= rd_ptr_gray;
            rd_ptr_gray_wr2 <= rd_ptr_gray_wr1;
        end
    end

    // Sync write pointer to read clock
    always @(posedge rd_clk or posedge rst) begin
        if(rst) begin
            wr_ptr_gray_rd1 <= 0;
            wr_ptr_gray_rd2 <= 0;
        end else begin
            wr_ptr_gray_rd1 <= wr_ptr_gray;
            wr_ptr_gray_rd2 <= wr_ptr_gray_rd1;
        end
    end

    // ---------------- Full / Empty Flags ----------------
    assign full  = ( (wr_ptr_gray[ADDR_WIDTH] != rd_ptr_gray_wr2[ADDR_WIDTH]) &&
                     (wr_ptr_gray[ADDR_WIDTH-1:0] == rd_ptr_gray_wr2[ADDR_WIDTH-1:0]) );
    assign empty = (rd_ptr_gray == wr_ptr_gray_rd2);

endmodule
