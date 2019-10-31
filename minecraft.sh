#!/bin/sh

docker run -ti --rm --name minecraft --hostname $(uname -n) -u $(id --user):$(id --group) $(id --groups | sed 's/\([0-9]\+\)/--group-add \1/g') -e DISPLAY -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e XAUTHORITY -v $XAUTHORITY:$XAUTHORITY  --device /dev/dri/card0 --device /dev/dri/renderD128 -v ${HOME}/docker-volumes/minecraft-home:${HOME} -v $HOME/.minecraft:$HOME/.minecraft -w $HOME -v /var/run/nscd/socket:/var/run/nscd/socket test/minecraft "$@"
