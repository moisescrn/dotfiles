#!/bin/sh



#function speed(){
#  INTERFACE="wlo1"
#  RX_OLD=$(cat /sys/class/net/wlo1/statistics/rx_bytes)
#  TX_OLD=$(cat /sys/class/net/wlo1/statistics/tx_bytes)
#  sleep=1
#  RX_NEW=$(cat /sys/class/net/wlo1/statistics/rx_bytes)
#  TX_NEW=$(cat /sys/class/net/wlo1/statistics/tx_bytes)

  # Compute speed and convert from bytes to KB
#  RX_SPEED=$((($RX_NEW - $RX_OLD) / 1024)) # convert from bytes to KBits
#  TX_SPEED=$((($TX_NEW - $TX_OLD) / 1024))

#  echo " ${RX_SPEED} KB/s | ${TX_SPEED}KB/s"
#}



CONNECTED=$(/usr/bin/ip a show dev wlo1 | grep "state" | awk '{print $9}') # prints UP if connected and down if disconnected

if [ "$CONNECTED" = "UP" ]; then
  echo "%{F#2495e7}󰈀 %{F#ffffff}$(/usr/bin/ip a show dev wlo1 | grep "inet " | awk '{print $2}' | cut -d '/' -f 1)"
else
    echo "%{F#c0ca33}Sin conexión a internet"
fi
