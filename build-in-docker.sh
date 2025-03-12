#!/bin/bash

apt-get update
apt-get install -y build-essential debhelper dpkg-buildpackage

find * -maxdepth 0 -type d | while read folder ; do
    cd $folder
    dpkg-buildpackage -b -uc
    cd ..
done
