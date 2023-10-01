{ config, pkgs, lib, inputs, home-manager, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  sdImage.compressImage = false;

  environment.systemPackages = with pkgs; [
    libraspberrypi
  ];

  hardware.enableRedistributableFirmware = true;

  fileSystems."/".options = [ "noatime" "discard" ];

  networking = {
    interfaces.wlan0 = {
      useDHCP = true;
    };
    wireless = {
      enable = true;
      interfaces = [ "wlan0" ];
      networks."3nebs".psk = "mypassword";
    };
  };
  services.openssh.enable = true;

  users.users.nixos = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ../../resources/users/maxou/kiosk.pub)
    ];
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}
