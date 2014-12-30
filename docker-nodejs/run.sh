#!/bin/bash

LOG_DIR=/var/log/nodejs
APP_NAME=$appName

npm install
forever start -a -o $LOG_DIR/$APP_NAME-access.log -e $LOG_DIR/$APP_NAME-error.log main.js

bash
