#!/bin/sh
set -e

if [ -z "`which docker`" ]; then
    echo "Could not find docker." >&2
    echo "Please use the following script to install it: https://get.docker.com/." >&2
    exit 1
fi

SRC_ROOT=$(readlink -f $(dirname $0))

(cd docker-armhf; docker build -t freezfiler-core-build-armhf .)
docker run \
    --rm \
    -t \
    --volume $HOME:$HOME \
    --workdir $SRC_ROOT \
    --user $(id --user):$(id --group) \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --env VERBOSE=$VERBOSE \
    freezfiler-core-build-armhf \
    dpkg-buildpackage \
        --build=binary \
        -j6 \
        --no-sign \
        --host-arch armhf
