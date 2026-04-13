#!/bin/bash

VERSION=$(dpkg --info openstack-neutron*.deb | grep Version | awk '{print $2}')
TARGET=$(git branch --show-current)
echo "Will do a release v$VERSION with a tag on branch $TARGET"
gh release create "v$VERSION" --target "$TARGET" *.deb
