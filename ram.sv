/*
 * Copyright © 2023 Dmitriy Nekrasov
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
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

logic [DWIDTH-1:0] mem [2**AWIDTH-1:0];

always @( posedge clk_i )
  if( wren_i )
    mem[wraddr_i] <= wrdata_i;

always_ff @( posedge clk_i )
  rddata_o <= mem[rdaddr_i];

endmodule

