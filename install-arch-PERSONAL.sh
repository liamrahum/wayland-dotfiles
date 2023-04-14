#!/bin/bash
sudo pacman -Syu git --noconfirm

git clone https://aur.archlinux.org/yay-bin && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin

sudo ln -snf ~/repos/wayland-dotfiles/dotconfig/* ~/.config/

yay -S linux-lts-headers nvidia-open-dkms hyprland-nvidia-git xdg-desktop-portal-hyprland-git libva-nvidia-driver-git easyeffects kitty hyprpicker ttf-ms-fonts ttf-apple-emoji ttf-google-sans ttf-jetbrains-mono-nerd neofetch polkit-gnome ffmpeg neovim dunst rofi pavucontrol starship wl-clipboard wf-recorder swaybg grimblast-git ffmpegthumbnailer playerctl noise-suppression-for-voice waybar-hyprland-git wlogout swaylock-effects sddm-git nwg-look-bin layan-gtk-theme-git lxappearance qt5ct qt6ct pamixer brave-bin webcord-git-screenshare ntfs onedrivegui ark steam-native-runtime obs-studio

sudo mkdir /mnt/4tb
sudo mkdir /mnt/2tb
sudo cp -f fstab /etc/ 
sudo systemctl daemon-reload
sudo mount -a

sudo cp -f environment /etc/
sudo cp -f mkinitcpio.conf /etc/
mkdir ~/.config/autostart
sudo cp personal/easyeffects-service.desktop ~/.config/autostart

sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

sudo cp -f nvidia.conf /etc/modprobe.d/nvidia.conf

sudo ln -snf /mnt/2tb/Downloads ~/
sudo ln -snf /mnt/4tb/OneDrive/Documents ~/
sudo ln -snf /mnt/4tb/OneDrive/Pictures ~/

sudo systemctl enable sddm
sudo systemctl start sddm

