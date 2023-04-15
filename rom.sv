/*
 * Copyright © 2023 Dmitriy Nekrasov
 * This work is free. You can redistribute it and/or modify it under the
 * terms of the Do What The Fuck You Want To Public License, Version 2,
 * as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
 * for more details.
 *
 * An intel/altera megafunction. Won't fit any other vendor synthesizer.
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

altsyncram altsyncram_component (
  .address_a      ( rdaddr_i ),
  .clock0         ( clk_i    ),
  .q_a            ( rddata_o ),
  .aclr0          ( 1'b0     ),
  .aclr1          ( 1'b0     ),
  .address_b      ( 1'b1     ),
  .addressstall_a ( 1'b0     ),
  .addressstall_b ( 1'b0     ),
  .byteena_a      ( 1'b1     ),
  .byteena_b      ( 1'b1     ),
  .clock1         ( 1'b1     ),
  .clocken0       ( 1'b1     ),
  .clocken1       ( 1'b1     ),
  .clocken2       ( 1'b1     ),
  .clocken3       ( 1'b1     ),
  .data_a         ( {32{1'b1}}),
  .data_b         ( 1'b1     ),
  .eccstatus      (          ),
  .q_b            (          ),
  .rden_a         ( 1'b1     ),
  .rden_b         ( 1'b1     ),
  .wren_a         ( 1'b0     ),
  .wren_b         ( 1'b0     )
);
defparam
  altsyncram_component.address_aclr_a        = "NONE",
  altsyncram_component.clock_enable_input_a  = "BYPASS",
  altsyncram_component.clock_enable_output_a = "BYPASS",
  altsyncram_component.init_file             = INIT_FILE,
  altsyncram_component.lpm_hint              = "ENABLE_RUNTIME_MOD=NO",
  altsyncram_component.lpm_type              = "altsyncram",
  altsyncram_component.numwords_a            = 2**AWIDTH,
  altsyncram_component.operation_mode        = "ROM",
  altsyncram_component.outdata_aclr_a        = "NONE",
  altsyncram_component.outdata_reg_a         = "UNREGISTERED",
  altsyncram_component.widthad_a             = AWIDTH,
  altsyncram_component.width_a               = DWIDTH,
  altsyncram_component.width_byteena_a       = 1;

endmodule

