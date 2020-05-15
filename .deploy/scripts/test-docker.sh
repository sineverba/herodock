#!/bin/sh

#VSC_REF=$(git rev-parse --short HEAD)

docker run -d --name herodockdocker -e "PORT=9876" -p 9876:9876 $DOCKER_USERNAME/$HEROKU_APP_NAME:latest;
docker exec -it herodockdocker php -i | grep "PHP Version => 7.4.5"
# docker inspect -f '{{ .Config.Labels }}' herodockdocker | grep `git rev-parse --short HEAD`
docker inspect -f '{{ .Config.Labels }}' herodockdocker