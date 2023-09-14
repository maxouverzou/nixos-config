```
# flake test build
nixos-rebuild build --flake .#

# flake apply
nixos-rebuild switch --flake .#



# TODO?
zramSwap.enable = true;
boot.loader.systemd-boot.memtest86.enable = true;
systemd.ctrlAltDelUnit = "poweroff.target";
services.irqbalance.enable = true;
environment.localBinInPath = true;

services.fwupd.enable = true;
hardware.enableAllFirmware vs hardware.enableRedistributableFirmware

# Apps
darktable
sqlitebrowser
kitty
```