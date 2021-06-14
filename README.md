[![GitHub release](https://img.shields.io/github/release/psykzz/avorion-docker.svg?style=flat-square)](https://github.com/psykzz/avorion-docker/releases/latest)
[![Docker Automated build](https://img.shields.io/docker/automated/psykzz/avorion-docker.svg?style=flat-square)](https://hub.docker.com/r/psykzz/avorion-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/psykzz/avorion-docker.svg?style=flat-square)](https://hub.docker.com/r/psykzz/avorion-docker)

Avorion for Docker
==================


### Game Info

For some information about the game see https://www.kickstarter.com/projects/koonschi/avorion

This is a docker image to create a dedicated server.

**Currently supported version: 0.10.2**


## Getting started
Starting the server 

* Create a `/data` directory, this will be mounted into the container.
* Add your settings.ini and fill out the values as you like.

> **Note: if you change ports in the config, you'll need to adjust the port mappings.**

Run the following to start the server.
```
docker run --name avorion -d -v `pwd`/data:/root/.avorion/galaxies/avorion_galaxy -p 27000:27000 -p 27000:27000/udp -p 27003:27003 -p 27003:27003/udp -p 27020:27020 -p 27022:27022 ghcr.io/psykzz/avorion-docker
```

The server data will be saved locally on the host machine within the data folder. This allows you to bring the server down, and restart when needed to do any updates.

You can specify an admin via the environment, adding `-e USER=<steamid>` to set the default admin on server start.


## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)


