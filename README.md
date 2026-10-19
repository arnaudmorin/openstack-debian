# OpenStack debian packages within a virtualenv

This is designed to build debian packages for openstack `nova` and `neutron` inside a virtualenv (in `/opt/openstack`)

The main goal is to have the latest version and not depend on debian packages from upstream distribution anymore.

## Build
To build the deb, you will need `docker` and then, execute the following:

```bash
$ sudo bash build.sh
```

The `.deb` packages will then be given to you in the root folder of this repo.

## Automated build
A GitHub Actions workflow (`.github/workflows/build.yml`) builds the packages on every
pull request and every push to a release branch (e.g. `2026.2`).

On a push to a release branch, it also creates the matching GitHub release
(`v<release>-<commit count>+<short sha>`) with the `.deb` files attached.
For a pull request, the packages are only available as a workflow artifact.

## Upload a new release
When the packages are built, we can create a new release on github using:

```bash
$ bash release.sh
```
