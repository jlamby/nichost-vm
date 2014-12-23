#!/bin/bash

# run data volume containers
docker run -d -i -t --name LOGS         logs
docker run -d -i -t --name WWW-DATAS    www-datas

# run normal containers
docker run -d -i -t \
    --name apache \
    --volumes-from LOGS \
    --volumes-from WWW-DATAS \
    apache-php

docker run -d -i -t -p 80:80 \
    --name nginx \
    --link apache:apache \
    --volumes-from LOGS \
    nginx

