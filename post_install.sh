#!/bin/sh

username="tudor"
useradd --create-home --groups wheel --shell /usr/bin/zsh $username
passwd $username
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

# install paru
pacman -S --needed base-devel git
cd /home/$username
sudo -u $username git clone https://aur.archlinux.org/paru.git
cd paru
sudo -u $username makepkg -si
cd ..
rm -rf paru

# clone dotfiles
sudo -u $username git clone https://github.com/tstoiu17/.dotfiles.git
cd .dotfiles
# stow dotfiles
sudo -u $username ./stow.sh

# install pkgs
paru -S --needed - < ./pkglist.txt

# a better sh
ln -sf dash /bin/sh
