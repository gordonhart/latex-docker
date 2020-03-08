#!/usr/bin/env bash

set -eu

IMAGE="blang/latex:ubuntu"
ACTIVE_DOCKER_MACHINE="$(docker-machine active)"
UID_GID="$(docker-machine ssh $ACTIVE_DOCKER_MACHINE 'echo "$(id -u):$(id -g)"')"

exec docker run \
    --rm \
    --interactive \
    --tty \
    --network none \
    --user "$UID_GID" \
    --mount type=bind,src="$PWD",dst=/data \
    "$IMAGE" \
    "$@"
