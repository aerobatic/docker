# Aerobatic docker

A collection of Dockerfiles used by Aerobatic for front-end and back-end CI builds.

### aerobatic/hugo

Alpine based image that can be installed on a Docker enabled CI service to build to generate a [Hugo](https://gohugo.io) site and deploy to [Aerobatic](https://www.aerobatic.com). Has been tested with [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines).

**What's in the box?**
* python / pip (2.7.13)
* hugo (v0.18.1)
* node (v6.9.2)
* [aerobatic-cli](https://www.aerobatic.com/docs/cli/) (1.0.14)

Available on Dockerhub at https://hub.docker.com/r/aerobatic/hugo/


### aerobatic/jekyll

Alpine based image that can be installed on a Docker enabled CI service to build to generate a [Jekyll](https://jekyllrb.com) site and deploy to [Aerobatic](https://www.aerobatic.com). Has been tested with [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines).

**What's in the box?**
* ruby (v2.3.3)
* bundler (v1.14.3)
* jekyll (v3.4.0)
* node (v6.9.2)
* [aerobatic-cli](https://www.aerobatic.com/docs/cli/) (1.0.14)

Available on Dockerhub at https://hub.docker.com/r/aerobatic/hugo/
