# Path to oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="gozilla"

source $ZSH/oh-my-zsh.sh

# If running from tty exec sway
[ "$(tty)" = "/dev/tty1" ] && WLR_NO_HARDWARE_CURSORS=1 exec sway

# Alias
alias vim="nvim"
alias ls="exa -l"
alias cat="bat"
alias update="sudo pacman -Syu"

# Add firefox wayland support
export MOZ_ENABLE_WAYLAND=1
