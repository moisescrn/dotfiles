#!/bin/sh
# requires inotify-tools

BACKLIGHT="/sys/class/backlight/amdgpu_bl1"
BRIGHTNESS="$BACKLIGHT/brightness"
MAX_BRIGHTNESS=$(cat "$BACKLIGHT/max_brightness")

inotifywait -m -e modify "$BRIGHTNESS" \
  | while IFS= read -r line; do cat $BRIGHTNESS; done \
  | xob -m "$MAX_BRIGHTNESS" -t 750 -c ~/.config/xob/brightness_style.cfg
