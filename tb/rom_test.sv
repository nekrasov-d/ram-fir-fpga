/*
 * Copyright © 2023 Dmitriy Nekrasov
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * 16-words length rom imitation to observe data process
 */

module rom #(
  parameter DWIDTH   = 16,
  parameter AWIDTH    = 9,
  parameter INIT_FILE = "some_file.mif"
) (
  input                     clk_i,
  input [AWIDTH-1:0]        rdaddr_i,
  output logic [DWIDTH-1:0] rddata_o
);

logic [7:0] mem [15:0];
initial mem[ 0] = 8'hb0;
initial mem[ 1] = 8'hb1;
initial mem[ 2] = 8'hb2;
initial mem[ 3] = 8'hb3;
initial mem[ 4] = 8'hb4;
initial mem[ 5] = 8'hb5;
initial mem[ 6] = 8'hb6;
initial mem[ 7] = 8'hb7;
initial mem[ 8] = 8'hb8;
initial mem[ 9] = 8'hb9;
initial mem[10] = 8'hba;
initial mem[11] = 8'hbb;
initial mem[12] = 8'hbc;
initial mem[13] = 8'hbd;
initial mem[14] = 8'hbe;
initial mem[15] = 8'hbf;

always_ff @( posedge clk_i )
  rddata_o <= mem[rdaddr_i];

endmodule

