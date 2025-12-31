#!/bin/bash

# Pantalla
SCREEN="eDP-1"

# Detecta AC o batería
POWER_SOURCE=$(cat /sys/class/power_supply/ADP1/online)

if [ "$POWER_SOURCE" -eq 1 ]; then
    # Conectado → 120 Hz
    xrandr --output $SCREEN --mode 1920x1080 --rate 120
    echo "Pantalla: 120Hz (AC)"
else
    # Batería → 60 Hz
    xrandr --output $SCREEN --mode 1920x1080 --rate 60
    echo "Pantalla: 60Hz (Batería)"
fi
