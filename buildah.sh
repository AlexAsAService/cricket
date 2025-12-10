#!/bin/bash

set -eoxu pipefail

container=$(buildah from alpine:latest)
container_mount=$(buildah mount $container)

mkdir $container_mount/app
cp index.js $container_mount/app
cp package.json $container_mount/app

buildah run $container apk add nodejs npm
buildah run $container sh -c "cd app && npm i"
buildah run $container apk del npm
buildah config --cmd '' $container
buildah config --entrypoint '["node", "/app/index"]' $container
buildah commit $container cricket
buildah rm $container

git_hash=$(git rev-parse HEAD)

podman tag cricket "$CONTAINER_REGISTRY/cricket:$git_hash"
podman push "$CONTAINER_REGISTRY/cricket:$git_hash"

podman tag cricket "$CONTAINER_REGISTRY/cricket:latest"
podman push "$CONTAINER_REGISTRY/cricket:latest"