#!/bin/bash

echo "WARNING! Run this script from '~/repos/wayland-dotfiles'! Otherwise things will break!"
sleep(3)

sudo pacman -Syu git --noconfirm

git clone https://aur.archlinux.org/yay-bin && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin

cd ..
git clone https://github.com/liamrahum/wallpapers
cd wayland-dotfiles

sudo ln -snf ~/repos/wayland-dotfiles/dotconfig/* ~/.config/

clear
echo "Installing necessary packages"
sleep(2)
yay -S linux-lts-headers nvidia-open-dkms hyprland-nvidia-git xdg-desktop-portal-hyprland-git libva-nvidia-driver-git waybar-hyprland-git

clear
echo "Installing Wayland specifics"
sleep(2)
yay -S wl-clipboard wf-recorder hyprpicker swaybg wlogout swaylock-effects 

clear
echo "Installing some nice fonts"
sleep(2)
yay -S ttf-ms-fonts ttf-apple-emoji ttf-google-sans ttf-jetbrains-mono-nerd

clear
echo "General applications to start with"
sleep(2)
yay -S dex kitty neofetch polkit-gnome neovim dunst rofi pavucontrol grimblast-git playerctl sddm-git nwg-look-bin layan-gtk-theme-git lxappearance qt5ct qt6ct pamixer

clear
read -p "Would you like to install Brave, Dolphin, WebCord, and ntfs? (y/N)?" BDWN
if [ "$BDWN" = "y" || "" = "Y" ]; then
yay -S dolphin brave-bin ntfs3-dkms webcord-git-screenshare;
fi

clear
echo "WARNING! This will break your system if you're not the author of the git repo!"
read -p "Would you like to skip the personal part? (Y/n)?" SKIP
if [ "$SKIP" = "n" || "" = "N" ]; then
  yay -S calf-git easyeffects
  sudo mkdir /mnt/4tb;
  sudo mkdir /mnt/2tb;
  sudo cp -f fstab /etc/; 
  sudo systemctl daemon-reload;
  sudo mount -a;
  mkdir ~/.config/autostart;
  sudo cp personal/easyeffects-service.desktop ~/.config/autostart;
  sudo ln -snf /mnt/2tb/Downloads ~/;
  sudo ln -snf /mnt/4tb/OneDrive/Documents ~/;
  sudo ln -snf /mnt/4tb/OneDrive/Pictures ~/;
fi

sudo cp -f environment /etc/
sudo cp -f mkinitcpio.conf /etc/
sudo cp -f nvidia.conf /etc/modprobe.d/nvidia.conf

sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

clear
read -p "Would you like to enable sddm? (y/N)?" SDDM
if [ "$SDDM" = "y" || "" = "Y" ]; then
  sudo systemctl enable sddm;
else
  echo "Oh well";
fi

echo "Script finished! Rebooting..."
sleep(1)
reboot
