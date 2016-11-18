FROM phusion/baseimage:0.9.18

MAINTAINER David Von Lehman <david@aerobatic.com>

# https://github.com/iliyan-trifonov/node-nvm/blob/master/Dockerfile
#use mirrors for faster apt downloads no matter where the machine that builds the image is
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" > /etc/apt/sources.list; \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list; \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list; \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list

# Avoid installing documentation
# https://wiki.ubuntu.com/ReducingDiskFootprint#Documentation
# COPY 01_nodoc.txt /etc/dpkg/dpkg.cfg.d/01_nodoc
RUN apt-add-repository ppa:webupd8team/java

RUN apt-get update -y

#install required software before using nvm/node/npm/bower
RUN apt-get install -y --force-yes software-properties-common \
  curl git python2.7 build-essential python-pip unattended-upgrades

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -y oracle-java8-installer && apt-get clean

# COPY 20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades

# Install redis
RUN apt-get install -y redis-server
COPY redis.conf /etc/redis/redis.conf

# Install awscli
RUN pip install awscli

# Download dynamodb-local from AWS
RUN wget "http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz" -O dynamodb-local.tar.gz
RUN mkdir /var/dynamodb-local
RUN tar -xaf dynamodb-local.tar.gz --directory /var/dynamodb-local
RUN chmod +x /var/dynamodb-local/DynamoDBLocal.jar

COPY startup.sh /etc/service/startup
RUN chmod +x /etc/service/startup

#add user node and use it to install node/npm and run the app
RUN useradd --home /home/node -m -U -s /bin/bash node

#allow some limited sudo commands for user `node`
RUN echo 'Defaults !requiretty' >> /etc/sudoers; \
    echo 'node ALL= NOPASSWD: /usr/sbin/dpkg-reconfigure -f noninteractive tzdata, /usr/bin/tee /etc/timezone, /bin/chown -R node\:node /myapp' >> /etc/sudoers;

#run all of the following commands as user node from now on
USER node

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

#needed by nvm install
ENV NVM_DIR /home/node/.nvm

#install the specified node version and set it as the default one, install the global npm packages
RUN . ~/.nvm/nvm.sh && nvm install 6.9.1 && \
  nvm alias default 6.9.1 && \
  nvm install 4.3.2 && \
  nvm alias 4.3.2
