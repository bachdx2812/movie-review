#!/bin/bash

git checkout master
git pull
docker-compose run comics rails assets:precompile
docker-compose restart