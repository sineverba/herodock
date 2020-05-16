#!/bin/sh

docker build --tag ${HEROKU_REGISTRY_IMAGE} \
              --build-arg VCS_REF=$VCS_REF \
              --file ./.deploy/app/Dockerfile ".";

docker images
# Tag also for docker
#docker tag ${HEROKU_REGISTRY_IMAGE} "$DOCKER_USERNAME/$HEROKU_APP_NAME":latest
#docker tag ${HEROKU_REGISTRY_IMAGE} "$DOCKER_USERNAME/$HEROKU_APP_NAME":"$TRAVIS_TAG"
docker tag ${HEROKU_REGISTRY_IMAGE} ${DOCKER_USERNAME}/${HEROKU_APP_NAME}:latest
docker images