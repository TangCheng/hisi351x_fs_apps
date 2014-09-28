#!/bin/sh

delay=1

[ $1 ] && delay=$1

while true; do
  himm 0x201c0020 0x8 > /dev/null
  sleep $delay
  himm 0x201c0020 0x0 > /dev/null
  sleep $delay
done
