#!/bin/sh

database=/data/configuration.sqlite3

if [ $# -gt 0 ]; then
  sqlite3 $database "update base_info set value=\"$1\" where name=\"firmware\""
else
  sqlite3 $database "select value from base_info where name=\"firmware\""
fi
