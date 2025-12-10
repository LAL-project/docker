#!/bin/bash

echo "    Downloading and installing SWIG 4.4.1"

cd /workspace/software

wget https://github.com/swig/swig/archive/refs/tags/v4.4.1.tar.gz
tar xf v4.4.1.tar.gz
cd swig-4.4.1
./autogen.sh
./configure
make -j4
make install
