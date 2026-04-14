#!/bin/bash
# 
# Script that changes between the "normal" polybar and the tengwar polybar
# IDEA
# When the tengwar bar is active, then eww will have an pid (we get it with "pgrep eww",
# if eww is not active, the normal polybar is active

eww_chivato=$(pgrep eww)

if [ ! -z "$eww_chivato" ]; then # check if chivato is empty
  # kill the tengwar date module
  pkill eww
  pkill polybar
  # start the normal bar
  /home/ringanaaro/.config/polybar/launch.sh &
  /usr/bin/systemctl --user stop teng_date.timer & # stop the date generator
elif [ -z "$eww_chivato" ]; then
  # start tengwar bar
  /home/ringanaaro/.config/polybar/teng_launch.sh &
  # start tengwar date
  /usr/bin/eww daemon &
  /usr/bin/eww open tengwar_bar &
  /usr/bin/systemctl --user start teng_date.timer & # start the date generator
fi
