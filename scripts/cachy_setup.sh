#!/bin/bash

# --- 1. Sincronización Inicial ---
echo "🚀 Sincronizando repositorios de CachyOS..."
sudo pacman -Syu --noconfirm

# --- 2. Instalación del Core Visual y Stow ---
echo "🎨 Instalando entorno visual (Pywal-centric)..."
sudo pacman -S --needed --noconfirm \
  hyprland hyprpaper hyprlock hypridle \
  waybar swaync swww stow \
  kitty alacritty yazi starship btop fastfetch \
  rofi-wayland wlogout nwg-look \
  python-pywal \
  grim slurp swappy wl-clipboard pavucontrol brightnessctl

# --- 3. Fuentes y Zsh Dependencies ---
echo "🔤 Instalando fuentes y dependencias de Shell..."
sudo pacman -S --needed --noconfirm \
  ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd ttf-hack-nerd \
  noto-fonts-emoji zsh wget curl

# --- 4. Gaming y Apps ---
echo "🎮 Instalando soporte para Gaming y Multimedia..."
sudo pacman -S --needed --noconfirm \
  steam lutris wine-staging winetricks \
  obs-studio vlc yt-dlp ani-cli \
  visual-studio-code-bin spotify

# --- 5. AUR Packages (Usando Paru que ya viene en Cachy) ---
echo "📦 Instalando paquetes de AUR..."
paru -S --noconfirm swaylock-effects-git cava matugen-bin spicetify-cli

# --- 6. Instalación de Oh-My-Zsh y Plugins ---
echo "🐚 Configurando Zsh (Oh-My-Zsh & P10k)..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# --- 7. MAGIA DE STOW: Limpieza y Linkeo ---
echo "🔗 Aplicando Dotfiles con GNU Stow..."
cd ~/.dotfiles

# Lista de carpetas a procesar
DOT_FOLDERS=(cava fastfetch hypr kitty nvim qt rofi swaync wal waybar wlogout wofi zsh wallpapers git)

for folder in "${DOT_FOLDERS[@]}"; do
  echo "  -> Procesando $folder..."
  # Si es zsh, el conflicto es ~/.zshrc. Si es el resto, es en ~/.config/
  if [ "$folder" == "zsh" ]; then
    [ -f ~/.zshrc ] && rm ~/.zshrc
  elif [ "$folder" == "wallpapers" ]; then
    mkdir -p ~/Pictures/wallpapers
  elif [ "$folder" == "git" ]; then
    [ -f ~/.gitconfig ] && rm ~/.gitconfig
  else
    # Borra la carpeta default de CachyOS si existe para que stow no falle
    [ -d ~/.config/$folder ] && rm -rf ~/.config/$folder
  fi
  stow $folder
done

echo "✅ Script finalizado. ¡Bienvenido a CachyOS!"
echo "💡 TIP: Ejecuta 'wal -i ~/Pictures/wallpapers/TU_FAVORITO.png' para inicializar colores."
