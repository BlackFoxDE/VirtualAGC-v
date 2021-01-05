echo Trace test program to find [BOOT, DOWNRUPT, T3RUPT]
sh compile.sh
cd ..
make simulate_live | grep "Z: 004001\|Z: 004014\|Z: 004040"
cd test