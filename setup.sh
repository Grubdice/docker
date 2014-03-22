#!/bin/bash

set -e

git clone https://github.com/Grubdice/docker.git
pushd docker

pushd postgres
docker build -t 'grubdice/postgres' .
popd

pushd grubdice
docker build -t 'grubdice/grubdice' .
popd

docker run -d --name postgres grubdice/postgres
docker run -d --name grubdice-prod --link postgres:db -p 80:80 grubdice/grubdice
