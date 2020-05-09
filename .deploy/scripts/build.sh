#!/bin/sh

docker build --tag ${HEROKU_REGISTRY_IMAGE} --file ./.deploy/app/Dockerfile ".";