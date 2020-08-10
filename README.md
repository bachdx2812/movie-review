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
