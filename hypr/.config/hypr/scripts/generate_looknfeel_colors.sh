#!/bin/bash

WAL_JSON="$HOME/.cache/wal/colors.json"
LOOKNFEEL_COLORS="$HOME/.config/hypr/looknfeel_colors.conf"

cat >"$LOOKNFEEL_COLORS" <<EOF
$active_border = $(jq -r '.colors.color8' "$WAL_JSON")
$inactive_border = $(jq -r '.colors.color0' "$WAL_JSON")
$primary = $(jq -r '.colors.color1' "$WAL_JSON")
$secondary = $(jq -r '.colors.color2' "$WAL_JSON")
$on_primary = $(jq -r '.special.foreground' "$WAL_JSON")
$source_color = $(jq -r '.colors.color4' "$WAL_JSON")
EOF

echo "looknfeel_colors.conf actualizado"
