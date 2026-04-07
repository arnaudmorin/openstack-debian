#!/bin/bash

apt-get update
apt-get install -y build-essential dpkg-dev devscripts vim equivs

DIR=$(dirname $(readlink -f $0))
git config --global --add safe.directory $DIR
cd $DIR

# Compute version number for debian package based on number of commits up to this build,
# last git short sha and branch
C=$(git rev-list HEAD --count)
S=$(git rev-parse --short HEAD)
export DEBFULLNAME="Arnaud Morin"
export DEBEMAIL="arnaud.openstack@mailops.fr"

find * -maxdepth 0 -type d | while read folder ; do
    cd $folder
    dch -b -v "2026.1-${C}+${S}" "New release"
    yes | mk-build-deps -i debian/control
    dpkg-buildpackage -b -uc
    make clean
    cd ..
done

git clean -df
