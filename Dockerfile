FROM sameersbn/squid:3.5.27-2

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y redsocks iptables curl \
 && rm -rf /var/lib/apt/lists/*

COPY redsocks.conf /etc/redsocks_default.conf

COPY iptables.sh /sbin/iptables.sh
COPY env-init.sh /sbin/env-init.sh

COPY entrypoint.sh /sbin/entrypoint-my.sh

HEALTHCHECK --interval=1m --timeout=40s --start-period=15s \
  CMD curl -f --retry 2 --max-time 5 --retry-delay 10 --retry-max-time 30 "https://google.com"

ENTRYPOINT ["/sbin/entrypoint-my.sh"]
