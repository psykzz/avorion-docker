[![GitHub release](https://img.shields.io/github/release/psykzz/avorion-docker.svg?style=flat-square)](https://github.com/psykzz/avorion-docker/releases/latest)
[![Docker Pulls](https://img.shields.io/docker/pulls/psykzz/avorion-docker.svg?style=flat-square)](https://hub.docker.com/r/psykzz/avorion-docker)

# Avorion for Docker

A Docker image for running an [Avorion](https://www.avorion.net) dedicated server.

## Getting Started

Create a local `data` directory to persist your galaxy:

```sh
mkdir data
```

Run the server:

```sh
docker run --name avorion -d \
  -v $(pwd)/data:/root/.avorion/galaxies/avorion_galaxy \
  -p 27000:27000 -p 27000:27000/udp \
  -p 27003:27003 -p 27003:27003/udp \
  -p 27020:27020 -p 27021:27021 \
  ghcr.io/psykzz/avorion-docker
```

Set a Steam ID as the default admin:

```sh
docker run ... -e USER=<steamid> ghcr.io/psykzz/avorion-docker
```

The galaxy data is saved in your local `data` folder, so you can stop and restart the container at any time.

> **Note:** if you change ports in your server config, update the port mappings accordingly.

## Configuration

Place your `settings.ini` inside the `data` directory before starting the container. The full path mounted into the container is `/root/.avorion/galaxies/avorion_galaxy`.

## Server Overrides

Any files placed in `/opt/server-overwrite` inside the container will be copied over the server install before startup. Mount a local directory there to patch server files without rebuilding the image.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)