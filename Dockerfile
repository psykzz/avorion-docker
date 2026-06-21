FROM ubuntu:22.04

LABEL maintainer="PsyKzz <matt.daemon660@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV SERVER_DIRECTORY=/opt/server
ENV OVERWRITE_DIRECTORY=/opt/server-overwrite

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl lib32gcc-s1 && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/steamcmd && \
    cd /opt/steamcmd && \
    curl -sqL --retry 3 https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xz

RUN mkdir -p ${SERVER_DIRECTORY}
COPY start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

VOLUME /root/.avorion/galaxies/avorion_galaxy

EXPOSE 27000
EXPOSE 27000/udp
EXPOSE 27003
EXPOSE 27003/udp
EXPOSE 27020
EXPOSE 27021

ENV USER=nobody

CMD ["/opt/start.sh"]