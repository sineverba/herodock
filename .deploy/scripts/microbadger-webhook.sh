#!/bin/sh

curl -n -X POST https://hooks.microbadger.com/images/${DOCKER_USERNAME}/${HEROKU_APP_NAME}/${MICROBADGER_KEY}