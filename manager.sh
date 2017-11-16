#!/bin/bash

cd "$(dirname $0)"
source ./variables.env

clean () {
  echo TODO
}

build () {
  docker build -t $IMAGE_NAME .
  # docker build -t $IMAGE_NAME --file Dockerfile.alpine .
  # docker build -t $IMAGE_NAME --file Dockerfile.arch .
  # xhost +local:root # runs so that the X server is available
}

develop () {
# x11docker \
  # -- "-it \
  # -v $PWD:$WORKDIR \
  # -v $PWD/caches:/root/.gradle/caches
  # " \
  # $IMAGE_NAME
  # ./sample/run.sh
  docker run \
    -it \
    -v $PWD/workdir:$WORKDIR \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /dev/snd:/dev/snd \
    --privileged \
    -v=/dev/dri:/dev/dri:rw \
    $IMAGE_NAME #/usr/bin/love /usr/src/app/app

    # --lxc-conf=lxc.cgroup.devices.allow=" c 226:* rwm" \
  # -v /run/dbus/:/run/dbus/ -v /dev/shm:/dev/shm \
  # -e PULSE_SERVER=tcp:localhost:4713 \
  # -e PULSE_COOKIE_DATA=`pax11publish -d | grep --color=never -Po '(?<=^Cookie: ).*'` \
}

case $1 in
  clean)
    clean;;
  build)
    build;;
  develop)
    develop;;
  *)
    echo "usage: ./build.sh build | develop"
esac
