FROM ruby:2.5.1-alpine

LABEL maintainer="Team Neuland"

ENV PACKAGES \
  build-base \
  less \
  nodejs \
  postgresql-dev \
  tzdata

RUN apk add --no-cache ${PACKAGES} \
  && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
  && bundle config --global frozen 1

WORKDIR /usr/src

COPY Gemfile Gemfile.lock ./

RUN bundle install -j4 --no-cache --retry=3

COPY . .

CMD ["rails", "s"]
