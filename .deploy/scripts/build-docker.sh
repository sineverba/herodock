#!/bin/sh

docker build --tag $DOCKER_USERNAME/$HEROKU_APP_NAME --file ./.deploy/app/Dockerfile ".";