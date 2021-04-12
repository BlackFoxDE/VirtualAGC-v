#!/bin/bash

base=https://github.com/AGC-stuff/

echo Downloading $1
git clone $base$1
cd $1
echo Compiling $1
../yaYUL/yaYUL --hardware MAIN.agc > null
echo Converting $1
python ../scripts/bin_to_verilog_rom.py MAIN.agc.bin rom.v
cp rom.v ..
cd ..
rm -rf $1
