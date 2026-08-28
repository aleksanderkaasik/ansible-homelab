#!/bin/bash

ProxmoxHost="$1"
ProxmoxTOkenId="$2"
ProxmoxTokenSecret="$3"
Node="$4"
vmid="$5"

ProxmoxHeader="Authorization: PVEAPIToken=${ProxmoxTOkenId}=${ProxmoxTokenSecret}"
ProxmoxURL="https://$ProxmoxHost:8006/api2/json/nodes/$Node/lxc"

if [[ -z $vmid ]]; then
  vmid=$(curl -sk \
    -H "$ProxmoxHeader" \
    "$ProxmoxURL" | jq -r '[.data[].vmid]'
  )

  jq -n --arg vmids "$vmid" '{"vmids": $vmids}'
else
  IP=$(
  curl -sk \
    -H "$ProxmoxHeader" \
    "$ProxmoxURL/$vmid/interfaces" |
    jq -r '.data[] | 
      select(.name == "eth0") | 
      ."ip-addresses"[] | 
      select(."ip-address-type" != "inet6") | 
      ."ip-address"'
  )

  jq -n --arg ip "$IP" '{"ip": $ip}'
fi
