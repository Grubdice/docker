#!/bin/bash

set -e

git clone https://github.com/Grubdice/docker.git
cd docker

pushd postgres
docker build -t 'grubdice/postgres' .
popd

pushd grubdice
docker build -t 'grubdice/grubdice' .
popd
