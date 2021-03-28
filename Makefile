build:		
		docker build --tag registry.heroku.com/herodock/web --file ./docker-build/Dockerfile .

run:
		docker run -d --name herodock -e "PORT=9876" -p "9876:9876" registry.heroku.com/herodock/web

stop:
		docker container stop herodock
		docker container rm herodock

test:
		@docker run -it --rm herodock php -i | grep "PHP Version => 8.0.3"

deploy:
		docker push registry.heroku.com/herodock/web
		heroku container:release web -a herodock
		heroku labs:enable --app=herodock runtime-new-layer-extract

destroy:
		docker container stop herodock
		docker container rm herodock
		docker image rm registry.heroku.com/herodock/web