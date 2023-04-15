# ram-fir-fpga

A simple FIR implementation utilizing FPGA block ram

## Features

  * Variable data/coefficient (they share the same value) bitwidth
  * Variable tap amount (LEN)
  * Takes LEN clock periods to process one data sample
  * Utilizes two 2^ceil(log2(LEN)) RAM blocks (one for coefficients one for data)
  * Tap coefficients are read-only during runtime
  * You can use gen_coefficients.py script with firwin function to calculate
    coefficints and create intel/altera suitable ROM initialization file
    or create yours if you has another platform.
  * Because the algorithm requires LEN+1 registers, you'd like to create 510-tap
    filter rather than 512 because 512-tap filter is going to utilize 1024-word
    RAM block.

## Verification / testing

tb/tb.sv testbench is just to observe waveforms with a small-parameter setting.

I use 511-tap highpass variation in my guitar pedal (25MHz clock, 44100
Samples/s data rate), works just fine.

## Authors

 -- Dmitry Nekrasov <bluebag@yandex.ru>  Sat, 15 Apr 2023 17:51:27 +0300

## License

WTFPL 2.0
