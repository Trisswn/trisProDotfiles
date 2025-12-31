#!/bin/bash
#=== CONFIG PARA EL SELECTOR DE WALLPAPERS ===

# === CONFIG ===
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"

cd "$WALLPAPER_DIR" || exit 1

# === handle spaces name
IFS=$'\n'

# === ICON-PREVIEW SELECTION WITH ROFI, SORTED BY NEWEST ===
SELECTED_WALL=$(for a in $(ls -t *.jpg *.png *.gif *.jpeg 2>/dev/null); do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -p "")
[ -z "$SELECTED_WALL" ] && exit 1
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"

# === SET WALLPAPER ===
swww img "$SELECTED_PATH" --transition-type any
# === SELECTOR DE COLORES ===
wal -i "$SELECTED_PATH" --saturate 0.4
# === ACTUALIZAR COLORES PARA HYPRLOCK ===
~/.config/hypr/scripts/generate_hyprlock_colors.sh

# === CREATE SYMLINK ===
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"

swaync-client -rs
pkill -USR1 cava
