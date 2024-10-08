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
rm -rf ~/dotfiles/README.md
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

# Install neovim if not installed
if [ ! -x "$(command -v nvim)" ]; then
    printf '\e[1mInstalling Neo-Vim\e[0m\n'
    sudo pacman -S --noconfirm --needed neovim
fi

# Config neovim
printf '\e[1mSetting nvim config\e[0m\n'
git clone https://github.com/NvChad/starter ~/.config/nvim


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

# Install zathura and zathura-pdf-mupdf
if [ ! -x "$(command -v zathura)" ]; then
    printf '\e[1mInstalling zathura\e[0m\n'
    sudo pacman -S --noconfirm --needed zathura
    printf '\e[1mInstalling zathura-pdf-mupdf\e[0m\n'
    sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
fi

#
# GUI Applications
#

# Install nm-connection-editor if not installed
if [ ! -x "$(command -v nm-connection-editor)" ]; then
    printf '\e[1mInstalling nm-connection-editor\e[0m\n'
    sudo pacman -S --noconfirm --needed nm-connection-editor
fi

# Install nm-manager-applet if not installed
if [ ! -x "$(command -v nm-manager-applet)" ]; then
    printf '\e[1mInstalling nm-manager-applet\e[0m\n'
    sudo pacman -S --noconfirm --needed nm-manager-applet
fi

# Install pavucontrol if not installed
if [ ! -x "$(command -v pavucontrol)" ]; then
    printf '\e[1mInstalling pavucontrol\e[0m\n'
    sudo pacman -S --noconfirm --needed pavucontrol
fi

# Install firefox if not installed
if [ ! -x "$(command -v firefox)" ]; then
    printf '\e[1mInstalling firefox\e[0m\n'
    sudo pacman -S --noconfirm --needed firefox
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
	sudo chsh -s $(command -v zsh) $(whoami)
fi

# Remove existing bash config files
rm -rf ~/.bash*

printf '\e[1mDotfiles successfully installed. Please reboot to finalize.\e[0m\n'
