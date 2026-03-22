#!/bin/bash
 
ip_address=$(/bin/cat /home/ringanaaro/.config/polybar/scripts/target | awk '{print $1}')
machine_name=$(/bin/cat /home/ringanaaro/.config/polybar/scripts/target | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#e51d0b}󰓾 %{F#e51d0b}$ip_address%{u-} - $machine_name"
else
    echo "%{F#e51d0b}󰓾 %{u-}%{F#ffb300} No target"
fi
