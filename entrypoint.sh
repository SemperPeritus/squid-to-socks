#!/bin/bash
set -e

echo "Using iptables..."
/sbin/iptables.sh

echo "Init env..."
/sbin/env-init.sh

echo "Starting redsocks..."
nohup redsocks -c /etc/redsocks.conf &

echo "Starting entrypoint..."
/sbin/entrypoint.sh
