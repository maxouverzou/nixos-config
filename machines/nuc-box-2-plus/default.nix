{ config, pkgs, inputs, home-manager, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../profiles/desktop.nix
      ../../profiles/development.nix
      ../../profiles/media-server.nix
      ../../profiles/vscode-server.nix
      ../../profiles/gaming.nix
      ../../users/maxou
      ../../users/milou
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
    hostName = "kiosk";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };

  system.stateVersion = "23.05";
}
