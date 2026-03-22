#!/bin/sh
# NAME
#     volume.sh - Increase/decrease/mute volume
# SYNOPSIS
#     volume.sh <raise|lower|mute>
# suggested location: ~/scripts/volume.sh
#
step=5    # number of percentage points to increase/decrease volume
max=100   # do not increase volume above this percentage

# Prints current volume percentage
function get_current_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | awk -F '/' '{print $2}' | grep -o '[0-9]\+'
}


if [ $1 == "raise" ] && [ $(get_current_volume) -lt "$max" ]; then
  # check that the volume is below the maximum
  amixer set Master ${step}%+ > /dev/null

elif [ $1 == "lower" ]; then
  amixer set Master ${step}%- > /dev/null

elif [ $1 == "mute" ]; then
  amixer set Master toggle > /dev/null

else
  echo "Usage sould be: volume.sh <raise|lower|mute>"
fi

