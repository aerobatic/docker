FROM mhart/alpine-node:4
MAINTAINER David Von Lehman <david@aerobatic.com>

RUN apk add --no-cache wget ca-certificates git openjdk7-jre curl tar bash

# Install redis
# Patches for Alpine compatibility \
ENV REDIS_VERSION="3.0.6" \
	REDIS_DOWNLOAD_URL="http://download.redis.io/releases/redis-3.0.6.tar.gz" \
	REDIS_DOWNLOAD_SHA1="4b1c7b1201984bca8f7f9c6c58862f6928cf0a25"

# Download and build redis
RUN buildDeps='patch make gcc musl-dev linux-headers' \
	&& set -x \
	&& apk add --no-cache $buildDeps \
	&& curl -sSL "$REDIS_DOWNLOAD_URL" -o redis.tar.gz \
	&& echo "$REDIS_DOWNLOAD_SHA1 *redis.tar.gz" | sha1sum -c - \
	&& mkdir -p /usr/src/redis \
	&& tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
	&& rm -f redis.tar.gz \
	&& cd /usr/src/redis \
	&& make \
	&& make install \
	&& cd / \
	&& rm -rf /usr/src \
	&& apk del $buildDeps \
	;

# Install awscli
# RUN pip install awscli

# Download dynamodb-local from AWS
RUN wget "http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz" -O dynamodb-local.tar.gz
RUN mkdir /var/dynamodb-local
RUN tar -xaf dynamodb-local.tar.gz --directory /var/dynamodb-local
RUN chmod +x /var/dynamodb-local/DynamoDBLocal.jar

COPY redis.conf /etc/redis/redis.conf

COPY startup.sh /etc/service/startup
RUN chmod +x /etc/service/startup
