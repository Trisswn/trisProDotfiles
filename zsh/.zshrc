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

alias power2='powerprofilesctl set balanced && powerprofilesctl | grep "^\*"'
alias power3='powerprofilesctl set performance && powerprofilesctl | grep "^\*"'
alias power1='powerprofilesctl set power-saver && powerprofilesctl | grep "^\*"'

# yt-dlp aliases simples
alias ytvid='yt-dlp -f "bv*+ba/b"'
alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'
alias ytalbum='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --parse-metadata "playlist_title:%(album)s" --parse-metadata "uploader:%(albumartist)s" -o "%(playlist_title)s/%(playlist_index)02d - %(title)s.%(ext)s"'

alias hz='~/toggle-hz.sh'

alias cmd-config='nvim ~/.zshrc'
alias keybinds='nvim ~/.config/hypr/configs/keybinds.conf'
alias back1='cd ..'
alias back2='cd ../..'
alias home='cd ~/'

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

