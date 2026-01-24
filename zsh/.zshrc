fastfetch
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# =====================
# Powerlevel10k Instant Prompt
# =====================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =====================
# Oh-My-Zsh
# =====================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# =====================
# Zsh Syntax Highlighting Styles
# =====================
ZSH_HIGHLIGHT_STYLES[command]='fg=#337ded'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#337ded'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#cd3eed'
ZSH_HIGHLIGHT_STYLES[function]='fg=#337ded'

ZSH_HIGHLIGHT_STYLES[path]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#a6e3a1'

ZSH_HIGHLIGHT_STYLES[option]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[argument]='fg=#cdd6f4'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ed3e6a,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#f9e2af,bold'

# =====================
# Powerlevel10k Theme Config
# =====================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =====================
# Starship (opcional)
# =====================
# eval "$(starship init zsh)"

# =====================
# Aliases
# =====================
alias grabaciones='dbus-launch nautilus --no-desktop ~/Videos'


# yt-dlp aliases simples
alias ytvid='yt-dlp -f "bv*[height<=1080]+ba/b[height<=1080]"'
alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'
alias ytalbum='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --parse-metadata "playlist_title:%(album)s" --parse-metadata "uploader:%(albumartist)s" -o "%(playlist_title)s/%(playlist_index)02d - %(title)s.%(ext)s"'

alias hyprconf='nvim .config/hypr/hyprland.conf'

alias cmd-config='nvim ~/.zshrc'
alias keybinds='nvim ~/.config/hypr/configs/keybinds.conf'
alias back1='cd ..'
alias back2='cd ../..'
alias home='cd ~/'
alias winrules='nvim /home/trisswn/.config/hypr/configs/windowrules.conf'
alias refterm='source ~/.zshrc'
alias fastconfig='nvim ~/.config/fastfetch/config.jsonc '
alias powermode='~/bin/power-mode.sh'
alias colores='for i in {0..15}; do
  printf "\e[48;5;%sm  color%-2d  \e[0m\n" "$i" "$i"
done'
alias looknfeel='nvim ~/.config/hypr/configs/looknfeel.conf'
alias configs='cd ~/.config/hypr'
alias performance='sudo auto-cpufreq --force performance'
alias powersave='sudo auto-cpufreq --force powersave'
alias windows='sudo mount -t ntfs-3g /dev/nvme0n1p3 /mnt/windows'
alias nvim="NVIM_APPNAME=nvchad nvim"
alias letras='sptlrx --current "bold,#DDE6F0,#56738F" --before "104,faint,italic" --after "104,faint"'
alias wifi='nmtui'

# =====================
# Manjaro Zsh Config (opcional, si quieres mantenerlo)
# =====================
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# =====================
# Powerline
# =====================
USE_POWERLINE="true"
HAS_WIDECHARS="false"



# User local binaries
export PATH="$HOME/.local/bin:$PATH"
alias nautilus='thunar'
