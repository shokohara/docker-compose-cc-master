#!/bin/bash
apt-get update
apt-get install -y curl unzip
curl -fsSL https://get.docker.com/ | sh
usermod -aG docker vagrant
docker daemon -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock
curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
docker-compose up -d
