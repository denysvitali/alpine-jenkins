#!/bin/bash

docker_gid = $(stat -c "%g" /var/run/docker.sock)
groupmod -g $docker_gid docker

su - jenkins -c '/sbin/tini -- /usr/local/bin/jenkins.sh'