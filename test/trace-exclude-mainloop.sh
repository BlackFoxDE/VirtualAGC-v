echo Trace test program to exclude mainloop
sh compile.sh
cd ..
make simulate_live | grep -v "Z: 004100\|Z: 004101\|Z: 004102\|Z: 004103"
cd test
