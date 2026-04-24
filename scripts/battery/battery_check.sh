#!/bin/bash
# NAME
#   battery_check.sh - Checks the percentage of the battery charge and sends a message if not between 20% and 80%
# suggested location: ~/scripts/battery/battery_check.sh
# 
# This script will be run every ten minutes via cron

# Allowed percentage range
min=20
max=80

# To block the computer it is sufficient to block the keyboard
KEYBOARD="AT Translated Set 2 keyboard"

# Prints current percentage
function get_current_percentage() {
  init_comm=$(acpi)
  if [[ ! $init_comm == *"Dis"* ]]; then 
    acpi | awk '{print $5}' | tr '%,' '  '
  else
    acpi | awk '{print $4}' | tr '%,' '  '
  fi
}

perc=$(get_current_percentage)

if [ $perc -le $(($min + 5)) ]; then
  /sbin/shutdown -a now
  /usr/bin/kitty --hold -e zsh -c "/usr/bin/echo -ne '\n Nivel de batería bajo. ¡Conécta el dispositivo a la corriente! \n'" &
  /usr/bin/kitty --hold -e zsh -c "/usr/bin/echo -ne '\n El dispositivo se va a bloquear en 120s \n'" &
  sleep 120
  /usr/bin/kitty --hold -e zsh -c "/usr/bin/echo -ne '\n Dispositivo bloqueado \n'" &
  /usr/bin/xinput disable "$KEYBOARD"
fi

if [ $perc -le $(($min + 10)) ]; then
  /usr/bin/bspc desktop -f '^9' &
  /usr/bin/kitty --hold -e zsh -c "/usr/bin/echo -ne '\n Nivel de batería bajo. ¡Conécta el dispositivo a la corriente! \n'" &

elif [ $perc -le $min ]; then
  /usr/bin/bspc desktop -f '^9' &
  /usr/bin/kitty --hold -e zsh -c "/usr/bin/echo -ne '\n Nivel de batería demasiado bajo \n'" &

elif [ $perc -ge $max ]; then
  /usr/bin/bspc desktop -f '^9' &
  /usr/bin/kitty --hold -e zsh -c "/usr/bin/echo -ne '\n Nivel de batería demasiado alto \n '" &
fi
