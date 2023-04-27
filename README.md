# 🚀 My Hyprland Dotfiles 
![image](https://user-images.githubusercontent.com/45101400/234958778-54532547-b1e1-47d8-9afa-1516900bcc00.png)

## 👨‍💻 Auto installer (Arch-based distros)
### To install automatically run:

```
cd ~/repos/wayland-dotfiles
chmod +x install-on-arch.sh
sudo ./install-on-arch.sh
```

##### * IMPORTANT: run the script from ~/repos/wayland-dotfiles! (The script uses symbolic links for EVERY config)
##### * Note: I'm using the LTS kernel for a bit more stability on Arch
##### * Note 2: If you're using NVIDIA & systemd-boot, you'll need to manually add the kernel parameters for Hyprland to work.

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
yay -S nvidia-dkms nvidia-utils hyprland-nvidia-git libva-nvidia-driver-git
```

* For others:
```
yay -S linux-lts linux-lts-headers hyprland-git
```

#### Complete setup packages

```
yay -S xdg-desktop-portal-hyprland-git waybar-hyprland-git \
networkmanager network-manager-applet bluez bluez-utils blueman \
sddm qt5-wayland qt6-wayland qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects \
dunst rofi-lbonn-wayland-git swww swaylock-effects-git wlogout grim slurp swappy \
wl-clipboard wf-recorder hyprpicker swaybg ttf-ms-fonts ttf-apple-emoji ttf-google-sans ttf-jetbrains-mono-nerd dex \
polkit-kde-agent pacman-contrib imagemagick pavucontrol pamixer python-requests noto-fonts-emoji \
nwg-look kvantum qt5ct qt6ct \
brave-bin kitty neofetch dolphin vscodium neovim ark kde-cli-tools
```

### TODO:
- [ ] Clipboard tool
- [ ] Full screen capture (screensharing)
