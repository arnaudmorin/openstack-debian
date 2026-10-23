#!/bin/bash
# NOTE(arnaud) stop at the first error, so that a package which fails to build
# fails the build, instead of a build with packages missing
set -e

apt-get update
apt-get install -y build-essential dpkg-dev devscripts vim equivs

DIR=$(dirname $(readlink -f $0))
git config --global --add safe.directory $DIR
cd $DIR

# Compute version number for debian package based on number of commits up to this build,
# last git short sha and branch, plus the build date, so that a rebuild of the same commit
# (e.g. to pick up upstream fixes) is a new, upgradable version
# NOTE(arnaud) use "." and not "~" before the date: "~" sorts before the version without it
C=$(git rev-list HEAD --count)
S=$(git rev-parse --short HEAD)
D=$(date -u +%Y%m%d%H%M)
export DEBFULLNAME="Arnaud Morin"
export DEBEMAIL="arnaud.openstack@mailops.fr"

find * -maxdepth 0 -type d | while read folder ; do
    cd $folder
    dch -b -v "2026.2-${C}+${S}.${D}" "New release"
    yes | mk-build-deps -i debian/control
    dpkg-buildpackage -b -uc
    make clean
    cd ..
done

git clean -df
