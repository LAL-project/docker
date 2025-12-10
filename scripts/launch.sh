#!/bin/bash

version=24.10

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

echo "Building docker..."
docker compose up --build -d

echo "Execute the container"
docker compose exec lal-build bash
