#!/bin/zsh
# Toggle de modos: Low → Balanced → Max

STATE_FILE=/tmp/power_mode_state

if [ -f $STATE_FILE ]; then
    MODE=$(cat $STATE_FILE)
else
    MODE="low"
fi

case $MODE in
    low)
        sudo cpupower frequency-set -g ondemand
        notify-send "Modo de energía" "Balanced activado"
        echo "balanced" > $STATE_FILE
        ;;
    balanced)
        sudo cpupower frequency-set -g performance
        notify-send "Modo de energía" "Máximo rendimiento activado"
        echo "max" > $STATE_FILE
        ;;
    max)
        sudo cpupower frequency-set -g powersave
        notify-send "Modo de energía" "Low Power activado"
        echo "low" > $STATE_FILE
        ;;
esac
