export VCS_REF := $(shell git rev-parse --short HEAD)

build:
		@docker build --tag herodock --build-arg VCS_REF=$$VCS_REF --file ./.deploy/app/Dockerfile "."

test:
		@docker run --rm -it herodock php -i | grep "PHP Version => 7.4.5"
		@docker inspect -f '{{ .Config.Labels }}' herodock | grep $$VCS_REF

start:
		@docker run -d --name herodock -e APP_KEY=base64:x2SHH01+2R+vwv09YcrvXqdFJ+bbqgT9gW4njcYLjDE= -e "PORT=9876" -p 9876:9876 herodock

run:
		@docker exec -it herodock php -i | grep "PHP Version => 7.4.5"
		@docker inspect -f '{{ .Config.Labels }}' herodock | grep $$VCS_REF

stop:
		@docker container stop herodock

destroy:
		@docker container stop herodock
		@docker container rm herodock
		@docker image rm herodock