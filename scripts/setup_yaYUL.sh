#!/bin/bash

echo Downloading yaYUL
git clone https://github.com/AGC-stuff/yaYUL.git
cd yaYUL
echo Setting up yaYUL
cmake .
echo Compiling yaYUL
cmake --build .
cd ..
