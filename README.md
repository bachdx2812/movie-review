# How to run in local

1. You need an `.env` file, duplicate `.env.example` and edit to fit your environment
2. Run below command to create db

```
bundle exec rake db:create
```

3. Run below command to apply migrations

```
bundle exec rake ridge:apply ALLOW_DROP_TABLE=1 ALLOW_REMOVE_COLUMN=1
```

4. Obtains your google API key for more infos fetchable from youtube. If `YOUTUBE_API_KEY` doesnt provided,
   you can still fetch from youtube but will not able to fetch data like `description` nor `publisedAt`
   
   How to get your google API key: https://console.developers.google.com/

5. Actually we can make an service to crawl data from youtube using `capybara` but will take more time and the process will not be fast, not a good idea though

# Rspec
1. You need an `.env.test.local` file, duplicate `.env.test.local.example` and edit to fit your test environment
2. Create test database

```
bundle exec rake db:create RAILS_ENV=test
```

3. Apply migrations for test database

```
bundle exec rake ridge:apply ALLOW_DROP_TABLE=1 ALLOW_REMOVE_COLUMN=1 RAILS_ENV=test
```
4. Rspec command
```
bundle exec rspec -fd
```

# Installation

You'll need superuser access to run these commands successfully
Start by updating and upgrading our current packages:
```sh
sudo apt update && sudo apt full-upgrade
```
Install the prerequisite packages:
```sh
sudo apt install curl git bridge-utils
```
Install Docker CE:
```sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

Install Docker-Compose:
```sh
sudo curl -s https://api.github.com/repos/docker/compose/releases/latest | grep "browser_download_url" | grep -m1 `uname -s`-`uname -m` | cut -d '"' -f4 | xargs sudo curl -L -o /usr/local/bin/docker-compose
```

Set the permissions: ```sudo chmod +x /usr/local/bin/docker-compose```

Verify the Docker Compose installation: ```docker-compose -v```

Add the current user to the docker group:
```sh
sudo usermod -aG docker $USER
```
Reboot your machine manually, or using the command line:
```
sudo reboot
```

# Deploy Docker Containers
1. Use SSH to connect to a remote server
2. You need an `.env` file, duplicate `.env.production.example` and edit to fit your environment
3. Obtains google API key same way at development environment
4. Put `production.key` key at `config\credentials`
5. Run below command to build docker image
```sh
docker-compose build
```
6. Start docker container in the background
```sh
docker-compose up -d
```
7. Finally, you need to create the database. In another terminal, run
```sh
docker-compose run web bundle exec rake db:create
docker-compose run web bundle exec rake ridge:apply ALLOW_DROP_TABLE=1 ALLOW_REMOVE_COLUMN=1
docker-compose run web bundle exec rake db:seed
```