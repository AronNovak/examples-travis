#!/bin/bash

# Dependency image.
docker pull elgalu/selenium

# Executes Zalenium in the background.
docker run -d --rm --name zalenium -p 4444:4444 -p 5555:5555 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /tmp/videos:/home/seluser/videos \
  --privileged dosel/zalenium start
