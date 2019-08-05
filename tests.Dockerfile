FROM ruby:alpine
MAINTAINER Carlos Nunez <dev@carlosnunez.me>
ENV LC_ALL=en_US.UTF8

RUN apk add --no-cache curl ruby-nokogiri build-base libxml2-dev \
  libxslt-dev postgresql-dev
COPY Gemfile /
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install --without app

ENTRYPOINT "echo 'Use Docker Compose to run your tests.'"
