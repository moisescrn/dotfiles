#!/bin/bash

# NAME
#     toggles_touchpad.sh - Toggles between enablind and disabling the touchpad
# SYNOPSIS
#     toggle_touchpad.sh
# suggested location: ~/scripts/toggle_touhcpad.sh
#
# IDEA:
# We run the command "xinput list" and if the touchpad is disabled
# it will be stated to be a "floating slave",
# if it is not disabled it will be stated as a normal input device
# So if xinput list | grep "floating" gives no output then it is enabled and we want to disable it

# Prints enabled or disabled depending on the state of the touchpad
function get_status() {
  check=$(xinput list | grep "floating")
  if [ -n "$check" ]; then # check that the variable is non-empty (touchpad disabled)
    echo "disabled"
  else
    echo "enabled"
  fi
}

# Variables
status=$(get_status)
DISPLAY=":0"
XAUTHORITY="/home/ringanaaro/.Xauthority"
TOUCHPAD="SYNA32C4:00 06CB:CE17 Touchpad"

export DISPLAY XAUTHORITY

# Toggling
if [ $status = "disabled" ]; then
    /usr/bin/xinput enable "$TOUCHPAD"
elif [ $status = "enabled" ]; then
    /usr/bin/xinput disable "$TOUCHPAD"
fi
