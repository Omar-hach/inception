NAME = simple_nginx_html

CC= c++

CPPFLAGS = -Wall -Wextra -Werror -std=c++98

all: 
	docker compose -f ./srcs/docker-compose.yml up -d

build: 
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clear:
	docker system prune -a

fclean: clean

re: fclean all

.PHONY: clean fclean re all build down