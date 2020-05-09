Heroku test
===========

Test on Heroku with Travis auto deploy

| CI / CD   | Status |
| --------- | ------ |
| Travis CI | [![Build Status](https://travis-ci.com/sineverba/herodock.svg?branch=master)](https://travis-ci.com/sineverba/herodock) |


## How to build for test

Add to Heroku __at least__ following environment variables:

| VARIABLE | VALUE |
| -------- | ----- |
| APP_KEY  | Create it with `php artisan key:generate` |


```shell
$ docker build --tag herodock --file ./.deploy/app/Dockerfile "."
$ docker run -d --name herodock -e "PORT=9876" -p 9876:9876 herodock
$ docker exec -it herodock php -i | grep "PHP Version => 7.4.5"
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