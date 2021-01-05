echo Trace test program to exclude mainloop
sh compile.sh
cd ..
make simulate_live | grep -v "Z: 004114\|Z: 004115\|Z: 004116\|Z: 004117"
cd test