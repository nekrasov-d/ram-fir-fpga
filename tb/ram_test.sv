/*
 * Copyright © 2023 Dmitriy Nekrasov
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * 16-words length ram imitation to observe data process
 */

module ram #(
  parameter DWIDTH = 16,
  parameter AWIDTH = 9
) (
  input                     clk_i,
  input                     srst_i,
  input [DWIDTH-1:0]        wrdata_i,
  input [AWIDTH-1:0]        wraddr_i,
  input                     wren_i,
  input [AWIDTH-1:0]        rdaddr_i,
  output logic [DWIDTH-1:0] rddata_o
);

logic [7:0] mem [15:0];

always_ff @( posedge clk_i )
  if( srst_i )
    begin
      mem[ 0] <= 8'ha0;
      mem[ 1] <= 8'ha1;
      mem[ 2] <= 8'ha2;
      mem[ 3] <= 8'ha3;
      mem[ 4] <= 8'ha4;
      mem[ 5] <= 8'ha5;
      mem[ 6] <= 8'ha6;
      mem[ 7] <= 8'ha7;
      mem[ 8] <= 8'ha8;
      mem[ 9] <= 8'ha9;
      mem[10] <= 8'haa;
      mem[11] <= 8'hab;
      mem[12] <= 8'hac;
      mem[13] <= 8'had;
      mem[14] <= 8'hae;
      mem[15] <= 8'haf;
    end
  else
    if( wren_i )
      mem[wraddr_i] <= wrdata_i;

always_ff @( posedge clk_i )
  rddata_o <= mem[rdaddr_i];

endmodule
