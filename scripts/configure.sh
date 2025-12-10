#!/bin/bash

echo "Generating en_GB.UTF-8 locale..."
locale-gen en_GB.UTF-8

echo "Generating python3 virtual environment..."
python3.12 -m venv /workspace/.lal
source /workspace/.lal/bin/activate
pip install --upgrade pip
pip3 install setuptools wheel ipykernel

echo "Downloading and installing additional software"
mkdir -p /workspace/software
/workspace/scripts/install_swig.sh

echo "Downloading and installing LAL"
/workspace/scripts/install_LAL.sh
