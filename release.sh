#!/bin/bash

VERSION=$(dpkg --info openstack-neutron*.deb | grep Version | awk '{print $2}')
gh release create "v$VERSION" *.deb
