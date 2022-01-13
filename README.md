# Minecraft Server with Docker

Based on [itzg/docker-minecraft-server](https://github.com/itzg/docker-minecraft-server)


## Installation

```
make install
```

A systemd service 'docker-compose-service@minecraft-docker' and related stuffs will be installed.

The server files is located in `/opt/minecraft-docker`

## For me

Create whitelist.json, server.properties in `/opt/minecraft-docker`, and import a world directory also in there.
