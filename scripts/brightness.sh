#!/bin/sh
# NAME
#     brightness.sh - Increase/decrease brightness
# SYNOPSIS
#     brightness.sh <raise|lower>
# suggested location: ~/scripts/brightness.sh
#
step=6168 # number of points to increase/decrease brightness (it corresponds to 10%, as the maximum is 61680)
max=$(brightnessctl --device=amdgpu_bl1 m) # maximum amount of brightness
current=$(brightnessctl --device=amdgpu_bl1 g) # current amount of brightness

if [ $1 == "raise" ] && [ $current -lt "$max" ]; then
  # check that the brightness is below the maximum
  brightnessctl --device=amdgpu_bl1 s +${step} > /dev/null

elif [ $1 == "lower" ]; then
  brightnessctl --device=amdgpu_bl1 s ${step}- > /dev/null

else
  echo "Usage sould be: brightness.sh <raise|mute>"
fi

