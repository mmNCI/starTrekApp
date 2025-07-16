#!/usr/bin/env bash
sudo apt update && sudo apt install -y build-essential libpq-dev
set -e

echo "Starting..."

cd ~/starTrekApp || exit 1
git pull origin main

echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

docker compose down
docker compose build
docker compose up -d

which ruby
which bundle
ruby -v
bundle -v

bundle exec rails db:migrate RAILS_ENV=production
bundle exec rails assets:precompile RAILS_ENV=production
bundle exec puma -C config/puma.rb


echo "Finished"