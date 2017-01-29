FROM ubuntu:14.04

MAINTAINER PsyKzz <matt.daemon660@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update &&\
    apt-get install -y curl lib32gcc1

# Download and extract SteamCMD
RUN mkdir -p /opt/steamcmd &&\
    cd /opt/steamcmd &&\
    curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz

# Create server dir
RUN mkdir -p /opt/server
ADD start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

# Create volume for server config
VOLUME /root/.avorion/galaxies/avorion_galaxy


EXPOSE 27000
ENV USER=nobody

CMD ["/opt/start.sh"]


