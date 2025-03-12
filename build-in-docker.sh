#!/bin/bash

apt-get update
apt-get install -y build-essential dpkg-dev devscripts

cd $(dirname $(readlink -f $0))

find * -maxdepth 0 -type d | while read folder ; do
    cd $folder
    yes | mk-build-deps -i debian/control
    dpkg-buildpackage -b -uc
    cd ..
done
