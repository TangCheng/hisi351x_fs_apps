#!/bin/sh

cmd=$1
shift

while true; do
  echo $cmd $*
  $cmd $*
  sleep 2
done
