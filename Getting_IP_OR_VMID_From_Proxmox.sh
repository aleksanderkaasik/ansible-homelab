#!/bin/bash

ProxmoxHost="$1"
ProxmoxTOkenId="$2"
ProxmoxTokenSecret="$3"
Node="$4"
vmid="$5"

if [[ -z $vmid ]]; then
  vmid=$(curl -sk \
    -H "Authorization: PVEAPIToken=${ProxmoxTOkenId}=${ProxmoxTokenSecret}" \
    "https://$ProxmoxHost:8006/api2/json/nodes/$Node/lxc" | jq -r '[.data[].vmid]'
  )

  jq -n --arg vmids "$vmid" '{"vmids": $vmids}'
else
  IP=$(
  curl -sk \
    -H "Authorization: PVEAPIToken=${ProxmoxTOkenId}=${ProxmoxTokenSecret}" \
    "https://$ProxmoxHost:8006/api2/json/nodes/$Node/lxc/$vmid/interfaces" |
    jq -r '.data[] | 
      select(.name == "eth0") | 
      ."ip-addresses"[] | 
      select(."ip-address-type" != "inet6") | 
      ."ip-address"'
  )

  jq -n --arg ip "$IP" '{"ip": $ip}'
fi
