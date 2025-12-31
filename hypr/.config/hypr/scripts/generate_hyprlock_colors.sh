#!/bin/bash

# Rutas
WAL_JSON="$HOME/.cache/wal/colors.json"
HYPRLOCK_CONF="$HOME/.config/hypr/colors.conf"

# Leer colores desde el JSON y crear colors.conf
cat >"$HYPRLOCK_CONF" <<EOF
\$background = $(jq -r '.special.background' "$WAL_JSON")
\$primary = $(jq -r '.colors.color1' "$WAL_JSON")
\$secondary = $(jq -r '.colors.color2' "$WAL_JSON")
\$on_primary = $(jq -r '.special.foreground' "$WAL_JSON")
\$source_color = $(jq -r '.colors.color5' "$WAL_JSON")
EOF

echo "colors.conf actualizado para Hyprlock"
