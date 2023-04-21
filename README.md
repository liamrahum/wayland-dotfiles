# My Personal Hyprland Dotfiles
After trying window managers for a while,  it's time to try the best thing Wayland can offer.

## To install yay (the AUR helper):

```git clone https://aur.archlinux.org/yay-bin && cd yay-bin && makepkg -si```

## Necessary packages:

* For NVIDIA GPUs: ```yay -S linux-lts-headers nvidia-open-dkms hyprland-nvidia-git```

* For others: ```yay -S linux-lts-headers hyprland-git```

## Complete setup packages
```yay -S neofetch polkit-gnome neovim dunst rofi pamixer pavucontrol wl-clipboard wf-recorder-git swaybg grimblast-git ffmpegthumbnailer tumbler playerctl kitty waybar-hyprland wlogout swaylock-effects sddm-git nwg-look-bin tela-icon-theme```
