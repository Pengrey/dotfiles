# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="gozilla"

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
alias tailup='sudo systemctl start tailscaled && sudo tailscale up'
