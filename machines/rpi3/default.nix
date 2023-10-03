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
    # from https://github.com/NixOS/nixpkgs/blob/df1882cd877a510025be5156d29a0794a762341d/nixos/modules/profiles/installation-device.nix
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    # Allow the graphical user to login without password
    initialHashedPassword = "";

    openssh.authorizedKeys.keys = [
      (builtins.readFile ../../resources/users/maxou/kiosk.pub)
    ];
  };

  # documentation.enable = false;

  documentation = {
    enable = false;
    man.enable = false;
    info.enable = false;
    doc.enable = false;
    nixos.enable = false;
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}
