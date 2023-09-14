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
```