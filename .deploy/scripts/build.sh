#!/bin/sh

docker build --tag ${HEROKU_REGISTRY_IMAGE} \
              --build-arg VCS_REF=$VCS_REF \
              --file ./.deploy/app/Dockerfile ".";