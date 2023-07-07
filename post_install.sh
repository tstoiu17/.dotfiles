#!/bin/sh

pacman -S --needed base-devel git neovim zsh stow
username="tudor"
useradd --create-home --groups wheel --shell /usr/bin/zsh $username
passwd $username
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

# install paru
cd /home/$username
sudo -u $username git clone https://aur.archlinux.org/paru.git
cd paru
sudo -u $username makepkg -si
cd ..
sudo -u $username rm -rf paru

# clone dotfiles
sudo -u $username git clone https://github.com/tstoiu17/.dotfiles.git
cd .dotfiles
# stow dotfiles
sudo -u $username ./stow.sh

# install pkgs
sudo -u $username paru -S --needed - < ./pkglist.txt

# a better sh
ln -sf dash /bin/sh
cd /home/$username
mkdir dl docs img vid repos
