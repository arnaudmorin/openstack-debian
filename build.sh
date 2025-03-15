#!/bin/bash
docker run -it --rm -v $PWD:/v/ debian:bookworm bash -c '/v/build-in-docker.sh'
