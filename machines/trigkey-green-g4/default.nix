{ config
, pkgs
, flake
, ...
}:
let
  nixos-hardware = flake.inputs.nixos-hardware.nixosModules;
in
{
  imports =
    [
      nixos-hardware.common-cpu-intel
      # nixos-hardware.common-pc # pulls libinput
      nixos-hardware.common-pc-ssd
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # no access time and continuous TRIM for SSD
  fileSystems."/".options = [ "noatime" "discard" ];
  fileSystems."/boot".options = [ "noatime" "discard" ];

  networking.wireless.enable = true;

  hardware.cpu.intel.updateMicrocode = true;
  hardware.bluetooth.enable = true;

  system.stateVersion = "23.05";
}
