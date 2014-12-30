#!/bin/bash

echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
apt-get update
apt-get upgrade -y -f
apt-get install -y wheezy-backports linux-image-amd64

curl -sSL https://get.docker.com/ | sh

# Add the docker group if it doesn't already exist.
groupadd docker

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
gpasswd -a ${USER} docker

# Restart the Docker daemon.
service docker restart
