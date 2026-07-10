#!/bin/sh

# Default
# IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
 
#if [ "$IFACE" = "tun0" ]; then
#    echo "%{F#1bbf3e}󰆧 %{F#ffffff}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
#else
#    echo "%{F#1bbf3e}󰆧 %{u-} Disconnected"
#fi

# Addapted
#IFACE=$(/usr/sbin/ip a show | grep wlo1 | grep "brd" | awk '{print $9}')
IFACE=$(/usr/sbin/ip address | grep "tun0")

# substitute wlo1/tun0 by the name of the vpn
 
if [[ -n "$IFACE" ]]; then # if variable is nonempty
  echo "%{F#1bbf3e}󰆧 %{F#ffffff}$(/usr/sbin/ip a show | grep "tun0" | grep "peer" | awk '{print $2}')"
else
    echo "%{F#1bbf3e}󰆧 %{u-} VPN desconectada"
fi
