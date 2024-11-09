NAME = simple_nginx_html

DIR = ~/data

all: $(DIR_MARIADB) $(DIR_WORDPRESS)
	docker-compose -f ./srcs/docker-compose.yml up

build: $(DIR_MARIADB) $(DIR_WORDPRESS)
	docker-compose -f ./srcs/docker-compose.yml up -d --build

$(DIR_MARIADB):
	mkdir -p ~/data/mariadb/

$(DIR_WORDPRESS):
	mkdir -p ~/data/wordpress/

down:
	docker-compose -f ./srcs/docker-compose.yml down

re: fclean build

clean: down
	docker system prune -a

fclean: down
	docker stop $$(docker ps -qa) || true
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf ~/data/mariadb/*
	sudo rm -rf ~/data/wordpress/*

.PHONY: clean fclean re all build down
