all: hosts rvolumes volumes build up

hosts:
	@sudo sudo sed -i "s/localhost/dbalducc.42.fr/g" /etc/hosts

build:
	sudo docker-compose -f ./srcs/docker-compose.yml build

up:
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

status:
	sudo docker ps

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml stop

down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

rm: rvolumes down
	sudo docker system prune -af

re: rm all
	
rvolumes:
	sudo rm -rf ${HOME}/data

volumes:
	sudo mkdir -p ${HOME}/data/db-data
	sudo mkdir -p ${HOME}/data/www-data