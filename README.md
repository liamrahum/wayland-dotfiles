# 🚀 My Personal Hyprland Dotfiles 
![image](https://user-images.githubusercontent.com/45101400/233688723-13b4694d-e59b-4d26-bbf9-8aef4dec166f.png)
![image](https://user-images.githubusercontent.com/45101400/233689341-0326465f-f358-425e-9ac2-35c85792cbaf.png)

## 👨‍💻 Auto installer (Arch-based distros) <img src="https://user-images.githubusercontent.com/45101400/233601358-786e991a-698f-4753-a7c6-4280dd9c4fd3.png" width="25"/> 
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
yay -S layan-gtk-theme-git brave-bin webcord-git-screenshare dolphin
```
