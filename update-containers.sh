#! /bin/bash -e

cd ~/vps-vaultwarden

export USERID=$(id -u)
export GROUPID=$(id -g)

docker compose pull

docker compose up -d

docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi
