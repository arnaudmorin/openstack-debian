#!/bin/bash

apt-get update
apt-get install -y build-essential dpkg-dev devscripts vim

DIR=$(dirname $(readlink -f $0))
git config --global --add safe.directory $DIR
cd $DIR

# Compute version number for debian package based on number of commits up to this build
# and the last git short sha
C=$(git rev-list HEAD --count)
S=$(git rev-parse --short HEAD)
export DEBFULLNAME="Arnaud Morin"
export DEBEMAIL="arnaud.openstack@mailops.fr"

find * -maxdepth 0 -type d | while read folder ; do
    cd $folder
    dch -b -v "2024.2-${C}+${S}" "New release"
    yes | mk-build-deps -i debian/control
    dpkg-buildpackage -b -uc
    cd ..
done

git clean -df
