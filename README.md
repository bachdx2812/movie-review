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

# Deploy Docker Containers
1. You need an `.env` file, duplicate `.env.production.example` and edit to fit your environment
2. Obtains google API key same way at development environment
3. Put `production.key` key at `config\credentials`
4. Run below command to build docker image
```sh
docker-compose build
```
3. Start docker container in the background
```sh
docker-compose up -d
```
4. Open new terminal and run command to create db and apply migrations
```sh
docker-compose run web bundle exec rake db:create
docker-compose run web bundle exec rake ridge:apply ALLOW_DROP_TABLE=1 ALLOW_REMOVE_COLUMN=1
docker-compose run web bundle exec rake db:seed
```