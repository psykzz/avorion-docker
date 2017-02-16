#!/bin/bash

(
	cd /opt/steamcmd
	./steamcmd.sh +login anonymous \
				+force_install_dir ${SERVER_DIRECTORY} \
				+app_update 565060 validate \
				+quit
)

(
	if [ -d ${OVERWRITE_DIRECTORY} ] && [ "$(ls -A ${OVERWRITE_DIRECTORY})" ]
	then
		echo -e "\e[32mFound overwrite files patching ...\e[33m"
		cp -v -r ${OVERWRITE_DIRECTORY}/* ${SERVER_DIRECTORY}/data/
		echo -e "\e[0m"
	fi
)

(
	cd ${SERVER_DIRECTORY}
	./server.sh
)
