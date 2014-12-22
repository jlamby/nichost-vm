#!/bin/bash

basePath="./"

if [ $# -gt 0 ]; then
	basePath=$1"/"
fi

# build data volume containers
docker build -t "logs"          $basePath"docker-logs"
docker build -t "www-datas"     $basePath"docker-www_datas"

# build Apache-PHP container
docker build -t "apache-php"    $basePath"docker-apache"

