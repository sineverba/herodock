#!/bin/sh

docker build --tag $DOCKER_USERNAME/$HEROKU_APP_NAME --build-arg VCS_REF=`git rev-parse --short HEAD` --file ./.deploy/app/Dockerfile ".";