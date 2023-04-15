onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/dut/clk_i
add wave -noupdate /tb/dut/srst_i
add wave -noupdate /tb/dut/sample_tick_i
add wave -noupdate -radix hexadecimal /tb/dut/data_i
add wave -noupdate -radix hexadecimal /tb/dut/cnt
add wave -noupdate -radix hexadecimal /tb/dut/state
add wave -noupdate -radix hexadecimal /tb/dut/state_next
add wave -noupdate -radix hexadecimal /tb/dut/data_reg
add wave -noupdate -radix hexadecimal /tb/dut/rdaddr
add wave -noupdate -radix hexadecimal /tb/dut/wraddr
add wave -noupdate -radix hexadecimal /tb/dut/wrdata
add wave -noupdate -radix hexadecimal /tb/dut/value
add wave -noupdate -radix hexadecimal /tb/dut/coeff
add wave -noupdate -radix hexadecimal /tb/dut/wren
add wave -noupdate -radix hexadecimal /tb/dut/mult
add wave -noupdate -radix hexadecimal /tb/dut/mult_bitshift
add wave -noupdate -radix hexadecimal /tb/dut/accum
add wave -noupdate -radix hexadecimal /tb/dut/data_o
add wave -noupdate -divider -height 50 {New Divider}
add wave -noupdate -childformat {{{/tb/dut/values/mem[15]} -radix hexadecimal} {{/tb/dut/values/mem[14]} -radix hexadecimal} {{/tb/dut/values/mem[13]} -radix hexadecimal} {{/tb/dut/values/mem[12]} -radix hexadecimal} {{/tb/dut/values/mem[11]} -radix hexadecimal} {{/tb/dut/values/mem[10]} -radix hexadecimal} {{/tb/dut/values/mem[9]} -radix hexadecimal} {{/tb/dut/values/mem[8]} -radix hexadecimal} {{/tb/dut/values/mem[7]} -radix hexadecimal} {{/tb/dut/values/mem[6]} -radix hexadecimal} {{/tb/dut/values/mem[5]} -radix hexadecimal} {{/tb/dut/values/mem[4]} -radix hexadecimal} {{/tb/dut/values/mem[3]} -radix hexadecimal} {{/tb/dut/values/mem[2]} -radix hexadecimal} {{/tb/dut/values/mem[1]} -radix hexadecimal} {{/tb/dut/values/mem[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb/dut/values/mem[15]} {-radix hexadecimal} {/tb/dut/values/mem[14]} {-radix hexadecimal} {/tb/dut/values/mem[13]} {-radix hexadecimal} {/tb/dut/values/mem[12]} {-radix hexadecimal} {/tb/dut/values/mem[11]} {-radix hexadecimal} {/tb/dut/values/mem[10]} {-radix hexadecimal} {/tb/dut/values/mem[9]} {-radix hexadecimal} {/tb/dut/values/mem[8]} {-radix hexadecimal} {/tb/dut/values/mem[7]} {-radix hexadecimal} {/tb/dut/values/mem[6]} {-radix hexadecimal} {/tb/dut/values/mem[5]} {-radix hexadecimal} {/tb/dut/values/mem[4]} {-radix hexadecimal} {/tb/dut/values/mem[3]} {-radix hexadecimal} {/tb/dut/values/mem[2]} {-radix hexadecimal} {/tb/dut/values/mem[1]} {-radix hexadecimal} {/tb/dut/values/mem[0]} {-radix hexadecimal}} /tb/dut/values/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {245 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {150 ns} {650 ns}
