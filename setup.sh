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

cp services/postgres.service /media/state/units
sudo systemctl link --runtime /media/state/units/postgres.service
sudo systemctl start postgres.service

cp services/grubdice.service /media/state/units
sudo systemctl link --runtime /media/state/units/grubdice.service
sudo systemctl start grubdice.service
