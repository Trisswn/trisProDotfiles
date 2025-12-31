#!/bin/bash
# Si ya se está grabando, detenerlo
if pgrep -x "wf-recorder" > /dev/null; then
    pkill -INT wf-recorder
    notify-send "Grabación detenida" "Video guardado en ~/Videos"
else
    # Iniciar grabación (Nombre con fecha)
    mkdir -p ~/Videos
    FILENAME=~/Videos/recording_$(date +"%Y-%m-%d_%H-%M-%S").mp4
    notify-send "Grabando..." "Presiona el atajo de nuevo para detener"
    # Graba toda la pantalla (con audio si quieres, agrega --audio)
    prime-run wf-recorder -f $FILENAME -a --codec=h264_nvenc

fi
