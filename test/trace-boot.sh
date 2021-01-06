  
echo Trace test program to find BOOT to identify GOJAM
sh compile.sh
cd ..
make simulate_decode | grep "Z: 004001"
cd test
