```
# update
sudo nix-channel --update

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
kitty

https://github.com/CrazedProgrammer/nix/blob/master/dotfiles/bin/record

grim slurp wf-recorder wl-clipboard
nix-du
swayosd

greetd.tuigreet

overlay mgmt: https://github.com/CrazedProgrammer/nix/blob/41d28a72efe277404d38a821fcf2211ab0f08f66/modules/home/default.nix#L14

https://github.com/hyprland-community/awesome-hyprland

https://www.reddit.com/r/NixOS/comments/fsummx/how_to_list_all_installed_packages_on_nixos/
delete ~/.mozilla.bak
```