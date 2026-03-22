#!/bin/sh
# NAME
#     toggles_keyboard.sh - Toggles keyboard layout between spanish and german
# SYNOPSIS
#     toggle_keyboard.sh
# suggested location: ~/scripts/toggle_keyboard.sh
#

# Prints current keyboard layout
function get_current_keyboard() {
  setxkbmap -query | grep "layout" | awk '{print $2}'
}

if [ $(get_current_keyboard) == "de" ]; then
  setxkbmap es &> /dev/null
else
  setxkbmap de &> /dev/null
fi
