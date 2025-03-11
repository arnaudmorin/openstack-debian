#!/bin/bash

find * -maxdepth 0 -type d | while read folder ; do
    cd $folder
    dpkg-buildpackage -b -uc
    cd ..
done
