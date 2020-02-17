#!/bin/bash

git clone git@github.com:ten4ssdp/front-office.git client && cd ./client
git checkout develop && cd ..

git clone git@github.com:ten4ssdp/planning-api.git serveur && cd ./serveur
git checkout develop && cd ..

docker-compose up