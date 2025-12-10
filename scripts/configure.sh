#!/bin/bash

echo "Generating en_GB.UTF-8 locale..."
locale-gen en_GB.UTF-8

echo "Generating python3 virtual environment..."
python3.8 -m venv /workspace/.lal
source .lal/bin/activate
pip3 install setuptools wheel ipykernel

echo "Downloading and installing additional software"
mkdir software
cd software
/workspace/scripts/install_swig.sh
cd ..

echo "Downloading and installing LAL"
/workspace/scripts/install_LAL.sh
