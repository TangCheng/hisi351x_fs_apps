#!/bin/sh

while true; do
  himm 0x201c0020 0x8 > /dev/null
  sleep 1
  himm 0x201c0020 0x0 > /dev/null
  sleep 1
done
