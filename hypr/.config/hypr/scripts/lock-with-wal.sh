#!/bin/zsh

# 1. Ruta del wallpaper actual (ajusta si usas otra)
WALLPAPER="$HOME/.config/hypr/current_wallpaper"

# 2. Genera los colores con Pywal (guardará un JSON en cache)
wal -i "$WALLPAPER" -o

# 3. Convierte los colores de Pywal a formato Hyprlock
PYWAL_CACHE="$HOME/.cache/wal/colors.json"
CONF="$HOME/.config/hypr/colors.conf"

# Empezamos a escribir el archivo
echo "" > $CONF

# Colores principales de Pywal
PRIMARY=$(jq -r '.colors.color0' $PYWAL_CACHE)
SECONDARY=$(jq -r '.colors.color1' $PYWAL_CACHE)
ON_PRIMARY=$(jq -r '.colors.color7' $PYWAL_CACHE)

# Escribimos en colors.conf
cat <<EOF > $CONF
$image = $WALLPAPER
$background = $PRIMARY
$secondary = $SECONDARY
$on_primary = $ON_PRIMARY
$surface = $PRIMARY
$on_surface = $ON_PRIMARY
$source_color = $SECONDARY
EOF

# 4. Ejecuta hyprlock
hyprlock
