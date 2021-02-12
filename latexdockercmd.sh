#!/usr/bin/env bash

set -eu

IMAGE="blang/latex:ubuntu"

exec docker run \
    --rm \
    --interactive \
    --tty \
    --network none \
    --mount type=bind,src="$PWD",dst=/data \
    "$IMAGE" \
    "$@"
