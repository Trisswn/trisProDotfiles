#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
  cava -p ~/.config/cava/waybar.conf
fi

