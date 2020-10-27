#!/bin/bash
docker run -it --rm  --name pidi-debug-with-shell\
	--add-host=mpd:172.17.0.1 \
        --device=/dev/spidev0.1 --device=/dev/mem \
	--mount type=bind,source="$(pwd)"/cache,target=/cache \
        --privileged $@ pidi:latest  /bin/sh

