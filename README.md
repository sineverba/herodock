Heroku test
===========

Test on Heroku with Circle CI auto deploy

| CI / CD   | Status |
| --------- | ------ |
| Docker    | [![](https://images.microbadger.com/badges/image/sineverba/herodock.svg)](https://microbadger.com/images/sineverba/herodock "Get your own image badge on microbadger.com")


## How to build for test

``` shell
$ docker build --tag herodock --file ./.deploy/app/Dockerfile "."
$ docker run -d --name herodock -e "PORT=9876" -p 9876:9876 herodock
$ docker exec -it herodock php -i | grep "PHP Version => 7.4.5"
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