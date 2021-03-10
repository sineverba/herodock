Heroku test
===========

Test on Heroku with Circle CI auto deploy

| CI / CD   | Status |
| --------- | ------ |
| Circle CI | [![CircleCI](https://circleci.com/gh/sineverba/herodock.svg?style=svg)](https://circleci.com/gh/sineverba/herodock) |
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/herodock.svg)](https://sineverba.semaphoreci.com/projects/herodock) |


## How to build for test

``` shell
$ docker build --tag herodock --file ./.deploy/app/Dockerfile "."
$ docker run -d --name herodock -e "PORT=9876" -p 9876:9876 herodock
$ docker exec -it herodock php -i | grep "PHP Version => 8.0.3"
$ docker container stop herodock
$ docker container rm herodock
$ docker image rm herodock
```

### Heroku errors

> Heroku - AH00534: apache2: Configuration error: More than one MPM loaded.
> @see https://github.com/docker-library/wordpress/issues/293

__Solution__

```shell
heroku labs:enable --app=YOUR_HEROKU_APP_NAME runtime-new-layer-extract
```