#!/bin/sh

VSC_REF=$(git rev-parse --short HEAD)

#echo VCS_REF
#echo $VCS_REF
echo $$VCS_REF

#docker run -d --name herodock -e "PORT=9876" -p 9876:9876 ${HEROKU_REGISTRY_IMAGE};
#docker exec -it herodock php -i | grep "PHP Version => 7.4.5"
#docker inspect -f '{{ .Config.Labels }}' herodock | grep $$VCS_REF