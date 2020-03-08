#!/bin/sh
IMAGE=blang/latex:ubuntu
exec docker run \
    --detach \
    --rm \
    --name latex_daemon \
    --interactive \
    --user="$(id -u):$(id -g)" \
    --net=none \
    --tty \
    --volume $PWD:/data \
    "$IMAGE" \
    /bin/sh -c "sleep infinity"
