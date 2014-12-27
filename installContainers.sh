#!/bin/bash

basePath="./"

if [ $# -gt 0 ]; then
	basePath=$1"/"
fi

# build data volume containers
docker build -t "logs"          $basePath"docker-logs"
docker build -t "www-datas"     $basePath"docker-www_datas"
docker build -t "db-datas"      $basePath"docker-db_datas"


# build normal containers
docker build -t "mysqlc"        $basePath"docker-mysqlc"
docker build -t "nginx"         $basePath"docker-nginx"
docker build -t "apache-php"    $basePath"docker-apache"
docker build -t "play-chatlog"  $basePath"docker-play"
docker build -t "proftpd"       $basePath"docker-proftpd"
