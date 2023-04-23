#!/bin/bash

echo "WARNING! Run this script from '~/repos/wayland-dotfiles'! Otherwise things will break!"
sleep 3

sudo pacman -Syu git --noconfirm`

git clone https://aur.archlinux.org/yay-bin && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin

cd ..
git clone https://github.com/liamrahum/wallpapers
cd wayland-dotfiles

sudo ln -snf ~/repos/wayland-dotfiles/dotconfig/* ~/.config/

clear
yay -S linux-lts linux-lts-headers xdg-desktop-portal-hyprland-git waybar-hyprland-git 

yay -S networkmanager network-manager-applet bluez bluez-utils blueman

yay -S sddm qt5-wayland qt6-wayland qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects

yay -S dunst rofi-lbonn-wayland-git swww swaylock-effects-git wlogout grim slurp swappy

yay -S polkit-kde-agent pacman-contrib imagemagick pavucontrol pamixer python-requests noto-fonts-emoji

yay -S nwg-look kvantum qt5ct qt6ct

yay -S brave-bin kitty neofetch dolphin vscodium neovim ark kde-cli-tools


clear
read -p "Are you using an NVIDIA GPU? (Y/n)" NVIDIA
if ["$NVIDIA" == "n" || "$NVIDIA" == "N"]; then
  yay -S hyprland-git
else
  yay -S nvidia-dkms nvidia-utils hyprland-nvidia-git libva-nvidia-driver-git
  sudo cp -f mkinitcpio.conf /etc/
  sudo cp -f nvidia.conf /etc/modprobe.d/nvidia.conf  
  sudo mkinitcpio --config /etc/mkinitcpio.conf -p linux-lts

fi

echo "WARNING! This will break your system if you're not the author of the git repo!"
read -p "Would you like to skip the personal part? (Y/n)?" SKIP
if [ "$SKIP" = "n" || "$SKIP" = "N" ]; then
  yay -S calf-git easyeffects
  sudo mkdir /mnt/4tb;
  sudo mkdir /mnt/2tb;
  sudo cp -f ~/repos/wayland-dotfiles/personal/fstab /etc/; 
  sudo systemctl daemon-reload;
  sudo mount -a;
  mkdir ~/.config/autostart;
  sudo cp personal/easyeffects-service.desktop ~/.config/autostart;
  sudo ln -snf /mnt/2tb/Downloads ~/;
  sudo ln -snf /mnt/4tb/OneDrive/Documents ~/;
  sudo ln -snf /mnt/4tb/OneDrive/Pictures ~/;
fi

clear

read -p "If you're using GRUB & NVIDIA, press y to configure NVIDIA (y/N)?" UGRUB
if [ "$UGRUB" = "y" || "$UGRUB" = "Y" ]; then
  GRUB=`cat /etc/default/grub | grep "GRUB_CMDLINE_LINUX_DEFAULT" | rev | cut -c 2- | rev`
  GRUB+=" nvidia_drm.modeset=1\""
  sudo sed -i -e "s|^GRUB_CMDLINE_LINUX_DEFAULT.*|${GRUB}|" /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg     
fi

read -p "You wanna add virtualization capabilites? (y/N)" VIRT
if [ "$VIRT" = "y" || "$VIRT" = "Y" ]; then
  GRUB=`cat /etc/default/grub | grep "GRUB_CMDLINE_LINUX_DEFAULT" | rev | cut -c 2- | rev`
  read -p "Press Y for AMD CPUs, N for Intel? (Y/n)" INTEL
  if [ "$INTEL" = "y" || "$INTEL" = "Y" ]; then
    GRUB+=" amd_iommu=on iommu=pt video=efifb:off\""
  else
    GRUB+=" intel_iommu=on iommu=pt\""
  fi
  sudo sed -i -e "s|^GRUB_CMDLINE_LINUX_DEFAULT.*|${GRUB}|" /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi


