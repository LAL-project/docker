#!/bin/bash

version=23.01

mkdir -p src

cd /workspace/src
for repo in \
	linear-arrangement-library	\
	python-interface			\
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

LAL_HEADERS="../linear-arrangement-library"
LAL_LIBRARY_RELEASE="../linear-arrangement-library/lal-release"
LAL_LIBRARY_DEBUG="../linear-arrangement-library/lal-debug"

PYTHON_HEADERS="/usr/include/python3.8"

./compile.sh \
	--environment=development \
	--lal-headers="$LAL_HEADERS" \
	--lal-libs="$LAL_LIBRARY_RELEASE" \
	--gmp-headers="" \
	--gmp-libs="" \
	--python-headers="$PYTHON_HEADERS" \
	--build=release

./compile.sh \
	--environment=development \
	--lal-headers="$LAL_HEADERS" \
	--lal-libs="$LAL_LIBRARY_DEBUG" \
	--gmp-headers="" \
	--gmp-libs="" \
	--python-headers="$PYTHON_HEADERS" \
	--build=debug

cd ..
