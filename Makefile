# -*- mode: Makefile -*-

install:
	@sudo mkdir -p /opt/docker-compose-service/minecraft-docker/
	@sudo cp docker-compose.yml /opt/docker-compose-service/minecraft-docker/docker-compose.yml
	@sudo cp systemd/docker-compose-service@.service  /etc/systemd/system/
	@sudo mkdir -p /opt/minecraft-docker
	@sudo cp whitelist.json /opt/minecraft-docker/
	@sudo cp server.properties /opt/minecraft-docker/

uninstall:
	@sudo rm -rf /opt/docker-compose-service/minecraft-docker/
	@sudo rm -rf /opt/minecraft-docker

enable:
	sudo systemctl enable docker-compose-service@minecraft-docker

disable:
	sudo systemctl disable docker-compose-service@minecraft-docker

status:
	systemctl status docker-compose-service@minecraft-docker

start:
	sudo systemctl start docker-compose-service@minecraft-docker

stop:
	sudo systemctl stop docker-compose-service@minecraft-docker
