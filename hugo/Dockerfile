FROM alpine:latest
MAINTAINER David Von Lehman <david@aerobatic.com>

ENV HUGO_VERSION=0.19

RUN apk add --no-cache wget ca-certificates nodejs python2 python2-dev py-pip bash git

# Install hugo
# Borrowed from https://github.com/jojomi/docker-hugo/blob/master/Dockerfile
RUN cd /tmp/ && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  mv hugo*/hugo* /usr/bin/hugo

RUN apk del wget ca-certificates

# Install pygments
RUN pip install --upgrade pip && \
  pip install Pygments==2.1.3 pygments-github-lexers==0.0.5

# Install the aerobatic-cli globally
RUN npm install -g aerobatic-cli@1.0.31
