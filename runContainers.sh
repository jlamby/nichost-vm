#!/bin/bash

# run data volume containers
docker run -d -i -t --name LOGS logs

# run normal containers
docker run -d -i -t -p 80:80    --name apache       --volumes-from LOGS apache-php
