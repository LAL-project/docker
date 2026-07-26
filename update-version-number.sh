#!/bin/bash

newvernum=$1
if [ -z $newvernum ]; then
    echo "New version number was not provided"
    exit
fi

echo "Updating version number to $newvernum"

sed -i "s/version=/version=$newvernum/g" README.md
sed -i "s/version=/version=$newvernum/g" scripts/install_lal.sh