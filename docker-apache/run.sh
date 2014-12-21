#!/bin/bash

chown www-data:www-data /app -R
source /etc/apache2/envvars
echo "ServerName localhost" >> /etc/apache2/apache2.conf

service apache2 start
bash