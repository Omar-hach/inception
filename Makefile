NAME = simple_nginx_html

CC= c++

CPPFLAGS = -Wall -Wextra -Werror -std=c++98

$(DIR):
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

all: $(DIR)
	docker-compose -f ./srcs/docker-compose.yml up

build: $(DIR)
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

re: fclean build

clear: down
	docker system prune -a

fclean: clean
	docker stop $$(docker ps -qa) || true
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf ~/data/mariadb
	sudo rm -rf ~/data/wordpress

re: fclean build

.PHONY: clean fclean re all build down
