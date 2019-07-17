FROM ruby:alpine
MAINTAINER Carlos Nunez <dev@carlosnunez.me>

COPY Gemfile /
RUN bundle install --without app

ENTRYPOINT "echo 'Use Docker Compose to run your tests.'"
