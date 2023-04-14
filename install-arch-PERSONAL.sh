#!/bin/bash
sudo pacman -Syu git --noconfirm

git clone https://aur.archlinux.org/yay-bin && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin

sudo ln -snf ~/repos/wayland-dotfiles/dotconfig/* ~/.config/

yay -S linux-lts-headers nvidia-open-dkms hyprland-nvidia-git xdg-desktop-portal-hyprland libva-nvidia-driver-git easyeffects kitty hyprpicker neofetch polkit-gnome ffmpeg neovim dunst rofi pavucontrol starship wl-clipboard wf-recorder swaybg grimblast-git ffmpegthumbnailer playerctl noise-suppression-for-voice waybar-hyprland wlogout swaylock-effects sddm-git nwg-look-bin layan-gtk-theme-git lxappearance qt5ct qt6ct pamixer brave-bin webcord-git-screenshare obs-studio --noconfirm

sudo cp -f fstab /etc/ 
sudo cp -f environment /etc/
sudo cp -f mkinitcpio.conf /etc/
mkdir ~/.config/autostart
sudo cp personal/easyeffects-service.desktop ~/.config/autostart

sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

sudo cp -f nvidia.conf /etc/modprobe.d/nvidia.conf

sudo systemctl enable sddm
sudo systemctl start sddm

