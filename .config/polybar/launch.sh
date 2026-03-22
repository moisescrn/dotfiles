#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

# Center bar
polybar primary -c ~/.config/polybar/workspace.ini &

## Left bar
#polybar log -c ~/.config/polybar/current.ini &
polybar ethernet_bar -c ~/.config/polybar/current.ini &
# polybar vpn_bar -c ~/.config/polybar/current.ini &
# polybar target_to_hack -c ~/.config/polybar/current.ini &

## Right bar
# polybar top -c ~/.config/polybar/current.ini &
# polybar primary -c ~/.config/polybar/current.ini &
polybar secondary -c ~/.config/polybar/current.ini &
polybar battery_bar -c ~/.config/polybar/current.ini &
polybar cpu_bar -c ~/.config/polybar/current.ini &
polybar memory_bar -c ~/.config/polybar/current.ini

# Put the memory_bar at the very end, otherwise it intrefers with the following bars and it does not work properly
