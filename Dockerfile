# Dockerfile.production
FROM ruby:2.7.1

ENV NODE_ENV production
ENV RAILS_ENV production

# NOTE: Uncomment to run as non-root user (part #1)
#ENV USER_NAME user
#ENV USER_ID 2917
#RUN addgroup --gid $USER_ID $USER_NAME
#RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $USER_ID $USER_NAME

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn default-mysql-client

WORKDIR /usr/src/app

# ensure bundler is present
RUN gem install bundler

# install gems
COPY Gemfile* ./
RUN bundle config set without 'development test'
RUN bundle install --jobs 20 --retry 5

# install yarn packages
COPY package.json yarn.lock ./
RUN yarn install --check-files

# copy all code over
COPY . .

# NOTE: Uncomment to run as non-root user (part #2)
#RUN chown -R $USER_NAME:$USER_NAME $INSTALL_PATH
#USER $USER_ID

#RUN rails webpacker:install
RUN rails assets:precompile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]