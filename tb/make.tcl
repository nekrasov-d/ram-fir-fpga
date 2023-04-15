# Copyright © 2023 Dmitriy Nekrasov
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/
# for more details.
#
# vsim -do make.tcl

vlib work
quit -sim
vlog -quiet -sv ram_test.sv
vlog -quiet -sv rom_test.sv
vlog -quiet -sv ../ram_fir.sv
vlog -quiet -sv tb.sv

vsim -quiet tb -suppress 3116

if [file exists "wave.do"] {
  do wave.do
}

add log -r /tb/*
run -all
