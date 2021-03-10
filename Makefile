build:		
		docker build --tag herodock --file ./docker-build/Dockerfile .

run:
		docker run -d --name herodock -e "PORT=9876" -p 9876:9876 herodock

stop:
		docker container stop herodock
		docker container rm herodock

test:
		@docker run -it --rm herodock php -i | grep "PHP Version => 8.0.3"

destroy:
		docker container stop herodock
		docker container rm herodock
		docker image rm herodock