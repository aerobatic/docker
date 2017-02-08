# Aerobatic docker

A collection of Dockerfiles used by Aerobatic for front-end and back-end CI builds.

### aerobatic/hugo

 Image that can be installed on a Docker enabled CI service to build to generate a [Hugo](https://gohugo.io) site and deploy to [Aerobatic](https://www.aerobatic.com). Has been tested with [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines).

**What's in the box?**
* python / pip (2.7.12)
* hugo (v0.18)
* node (v6.9.5)
* [aerobatic-cli](https://www.aerobatic.com/docs/cli/) (1.0.14)

Available on Dockerhub at https://hub.docker.com/r/aerobatic/hugo/
