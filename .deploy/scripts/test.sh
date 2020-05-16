#!/bin/sh
docker run -d --name $HEROKU_APP_NAME -e "PORT=9876" -p 9876:9876 ${HEROKU_REGISTRY_IMAGE};
docker exec -it $HEROKU_APP_NAME php -i | grep "PHP Version => 7.4.5"
docker inspect -f {{.Config.Labels}} $HEROKU_APP_NAME
docker inspect -f {{.Config.Labels}} $HEROKU_APP_NAME | grep $VCS_REF