#!/bin/bash

DB=/tmp/linux_nw_cve_db

mkdir -p $DB

is_network() {
  if [[ "$1" == *"Kernel: net"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"drivers/net"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"net/"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"net-"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"net "* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"net:"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"TCP"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"tcp"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"ICMP"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"icmp"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"uring"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"WiFi"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"IP"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"ipv6"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"ip6"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"IPv6"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"ipv4"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"IPv4"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"ip4"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"net.c"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"Ethernet"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"ethernet"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"ping"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"netfilter"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"Netfilter"* ]]; then
    echo "YES"
  fi
  if [[ "$1" == *"ethtool"* ]]; then
    echo "YES"
  fi
}

process_cve() {
  cve_file=${DB}/${1}.json

  if [ ! -f $cve_file ]; then
    curl https://access.redhat.com/labs/securitydataapi/cve/${1}.json > $cve_file 2> /dev/null
  fi

  year=$(echo $1 | grep -Po "\-(\d+)-" | tr -d "-")

  cvss=$(cat $cve_file | jq --args ".cvss.cvss_scoring_vector" 2> /dev/null)
  cvss3=$(cat $cve_file | jq --args ".cvss3.cvss3_scoring_vector" 2> /dev/null)
  desc=$(cat $cve_file | jq --args ".bugzilla.description" 2> /dev/null)

  if [ "$(is_network "$desc")" = "" ];
  then
    return
  fi

  if [[ "$cvss3" == *"AV:N"* ]]; then
    echo "$year $1 NETWORK_REMOTE $desc"
  elif [[ "$cvss3" == *"AV:A"* ]]; then
    echo "$year $1 NETWORK_REMOTE $desc"
  elif [[ "$cvss" == *"AV:N"* ]]; then
    echo "$year $1 NETWORK_REMOTE $desc"
  elif [[ "$cvss" == *"AV:A"* ]]; then
    echo "$year $1 NETWORK_REMOTE $desc"
  fi
}

while read cve; do
  process_cve $cve
done <linux_cves.txt
