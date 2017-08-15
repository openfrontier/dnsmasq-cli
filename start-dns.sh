#!/bin/bash

BASE_PATH=$(pwd)
LISTEN_ADDR=$1
if [ -z "${LISTEN_ADDR}" ] ; then
  echo "Need an ip address"
  exit 1
fi

docker run --name=dns-service \
--cap-add=NET_ADMIN \
--restart=always \
--log-driver=journald \
-p ${LISTEN_ADDR}:53:53/udp \
-v ${BASE_PATH}/hostsdata:/hostsdata \
-d andyshinn/dnsmasq:2.76 \
--log-facility=- \
--log-queries \
--dns-loop-detect \
--no-hosts \
--no-dhcp-interface=eth0 \
--hostsdir=/hostsdata \
--server=/trans-cosmos.com.cn/10.11.1.48
