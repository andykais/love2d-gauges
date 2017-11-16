#!/bin/bash

cd $(dirname $0)
SRC_DIR=src
COMPILE_DIR=compiled

function run () {
  love $COMPILE_DIR/$SRC_DIR
}

function compile () {
  TIMEFORMAT='Code compiled in %E seconds'
  time (
    moonc -t $COMPILE_DIR $SRC_DIR 
    tar cf - --exclude="*.moon" $SRC_DIR/*  | (cd $COMPILE_DIR && tar xf -)
  )
  echo
}

function watch () {
  compile
  run &
  while true
  do
    FORMAT=$(echo -e "\033[1;33m%w%f\033[0m written at $(date +'%r')")
    inotifywait -qre close_write --format "$FORMAT" $SRC_DIR
    compile
    pkill love
    run &
  done
  moonc -t $COMPILE_DIR -w $SRC_DIR
}

function clean () {
 rm -rf $COMPILE_DIR
}

function start () {
  clean
  compile
  run
}

if [[ `type -t $1` == 'function' ]]
then
  $1
else
  echo "usage: start | clean | compile | run | watch"
fi
