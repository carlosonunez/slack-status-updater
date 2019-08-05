FROM ruby:alpine
MAINTAINER Carlos Nunez <dev@carlosnunez.me>

RUN apk add --no-cache ruby-dev

COPY Gemfile /
RUN bundle install --without test

COPY . /app
WORKDIR /app
ENTRYPOINT [ "ruby", "api.rb" ]
