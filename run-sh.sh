#!/bin/bash
docker run -it --rm  --add-host mpd:172.17.0.1 --name pidi-debug-with-shell --device=/dev/spidev0.1 --device=/dev/mem --cap-add SYS_RAWIO pidi:latest /bin/sh

