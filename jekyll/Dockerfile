FROM alpine
MAINTAINER David Von Lehman <david@aerobatic.com>

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8
ENV JEKYLL_ENV=development
ENV LC_ALL=en_US

RUN apk --update add zlib-dev build-base libxml2-dev \
  libxslt-dev readline-dev \
  libffi-dev ruby-dev yaml-dev zlib libxml2 \
  build-base ruby-io-console readline libxslt ruby yaml libffi nodejs ruby-irb \
  ruby-json ruby-rake ruby-rdoc git bash

RUN gem clean && gem install --no-ri --no-rdoc \
  bundler json:1.8.6 nokogiri:1.7.0.1 jekyll:3.4.0

RUN rm -rf /usr/lib/ruby/gems/*/cache/*.gem

# Install the aerobatic-cli globally
RUN npm install -g aerobatic-cli@1.0.31
