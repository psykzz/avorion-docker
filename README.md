# avorion-docker

## Getting started
Starting the server 

* Create a `/config` directory, this will be mounted into the container.
* Add your settings.ini and fill out the values as you like.
* > Note that if you change ports, you'll need to adjust the port mappings.

Run the following to start the server.
```
docker run --rm -it -v `pwd`/config:/root/.avorion/galaxies/avorion_galaxy -p 27000:27000 -p 27000:27000/udp -p 27003:27003 -p 27003:27003/udp psykzz/avorion-docker
```
