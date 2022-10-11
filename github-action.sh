#!/usr/bin/env bash

set -eu

docker_username="${1:-}"
docker_password="${2:-}"
version="${3:-}"

echo "${docker_password:?}" | docker login -u "${docker_username:?}" --password-stdin

docker build -t "uribarri/git-ftp:$version" -t "uribarri/git-ftp:latest"  .

docker push "uribarri/git-ftp:$version"
docker push "uribarri/git-ftp:latest"
