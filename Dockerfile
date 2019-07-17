FROM ruby:alpine
MAINTAINER Carlos Nunez <dev@carlosnunez.me>

COPY Gemfile /
RUN bundle install --without test

COPY . /app
WORKDIR /app
ENTRYPOINT [ "ruby", "api.rb" ]
