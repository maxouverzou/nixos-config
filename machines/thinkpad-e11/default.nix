{ config, pkgs, inputs, home-manager, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../profiles/desktop.nix
      ../../profiles/development.nix
      ../../profiles/laptop.nix
      ../../users/maxou
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # no access time and continuous TRIM for SSD
  fileSystems."/".options = [ "noatime" "discard" ];
  fileSystems."/boot".options = [ "noatime" "discard" ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.bluetooth.enable = true;

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "wheatley";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };

  system.stateVersion = "20.09";
}
