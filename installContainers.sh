#!/bin/bash

basePath="./"

if [ $# -gt 0 ]; then
	basePath=$1"/"
fi

# build Apache-PHP container
docker build -t "apache-php" $basePath"docker-apache"

