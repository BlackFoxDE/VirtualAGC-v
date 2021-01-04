../yaYUL/yaYUL --hardware MAIN.agc > null
python ../scripts/bin_to_verilog_rom.py MAIN.agc.bin rom.v
cp rom.v ..
rm MAIN.agc.bin MAIN.agc.symtab null rom.v