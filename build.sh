#!/bin/bash
docker run -it --rm -v $PWD:/v/ debian:trixie bash -c '/v/build-in-docker.sh'
