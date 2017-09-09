NAME=anthonykgross/docker-mysql-backup-cron

build:
	docker build --file="Dockerfile" --tag="$(NAME):master" .

debug:
	docker-compose run mysql bash

run:
	docker-compose up
