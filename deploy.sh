#!/usr/bin/env bash

set -e

echo "Starting..."

cd ~/starTrekApp || exit 1
git pull origin main

docker-compose down
docker-compose build
docker-compose up -d

echo "Finished"