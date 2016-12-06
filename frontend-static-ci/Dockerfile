FROM phusion/baseimage:0.9.18
MAINTAINER David Von Lehman <david@aerobatic.com>

ARG LC_ALL=C
ARG DEBIAN_FRONTEND=noninteractive

# Avoid installing documentation
# https://wiki.ubuntu.com/ReducingDiskFootprint#Documentation
COPY 01_nodoc.txt /etc/dpkg/dpkg.cfg.d/01_nodoc

# Install the brightbox ruby repository
# https://www.brightbox.com/blog/2016/01/06/ruby-2-3-ubuntu-packages/
RUN apt-add-repository ppa:brightbox/ruby-ng

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" > /etc/apt/sources.list; \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list; \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list; \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update -y

RUN apt-get install -y zlibc \
  libgcrypt11-dev zlib1g-dev build-essential git \
  libssl-dev libffi-dev

# Install native libraries used by build tools
RUN apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev --fix-missing

# Install ruby and other dependencies needed by native gem extensions
# We need both ruby2.3-dev and ruby1.9.1-dev for some reason in order to
# build the ffi gem. Seems 1.9.1 contains libs that 2.3 does not.
RUN apt-get install -y -q ruby1.9.1-dev ruby2.3 ruby2.3-dev libxml2 libxml2-dev libxslt1-dev

# Make sure symlinks point to ruby 2.3
RUN ln -sf /usr/bin/gem2.3 /usr/bin/gem && \
  ln -sf /usr/bin/ruby2.3 /usr/bin/ruby

# Install bundler
RUN gem install rake bundler --no-rdoc --no-ri

# Install Python and pip
RUN apt-get install -y python2.7 python-dev python-pip --fix-missing

# needed by nvm install
ENV NVM_DIR /.nvm

# Install nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

# Install both node latest 6.x and 4.
RUN . /.nvm/nvm.sh && nvm install 6.9.1 && \
  nvm alias default 6.9.1 && \
  nvm install 4.3.2 && \
  nvm alias 4.3.2

# Install phantomjs with npm rather than apt-get
# RUN npm install phantomjs-prebuilt@2.1.12

# Install Hugo
RUN curl --fail -ssL -o /tmp/setup-hugo http://ftp.us.debian.org/debian/pool/main/h/hugo/hugo_0.16-2_amd64.deb && \
  dpkg -i /tmp/setup-hugo && rm -f /tmp/setup-hugo

# Pip install python packages
RUN apt-get install python-pygments=1.6+dfsg-1ubuntu1
RUN pip install Pygments==2.1.3 \
  pygments-github-lexers==0.0.5 \
  virtualenv==15.0.3

# Set common environment variables
ENV NODE_ENV=production
ENV JEKYLL_ENV=production
ENV LC_ALL=en_US.UTF-8
ENV CI=yes
