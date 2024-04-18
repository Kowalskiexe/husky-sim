#!/usr/bin/env bash

# set working directory to the script's location so the
# relative path in '-v ./clearpath/:/root/clearpath' flag
# bind works
cd "$(dirname "$0")"

# allow non-network local connections to X11 so that
# the GUI can be started from the Docker container:
xhost +local:

docker run -it \
    --rm \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/:rw \
    -v ./clearpath:/root/clearpath \
    --net bridge \
    kowalskiexe/husky-sim \
    ros2 launch clearpath_gz simulation.launch.py

# works on wayland too
