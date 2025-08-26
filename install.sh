#!/bin/sh

# Run full system upgrade
printf '\e[1mRunning full system upgrade\e[0m\n'
sudo pacman -Syu --noconfirm

# Print message
printf '\e[1mInstalling dotfiles\e[0m\n'

# Install Git if not installed
if [ ! -x "$(command -v git)" ]; then
    printf '\e[1mInstalling Git\e[0m\n'
    sudo pacman -S --noconfirm --needed git
fi

#
# Terminal
#

# Install ghostty if not installed
if [ ! -x "$(command -v ghostty)" ]; then
    printf '\e[1mInstalling ghostty\e[0m\n'
    sudo pacman -S --noconfirm --needed ghostty
fi

# Install zsh if not installed
if [ ! -x "$(command -v zsh)" ]; then
    printf '\e[1mInstalling Zsh\e[0m\n'
    sudo pacman -S --noconfirm --needed zsh
fi

# Install oh-my-zsh if not installed
if [ ! -d ~/.oh-my-zsh ]; then
    printf '\e[1mInstalling Oh-My-Zsh\e[0m\n'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc
fi

# Install zsh-autosuggestions if not installed
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    printf '\e[1mInstalling Zsh-Autosuggestions\e[0m\n'
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Install zsh-syntax-highlighting if not installed
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    printf '\e[1mInstalling Zsh-Syntax-Highlighting\e[0m\n'
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Install font-awesome if not installed
if [ ! -d /usr/share/fonts/OTF/Font-Awesome ]; then
    printf '\e[1mInstalling Font-Awesome\e[0m\n'
    sudo pacman -S --noconfirm --needed otf-font-awesome
fi

# Install Nerd Fonts if not installed
if [ ! -d "/usr/share/fonts/TTF/JetBrainsMono" ]; then
    printf '\e[1mInstalling Nerd Fonts\e[0m\n'
    sudo pacman -S --noconfirm --needed ttf-jetbrains-mono-nerd
fi


#
# Terminal Applications
#

# Install wget if not installed
if [ ! -x "$(command -v wget)" ]; then
    printf '\e[1mInstalling Wget\e[0m\n'
    sudo pacman -S --noconfirm --needed wget
fi

# Install exa if not installed
if [ ! -x "$(command -v exa)" ]; then
    printf '\e[1mInstalling Exa\e[0m\n'
    sudo pacman -S --noconfirm --needed exa
fi

# Install bat if not installed
if [ ! -x "$(command -v bat)" ]; then
    printf '\e[1mInstalling Bat\e[0m\n'
    sudo pacman -S --noconfirm --needed bat
fi

printf '\e[1mDotfiles successfully installed. Please reboot to finalize.\e[0m\n'
