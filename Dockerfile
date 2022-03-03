FROM sameersbn/squid:3.5.27-2

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y redsocks iptables \
 && rm -rf /var/lib/apt/lists/*

COPY redsocks.conf /etc/redsocks.conf

COPY iptables.sh /sbin/iptables.sh
COPY env-init.sh /sbin/env-init.sh

COPY entrypoint.sh /sbin/entrypoint-my.sh

ENTRYPOINT ["/sbin/entrypoint-my.sh"]
