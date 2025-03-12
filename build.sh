#!/bin/bash
docker run -it -v $PWD:/v/ debian:bookworm bash -c '/v/build-in-docker.sh'
