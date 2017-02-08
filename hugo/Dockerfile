FROM beevelop/nodejs-python
MAINTAINER David Von Lehman <david@aerobatic.com>

RUN apt-get update -y && apt-get install -y wget git bash

# Install Hugo
RUN wget https://github.com/spf13/hugo/releases/download/v0.18/hugo_0.18-64bit.deb && \
  dpkg -i hugo*.deb

# Upgrade pip
RUN pip install --upgrade pip

# Install pygments
RUN pip install Pygments==2.1.3 \
  pygments-github-lexers==0.0.5

# Install the aerobatic-cli globally
RUN npm install -g aerobatic-cli@1.0.14
