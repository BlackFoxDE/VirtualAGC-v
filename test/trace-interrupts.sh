echo Trace test program to find [BOOT, DOWNRUPT, T3RUPT]
sh compile.sh
cd ..
make simulate_decode | grep "Z: 004001\|Z: 004015\|Z: 004041"
cd test