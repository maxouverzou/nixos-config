```
# update
nix flake update

# flake test build
nixos-rebuild build --flake .#

# flake apply
nixos-rebuild switch --flake .#

# TODO?
services.fstrim.enable
zramSwap.enable = true;
boot.loader.systemd-boot.memtest86.enable = true;
systemd.ctrlAltDelUnit = "poweroff.target";
services.irqbalance.enable = true;
environment.localBinInPath = true;

services.fwupd.enable = true;
hardware.enableAllFirmware vs hardware.enableRedistributableFirmware

kanshi?

# Apps
darktable
sqlitebrowser

https://www.reddit.com/r/NixOS/comments/fsummx/how_to_list_all_installed_packages_on_nixos/

```
# https://github.com/hyprland-community/awesome-hyprland
- udisk
- configure waybar
  - hyprland/workaces: Unknown module
- wayland options
- osd
- hyprland layouts & shortcuts
  - https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.conf
  - https://github.com/alexjercan/hyprland.dotfiles/blob/master/hypr/hyprland.conf
- https://github.com/loserMcloser/waylogout
- https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway

# RPI imager
https://github.com/nix-community/nixos-generators

# Impermanence
- https://github.com/nix-community/impermanence
- https://news.ycombinator.com/item?id=37510297
- https://news.ycombinator.com/item?id=37218289
