#!/bin/bash

# ----------------------------------------------------------------------
# Compile linear-arrangement-library
# ----------------------------------------------------------------------
echo "Compiling LAL"
cd /workspace/src/linear-arrangement-library

./make_docs.sh

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
echo "Compiling python interface"
cd /workspace/src/python-interface

./make_docs.sh
/workspace/scripts/python_compile.sh

cd ..

