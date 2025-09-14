#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull cryl91/img:1

# Run the Docker image as a container
docker run -d -p 80:80 cryl91/img:1