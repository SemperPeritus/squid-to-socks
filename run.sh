docker build -t squid-to-socks .

docker stop squid-proxy
docker rm squid-proxy

docker run -d \
  --name squid-proxy \
  --restart always \
  --cap-add=NET_ADMIN \
  -p 21783:3128 \
  --dns 8.8.8.8 \
  --dns 8.8.4.4 \
  --env-file=.env \
  -v /opt/squid/cache:/var/spool/squid \
  -v /opt/squid/squid.conf:/etc/squid/squid.conf \
  squid-to-socks
