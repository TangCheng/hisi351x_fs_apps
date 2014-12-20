#!/bin/sh

SQL_SCRIPT=/apps/iconfig/config/soft-reset.sql

if [ -f ${SQL_SCRIPT} ]; then
  # kill all proccess using database
  fuser -k ${SQL_SCRIPT}
  # import SQL script into database
  sqlite3 /data/configuration.sqlite3 < ${SQL_SCRIPT}
  # reboot
  reboot
fi

