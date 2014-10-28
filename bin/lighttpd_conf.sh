#!/bin/sh

database=/data/configuration.sqlite3
ionvif_conf=/apps/ionvif/config/app.yml
iajax_conf=/apps/iajax/config/app.yml

if [ -f $database ] ; then
  http_port=`sqlite3 $database "select value from network_port where name='http';"`
  sed -i "s/server.port\ =\ .*/server.port\ =\ $http_port/g" /etc/lighttpd/lighttpd.conf
fi

if [ -f $iajax_conf ] ; then
  iajax_port=`grep port:.\* $iajax_conf | awk '{print $2}'`
  sed -i "s/\"port\"\ =>\ .*/\"port\"\ =>\ $iajax_port/g" /etc/lighttpd/conf.d/proxy/iajax.conf
fi

if [ -f $ionvif_conf ] ; then
  ionvif_port=`grep port:.\* $ionvif_conf | awk '{print $2}'`
  sed -i "s/\"port\"\ =>\ .*/\"port\"\ =>\ $ionvif_port/g" /etc/lighttpd/conf.d/proxy/ionvif.conf
fi
