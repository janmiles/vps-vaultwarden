#! /bin/bash -e

cd ~

docker compose pull

docker compose up -d

docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi
