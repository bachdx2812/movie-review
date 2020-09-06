#!/bin/bash

git checkout master
git pull
docker-compose run web rails assets:precompile
docker-compose restart