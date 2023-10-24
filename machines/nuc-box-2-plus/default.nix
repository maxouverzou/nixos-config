{ config, pkgs, inputs, ... }: let
  nixos-hardware = inputs.nixos-hardware.nixosModules;
in {
  imports =
    [
      nixos-hardware.common-cpu-intel
      nixos-hardware.common-pc
      nixos-hardware.common-pc-ssd
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # no access time and continuous TRIM for SSD
  fileSystems."/".options = [ "noatime" "discard" ];
  fileSystems."/boot".options = [ "noatime" "discard" ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.bluetooth.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.05";
}
