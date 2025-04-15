NAME		= inception
SRCS		= ./srcs
COMPOSE		= $(SRCS)/docker-compose.yml
HOST_URL	= maugusto.42.fr

up:
	mkdir -p ~/data/database
	mkdir -p ~/data/wordpress_files
	docker compose -p $(NAME) -f $(COMPOSE) up --build || (echo " $(FAIL)" && exit 1)

down :
	@docker compose -p $(NAME) down --rmi all --volumes --remove-orphans

.PHONY: all up down create_dir clean fclean status backup prepare re