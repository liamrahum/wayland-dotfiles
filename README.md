# 🚀 My Personal Hyprland Dotfiles 

## 👨‍💻 Auto installer
### To install automatically run:

```
cd ~/repos/wayland-dotfiles
chmod +x install-on-arch.sh
sudo ./install-on-arch.sh
```
##### * Note: I'm using the LTS kernel for a bit more stability on Arch
## ⚒️ Manual install:
#### To install yay (the AUR helper):

```
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin
```

#### Necessary packages:

* For NVIDIA GPUs: 
```
yay -S linux-lts linux-lts-headers nvidia-open-dkms hyprland-nvidia-git 
```

* For others:
```
yay -S linux-lts linux-lts-headers hyprland-git
```

#### Complete setup packages

```
yay -S xdg-desktop-portal-hyprland-git waybar-hyprland-git wl-clipboard wf-recorder hyprpicker swaybg wlogout swaylock-effects ttf-ms-fonts ttf-apple-emoji ttf-google-sans ttf-jetbrains-mono-nerd dex kitty neofetch polkit-gnome neovim dunst rofi pavucontrol grimblast-git playerctl sddm-git nwg-look-bin lxappearance qt5ct qt6ct pamixer
```

#### Some specifics
```
yay -S layan-gtk-theme-git brave-bin webcord-git-screenshare dolphin ntfs3-dkms
```
