# OpenStack debian packages within a virtualenv

This is designed to build debian packages for openstack `nova` and `neutron` inside a virtualenv (in `/opt/openstack`)

The main goal is to have the latest version and not depend on debian packages from upstream distribution anymore.

## Build
To build the deb, you will need `docker` and then, execute the following:

```bash
$ sudo bash build.sh
```

The `.deb` packages will then be given to you in the root folder of this repo.

## Upload a new release
When the packages are built, we can create a new release on github using:

```bash
$ bash release.sh
```
