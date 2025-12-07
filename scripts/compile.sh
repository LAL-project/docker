#!/bin/bash

cd src

# ----------------------------------------------------------------------
# Compile linear-arrangement-library
# ----------------------------------------------------------------------
cd linear-arrangement-library

mkdir lal-release
cd lal-release
cmake ../lal -DCMAKE_BUILD_TYPE=Release
make -j4
cd ..

mkdir lal-debug
cd lal-debug
cmake ../lal -DCMAKE_BUILD_TYPE=Debug
make -j4
cd ..

cd ..

# ----------------------------------------------------------------------
# Compile python-interface
# ----------------------------------------------------------------------
cd python-interface

touch modules/documentation.i
./python_compile.sh

cd ..
