, #!/bin/bash

echo "WARNING! This will break your system if you're not the author of the git repo!"
echo "Press Ctrl+C to stop script"
sleep(5)

sudo pacman -Syu git --noconfirm

git clone https://aur.archlinux.org/yay-bin && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin

sudo ln -snf ~/repos/wayland-dotfiles/dotconfig/* ~/.config/

# Nvidia related
yay -S linux-lts-headers nvidia-open-dkms hyprland-nvidia-git xdg-desktop-portal-hyprland-git libva-nvidia-driver-git waybar-hyprland-git

# Wayland specifics
yay -S wl-clipboard wf-recorder hyprpicker swaybg wlogout swaylock-effects 

# Some fonts to start with
yay -S ttf-ms-fonts ttf-apple-emoji ttf-google-sans ttf-jetbrains-mono-nerd

# General setup
yay -S dex easyeffects kitty neofetch polkit-gnome neovim dunst rofi pavucontrol grimblast-git playerctl sddm-git nwg-look-bin layan-gtk-theme-git lxappearance qt5ct qt6ct pamixer brave-bin webcord-git-screenshare ntfs3-dkms ark steam-native-runtime obs-studio

sudo mkdir /mnt/4tb
sudo mkdir /mnt/2tb
sudo cp -f fstab /etc/ 
sudo systemctl daemon-reload
sudo mount -a

sudo cp -f environment /etc/
sudo cp -f mkinitcpio.conf /etc/
sudo cp -f nvidia.conf /etc/modprobe.d/nvidia.conf

mkdir ~/.config/autostart
sudo cp personal/easyeffects-service.desktop ~/.config/autostart

sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

sudo ln -snf /mnt/2tb/Downloads ~/
sudo ln -snf /mnt/4tb/OneDrive/Documents ~/
sudo ln -snf /mnt/4tb/OneDrive/Pictures ~/

read -p "Would you like to enable sddm? (y/N)?" SDDM
if [ "$SDDM" = "y" || "" = "Y" ]; then
  sudo systemctl enable sddm;
else
  echo "Oh well";
fi

echo "Rebooting..."
sleep(2)
reboot
