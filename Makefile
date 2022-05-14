
all: hosts build up

hosts:
	@sudo sed -i "s/localhost/dbalducc.42.fr/g" /etc/hosts

build:
	@echo "Building Images.. 🛠"
	docker-compose -f ./srcs/docker-compose.yml build
#	@ mkdir -p $(HOME)/data/db-data
#	@mkdir -p $(HOME)/data/www-data

up:
	@echo "Running all the containers!"
	@docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	@echo "Stopping every container"
	docker-compose -f ./srcs/docker-compose.yml stop

down:
	@echo "Removing every container"
	docker-compose -f ./srcs/docker-compose.yml down

rm: down rnetwork
	@echo "Remove all the trash made by docker"
	docker system prune -a
	
#rvolumes:
#	@echo "Deleting all the volumes.."
#	sudo rm -rf $(HOME)/data
#	docker volume rm srcs_www-data srcs_db-data

rnetwork:
	@echo "Deleting the network.."
	docker network rm $(docker network ls -q) 2>/dev/null

volumes:
	@echo "Creating the volumes"
	mkdir -p $(HOME)/data/db-data
	mkdir -p $(HOME)/data/www-data

fclean:
	sudo docker rmi -f $(sudo docker images -qa)
	sudo docker volume rm $(sudo docker volume ls -q)
	sudo docker system prune -a --force
