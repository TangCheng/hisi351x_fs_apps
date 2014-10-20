#!/bin/sh

method=
ipaddr=
netmask=
gateway=
dns1=
dns2=
username=
password=
netdev=

database=/data/configuration.sqlite3

if [ -f $database ] ; then
  method=`sqlite3 $database "select value from network;"`
  case $method in
    'static')
      ipaddr=`sqlite3 $database "select value from network_static where name='ipaddr';"`
      netmask=`sqlite3 $database "select value from network_static where name='netmask';"`
      gateway=`sqlite3 $database "select value from network_static where name='gateway';"`
      dns1=`sqlite3 $database "select value from network_static where name='dns1';"`
      dns2=`sqlite3 $database "select value from network_static where name='dns2';"`
      netdev="eth0"
    ;;
    'dhcp')
      netdev="eth0"
    ;;
    'pppoe')
      username=`sqlite3 $database "select value from network_pppoe where name='username';"`
      password=`sqlite3 $database "select value from network_pppoe where name='password';"`
      netdev="eth0"
    ;;
  esac
else
  # default value of network parameter
  method="static"
  ipaddr="192.168.1.217"
  netmask="255.255.255.0"
  gateway="192.168.1.1"
  netdev="eth0"
fi

echo $method:$ipaddr:$netmask:$gateway:$dns1:$dns2:$username:$password:$netdev

exit 0
