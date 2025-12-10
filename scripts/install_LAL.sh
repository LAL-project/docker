#!/bin/bash

version=21.07

mkdir -p src

cd src
for repo in \
	linear-arrangement-library	\
	;
do
	
	echo "Downloading '$repo'"
	if [ ! -d $repo ]; then
		echo "    Pulling repository for the first time..."
		git clone -q https://github.com/LAL-project/$repo
		if [ ! -z $version ]; then
			echo "    Fetching version '$version'..."
			cd $repo
			git fetch -q origin $version
			git checkout -q $version
			cd ..
		fi
	else
		echo "    Updating..."
		cd $repo
		git pull -q
		cd ..
	fi

done
cd ..

# ----------------------------------------------------------------------
# Compile linear-arrangement-library
# ----------------------------------------------------------------------
echo "Compiling LAL"
cd /workspace/src/linear-arrangement-library

./make_docs.sh c++
./make_docs.sh python

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
cd python-interface

make BUILD=release
make BUILD=debug

cd ..

