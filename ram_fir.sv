/*
 * Copyright © 2023 Dmitriy Nekrasov
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * Top level. See REAMDE.md
 */

module ram_fir #(
  parameter DWIDTH      = 16,
  parameter LEN         = 511,
  parameter COEFFS_FILE = "none.mif"
) (
  input                     clk_i,
  input                     srst_i,
  input                     sample_tick_i,
  input        [DWIDTH-1:0] data_i,
  output logic [DWIDTH-1:0] data_o
);

localparam RAM_AWIDTH = $clog2(LEN);

//**************************************************************************
// Control plane

logic [RAM_AWIDTH-1:0] cnt;

enum logic [1:0] {
  INIT_S,
  WAIT_START_S,
  RUN_S,
  LAST_OP_S
} state;

always_ff @( posedge clk_i )
  if( srst_i )
    state <= INIT_S;
  else
    case( state )
      INIT_S       : state <= WAIT_START_S;
      WAIT_START_S : state <= sample_tick_i ? RUN_S : WAIT_START_S;
      RUN_S        : state <= ( cnt == LEN ) ? LAST_OP_S : RUN_S;
      LAST_OP_S    : state <= WAIT_START_S;
    endcase

always_ff @( posedge clk_i )
  case( state )
    WAIT_START_S : cnt <= sample_tick_i ? 1 : 0;
    RUN_S        : cnt <= cnt + 1;
    default      : cnt <= 0;
  endcase

//*****************************************************************************
// Data plane

//input data storage
logic [DWIDTH-1:0]     data_reg;
// ram/rom wires
logic [RAM_AWIDTH-1:0] rdaddr;
logic [RAM_AWIDTH-1:0] wraddr;
logic [DWIDTH-1:0]     wrdata;
logic [DWIDTH-1:0]     value;
logic [DWIDTH-1:0]     coeff;
logic                  wren;

logic signed [DWIDTH*2-1:0] mult;
logic [DWIDTH-1:0]          mult_bitshift;
logic [DWIDTH-1:0]          accum;

always_ff @( posedge clk_i )
  if( sample_tick_i )
    data_reg <= data_i;

always_comb
  case( state )
    RUN_S   : rdaddr = LEN - 1 - cnt;
    default : rdaddr = LEN - 1;
  endcase

always_comb
  case( state )
    LAST_OP_S : wraddr = 0;
    default   : wraddr = rdaddr + 2;
  endcase

always_comb
  case( state )
    LAST_OP_S : wrdata = data_reg;
    default   : wrdata = value;
  endcase

assign wren   = state==RUN_S || state==LAST_OP_S;

ram #(
  .DWIDTH       ( DWIDTH        ),
  .AWIDTH       ( RAM_AWIDTH    )
) values (
  .clk_i        ( clk_i         ),
  .srst_i       ( srst_i        ),
  .wrdata_i     ( wrdata        ),
  .wraddr_i     ( wraddr        ),
  .wren_i       ( wren          ),
  .rdaddr_i     ( rdaddr        ),
  .rddata_o     ( value         )
);

rom #(
  .DWIDTH       ( DWIDTH        ),
  .AWIDTH       ( RAM_AWIDTH    ),
  .INIT_FILE    ( COEFFS_FILE   )
) coefficients (
  .clk_i        ( clk_i         ),
  .rdaddr_i     ( rdaddr        ),
  .rddata_o     ( coeff         )
);

assign mult          = $signed(value) * $signed(coeff);
assign mult_bitshift = mult >> DWIDTH;

always_ff @( posedge clk_i )
  accum <= state==RUN_S ? accum + mult_bitshift : '0;

always_ff @( posedge clk_i )
  if( srst_i )
    data_o <= '0;
  else
    if( state==LAST_OP_S )
      data_o <= accum;

endmodule






