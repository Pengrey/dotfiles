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

# git clone these dotfiles if not done yet
if [ ! -d ~/dotfiles ]; then
    printf '\e[1mCloning dotfiles repo\e[0m\n'
    git clone https://github.com/Pengrey/dotfiles.git ~/dotfiles
fi

# Remove unecessary packages
printf '\e[1mRemoving unecessary files\e[0m\n'
rm -rf ~/dotfiles/.git
rm -rf ~/dotfiles/install.sh
rn -rf ~/dotfiles/README.md
mv ~/dotfiles/.zshrc ~/.zshrc

# Install stow if not installed
if [ ! -x "$(command -v stow)" ]; then
    printf '\e[1mInstalling Stow\e[0m\n'
    sudo pacman -S --noconfirm --needed stow
fi

# Stow subdirectories of dotfiles
printf '\e[1mLinking dotfiles to your home directory\e[0m\n'
for dir in ~/dotfiles/*/; do
    stow --dir ~/dotfiles --target ~ "$(basename "${dir}")"
done

# Remove stow
sudo pacman -Rns --noconfirm stow

#
# Terminal
#

# Install alacritty if not installed
if [ ! -x "$(command -v alacritty)" ]; then
    printf '\e[1mInstalling Alacritty\e[0m\n'
    sudo pacman -S --noconfirm --needed alacritty
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

#
# Terminal Applications
#

# Install curl if not installed
if [ ! -x "$(command -v curl)" ]; then
    printf '\e[1mInstalling Curl\e[0m\n'
    sudo pacman -S --noconfirm --needed curl
fi

# Install wget if not installed
if [ ! -x "$(command -v wget)" ]; then
    printf '\e[1mInstalling Wget\e[0m\n'
    sudo pacman -S --noconfirm --needed wget
fi

# Install neo-vim if not installed
if [ ! -x "$(command -v nvim)" ]; then
    printf '\e[1mInstalling Neo-Vim\e[0m\n'
    sudo pacman -S --noconfirm --needed neovim
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

# Install lf if not installed
if [ ! -x "$(command -v lf)" ]; then
    printf '\e[1mInstalling lf\e[0m\n'
    sudo pacman -S --noconfirm --needed lf
fi

# Install btop if not installed
if [ ! -x "$(command -v btop)" ]; then
    printf '\e[1mInstalling Btop\e[0m\n'
    sudo pacman -S --noconfirm --needed btop
fi

#
# GUI Applications
#

# Install firefox if not installed
if [ ! -x "$(command -v firefox)" ]; then
    printf '\e[1mInstalling Firefox\e[0m\n'
    sudo pacman -S --noconfirm --needed firefox
fi

# Install dolphin if not installed
if [ ! -x "$(command -v dolphin)" ]; then
    printf '\e[1mInstalling Dolphin\e[0m\n'
    sudo pacman -S --noconfirm --needed dolphin
fi

#
# Desktop Environment
#

# Install sway, swaybg, swayidle, swaylock if not installed
if [ ! -x "$(command -v sway)" ]; then
    printf '\e[1mInstalling Sway\e[0m\n'
    sudo pacman -S --noconfirm --needed sway swaybg swayidle swaylock
fi

# Install waybar if not installed
if [ ! -x "$(command -v waybar)" ]; then
    printf '\e[1mInstalling Waybar\e[0m\n'
    sudo pacman -S --noconfirm --needed waybar
fi

# Install wofi if not installed
if [ ! -x "$(command -v wofi)" ]; then
    printf '\e[1mInstalling Wofi\e[0m\n'
    sudo pacman -S --noconfirm --needed wofi
fi

# Use zsh
if [ -x "$(command -v zsh)" ] && [ "$SHELL" != "$(command -v zsh)" ]; then
	printf '\e[1mChanging your shell to zsh\e[0m\n'
	grep -q -F "$(command -v zsh)" /etc/shells || sudo sh -c 'echo "$(command -v zsh)" >> /etc/shells'
	sudo chsh -s "$(command -v zsh)"
fi

# Remove existing bash config files
rm -rf ~/.bash*

printf '\e[1mDotfiles successfully installed. Please reboot to finalize.\e[0m\n'
