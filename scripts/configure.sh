#!/bin/bash

echo "Generating en_GB.UTF-8 locale..."
locale-gen en_GB.UTF-8

echo "Generating python3 virtual environment..."
python3.12 -m venv /workspace/.lal
source .lal/bin/activate
pip3 install setuptools wheel ipykernel

echo "Compiling LAL"
./scripts/compile.sh
