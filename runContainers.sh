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
    -v /apps/api-nicobot:/app   \
    -e appName=apibot           \
    --volumes-from LOGS         \
    nodejs

docker run -d -i -t             \
    --name chatlog              \
    -v /apps/nicobot-chatlog:/app \
    play-chatlog

docker run -d -i -t -p 80:80    \
    --name nginx                \
    --link apache:apache        \
    --link chatlog:chatlog      \
    --link apibot:apibot        \
    --volumes-from LOGS         \
    nginx

docker run -d -i -t             \
    -p 21:21     -p 6000:6000   \
    -p 6001:6001 -p 6002:6002   \
    -p 6003:6003 -p 6004:6004   \
    -p 6005:6005 -p 6006:6006   \
    -p 6007:6007 -p 6008:6008   \
    -p 6009:6009 -p 6010:6010   \
    --name ftpd                 \
    --volumes-from LOGS         \
    --volumes-from WWW-DATAS    \
    proftpd