source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.3", ">= 6.0.3.2"
# Use mysql as the database for Active Record
gem "mysql2", ">= 0.4.4"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "annotate", git: "https://github.com/ctran/annotate_models.git" # annotate models & routes
  gem "awesome_print" # make your rails console display infos better
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails", "~> 2.1", ">= 2.1.1" # env
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", "~> 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "annotate", git: "https://github.com/ctran/annotate_models.git" # annotate models & routes
  gem "awesome_print" # make your rails console display infos better
  gem "faker"
  gem "fasterer" # check slow code
  gem "foreman" # start multiple apps
  gem "rubocop" # ruby code formating
  gem "rubocop-rails" # extension for rubocop
  gem "rspec-rails"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "faker"
  gem "rails-controller-testing"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "active_hash", "~> 2.3.0" # Constants `model like` definition
gem "active_model_serializers", "~> 0.10.0" # serialize resource for API
gem "devise" # Authentication
gem "enum_help" # enum helper methods
gem "pagy" # paging, much more better than kaminari
gem "paper_trail" # versions of activerecord
gem "pundit" # Authorization
gem "ransack" # ActiveRecord searching
gem "rest-client" # http request
gem "ridgepole" # DB management
gem "sidekiq" # background job
gem "faker" # remove this line if don't want to use faker to seed the database in production