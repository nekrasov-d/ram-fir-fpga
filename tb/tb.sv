/*
 * Copyright © 2023 Dmitriy Nekrasov
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * This is a very primitive testbench, it doesn't verify anything actually, just
 * let you see how it works in general.
 */

`timescale 1ns/1ns

module tb;

bit clk;
bit srst;
bit sample_tick;

initial forever #5 clk = ~clk;

initial
  begin
    @( posedge clk ) srst = 1'b1;
    @( posedge clk ) srst = 1'b0;
  end

bit [4:0] cnt;
always_ff @( posedge clk )
  cnt <= ( srst | sample_tick ) ? '0 : cnt + 1'b1;

assign sample_tick = ( cnt == 5'd20 );

logic [7:0] data_i;
logic [7:0] data_o;

ram_fir #(
  .DWIDTH        ( 8           ),
  .LEN           ( 15          ),
  .COEFFS_FILE   (             )
) dut (
  .clk_i         ( clk         ),
  .srst_i        ( srst        ),
  .sample_tick_i ( sample_tick ),
  .data_i        ( data_i      ),
  .data_o        ( data_o      )
);

task automatic place_data( bit [7:0] data );
  data_i = data;
  @( posedge sample_tick );
  @( posedge clk);
endtask

initial
  begin
    int i;
    for( i = 0; i < 16; i++ )
      place_data( {4'hc, i[3:0]} );
    $stop;
  end
endmodule


