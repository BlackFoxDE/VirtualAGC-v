  
echo Trace test program to find BOOT to identify GOJAM
sh compile.sh
cd ..
make simulate_live | grep "Z: 004001"
cd test
