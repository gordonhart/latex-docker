#!/bin/sh

set -e

IMAGE=blang/latex:ubuntu

docker stop latex_daemon 2>/dev/null || true

exec docker run \
    --detach \
    --rm \
    --name latex_daemon \
    --interactive \
    --net=none \
    --tty \
    --volume $PWD:/data \
    "$IMAGE" \
    /bin/sh -c "sleep infinity"
