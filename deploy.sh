#!/bin/bash

git checkout comics
git fetch
git pull
docker-compose run comics rails assets:precompile
docker-compose restart