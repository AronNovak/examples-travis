#!/bin/bash

# Ability to connect to the host via a fixed IP.
docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 dockernet

# Dependency image.
docker pull elgalu/selenium

# Executes Zalenium in the background.
docker run -d --rm --name zalenium -p 4444:4444 -p 5555:5555 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /tmp/videos:/home/seluser/videos \
  --privileged dosel/zalenium start
