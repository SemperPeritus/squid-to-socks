#!/bin/bash
set -e


if [ -n "$SOCKS_IP" ]
then
  echo "ip = $SOCKS_IP;" >> /etc/redsocks.conf
fi

if [ -n "$SOCKS_PORT" ]
then
  echo "port = $SOCKS_PORT;" >> /etc/redsocks.conf
fi

if [ -n "$SOCKS_USER" ]
then
  echo "login = $SOCKS_USER;" >> /etc/redsocks.conf
fi

if [ -n "$SOCKS_PASS" ]
then
  echo "password = $SOCKS_PASS;" >> /etc/redsocks.conf
fi


echo "}" >> /etc/redsocks.conf
