
all: hosts build up

hosts:
	@sudo sed -i "s/localhost/dbalducc.42.fr/g" /etc/hosts

build:
	docker-compose -f ./srcs/docker-compose.yml build
	@mkdir -p $(HOME)/data/db-data
	@mkdir -p $(HOME)/data/www-data

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

down:
	docker-compose -f ./srcs/docker-compose.yml down

rm: rvolumes down rnetwork
	docker system prune -a
	
rvolumes:
	sudo rm -rf $(HOME)/data
	docker volume rm srcs_www-data srcs_db-data

rnetwork:
	docker network rm $(docker network ls -q) 2>/dev/null

volumes:
	mkdir -p $(HOME)/data/db-data
	mkdir -p $(HOME)/data/www-data

fclean:
	sudo docker rmi -f $(sudo docker images -qa)
	sudo docker volume rm $(sudo docker volume ls -q)
	sudo docker system prune -a --force
