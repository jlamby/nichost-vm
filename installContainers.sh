#!/bin/bash

basePath="./"

if [ $# -gt 0 ]; then
	basePath=$1"/"
fi

# build data volume containers
docker build -t "logs"          $basePath"docker-logs"
docker build -t "www-datas"     $basePath"docker-www_datas"


# build normal containers
docker build -t "nginx"         $basePath"docker-nginx"
docker build -t "apache-php"    $basePath"docker-apache"

