#!/usr/bin/env bash
set -e
set -x
sudo apt update && sudo apt install -y build-essential libpq-dev


echo "Starting..."

cd ~/starTrekApp || exit 1
git pull origin main

echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

docker compose down
docker compose build --no-cache

export SECRET_KEY_BASE=$SECRET_KEY_BASE
echo "SECRET_KEY_BASE is ${SECRET_KEY_BASE} characters long"
docker compose up -d --build


# which ruby
# which bundle
# ruby -v
# bundle -v

docker compose run web bundle exec rails db:migrate RAILS_ENV=production
docker compose run web bundle exec rails assets:precompile RAILS_ENV=production
docker compose exec puma -C config/puma.rb


echo "Finished"