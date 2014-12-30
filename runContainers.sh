#!/bin/bash

# run data volume containers
docker run -d -i -t --name LOGS         logs
docker run -d -i -t --name WWW-DATAS    www-datas

# run normal containers
docker run -d -i -t             \
    --name apache               \
    --volumes-from LOGS         \
    --volumes-from WWW-DATAS    \
    apache-php

docker run -d -i -t             \
    --name apibot               \
    -v /vagrant/apps/api-nicobot:/app  \
    -e appName=apibot           \
    --volumes-from LOGS         \
    nodejs

docker run -d -i -t             \
    --name chatlog              \
    play-chatlog

docker run -d -i -t -p 80:80    \
    --name nginx                \
    --link apache:apache        \
    --link chatlog:chatlog      \
    --link apibot:apibot        \
    --volumes-from LOGS         \
    nginx

    