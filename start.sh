#!/bin/bash

(
	cd /opt/steamcmd
	./steamcmd.sh +login anonymous \
                 +force_install_dir /opt/server \
                 +app_update 565060 validate \
                 +quit
)

(
	cd /opt/server
	./server.sh
)

