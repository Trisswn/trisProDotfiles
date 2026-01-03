#!/bin/bash
# === CONFIG ===
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"
TEMP_FRAME="/tmp/wallpaper_pywal_frame.png"
MONITOR="eDP-1"

# Entrar al directorio
cd "$WALLPAPER_DIR" || exit 1
IFS=$'\n'

# === SELECTOR ROFI ===
SELECTED_WALL=$(for a in $(ls -t *.jpg *.png *.gif *.jpeg *.mp4 *.webm *.mov 2>/dev/null); do 
    echo -en "$a\0icon\x1f$a\n"
done | rofi -dmenu -p "Wallpaper")

[ -z "$SELECTED_WALL" ] && exit 1
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"
EXTENSION="${SELECTED_WALL##*.}"

# === DETECCIÓN DE TIPO ===
case " ${EXTENSION,,} " in
    " mp4 " | " webm " | " mov ")
        # 1. Extraer frame para pywal (rápido)
        ffmpeg -ss 00:00:01 -i "$SELECTED_PATH" -vframes 1 -q:v 2 -y "$TEMP_FRAME" > /dev/null 2>&1
        COLOR_SOURCE="$TEMP_FRAME"
        
        # 2. Limpieza total de procesos previos
        pkill -9 swww-daemon 2>/dev/null
        killall -9 mpvpaper 2>/dev/null
        sleep 0.1

        # 3. LANZAR VIDEO (Optimizado para AMD Radeon 660M)
        # nice -n 15: Baja prioridad para que no de lag a tus ventanas
        # --hwdec=vaapi: Usa el driver que vimos en tu vainfo
        # --video-sync=audio: Evita peleas con los 144Hz del monitor
        # --framedrop=vo: Si la GPU se cansa, salta cuadros del fondo, no de tus ventanas
        nice -n 15 mpvpaper -o "no-audio --loop-playlist --hwdec=vaapi --vd-lavc-fast --video-sync=audio --framedrop=vo --swapchain-depth=1" "$MONITOR" "$SELECTED_PATH" &
        ;;
    *)
        # --- ES UNA IMAGEN O GIF ---
        COLOR_SOURCE="$SELECTED_PATH"
        killall -9 mpvpaper 2>/dev/null
        
        if ! pgrep -x "swww-daemon" > /dev/null; then
            swww-daemon & 
            sleep 0.5
        fi
        swww img "$SELECTED_PATH" --transition-type any
        ;;
esac

# === GENERAR COLORES ===
wal -i "$COLOR_SOURCE" --saturate 0.5

# === ACTUALIZAR SISTEMA ===
[ -f "$HOME/.config/hypr/scripts/generate_hyprlock_colors.sh" ] && bash "$HOME/.config/hypr/scripts/generate_hyprlock_colors.sh"

# Actualizar Symlink
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"

# Recargar componentes (Silencioso)
swaync-client -rs 2>/dev/null
pkill -USR1 cava 2>/dev/null
