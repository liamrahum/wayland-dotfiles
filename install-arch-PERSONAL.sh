#!/bin/bash
sudo pacman -S git -y

git clone https://aur.archlinux.org/yay-bin && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin

yay -S linux-lts-headers nvidia-open-dkms hyprland-nvidia-git xdg-desktop-portal-hyprland neofetch polkit-gnome ffmpeg neovim viewnior dunst rofi pavucontrol starship wl-clipboard wf-recorder swaybg grimblast-git ffmpegthumbnailer tumbler playerctl noise-suppression-for-voice kitty waybar-hyprland wlogout swaylock-effects sddm-git nwg-look-bin tela-icon-theme pamixer brave-bin 

sudo systemctl enable sddm
sudo systemctl start sddm

