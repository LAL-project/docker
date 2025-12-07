#!/bin/bash

version=$1
if [ ! -z $version ]; then
	echo "Pulling version '$version'..."
fi

mkdir -p src

cd src
for repo in \
	linear-arrangement-library	\
	python-interface			\
	;
do
	
	echo "Downloading '$repo'"
	if [ ! -d $repo ]; then
		echo "    Pulling repository for the first time..."
		git clone -q https://github.com/LAL-project/$repo
		echo "    Fetching version '$version'..."
		cd $repo
		git fetch -q origin $1
		git checkout -q $1
		cd ..
	else
		echo "    Updating..."
		cd $repo
		git pull -q
		cd ..
	fi

done
cd ..

echo "Building docker..."
docker compose up --build

echo "Execute the container"
docker compose run --rm lal-build bash
