# -*- mode: Makefile -*-

DIRECTORY := /opt/mcserver
SYSTEMD_SERVICE := mcserver
CONTAINER_NAME := mc

install:
	@sudo mkdir -p $(DIRECTORY)
	@sudo cp docker-compose.yml $(DIRECTORY)/docker-compose.yml
	@sudo cp $(SYSTEMD_SERVICE).service $(DIRECTORY)
	@sudo ln -fs $(DIRECTORY)/$(SYSTEMD_SERVICE).service /etc/systemd/system/$(SYSTEMD_SERVICE).service
	@sudo systemctl enable $(SYSTEMD_SERVICE)
	@echo $(SYSTEMD_SERVICE).service installed

update:
	@sudo cp docker-compose.yml $(DIRECTORY)/docker-compose.yml
	@sudo cp $(SYSTEMD_SERVICE).service $(DIRECTORY)
	@sudo systemctl daemon-reload
	@echo $(SYSTEMD_SERVICE).service updated

uninstall:
	@sudo systemctl disable $(SYSTEMD_SERVICE)
	@sudo systemctl stop $(SYSTEMD_SERVICE)
	@sudo docker container rm $(CONTAINER_NAME)
	@echo $(SYSTEMD_SERVICE).service uninstalled
