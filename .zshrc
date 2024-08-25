# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="gozilla"

# If running from tty exec sway
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
fi

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Alias
alias vim="nvim"
alias ls="exa -l --icons"
alias cat="bat"
alias update="sudo pacman -Syu"

# Add firefox wayland support
export MOZ_ENABLE_WAYLAND=1
