{ config, pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
rec {
  users.extraUsers.maxou = {
    isNormalUser = true;
    # TODO: optional if docker.enable ++ docker
    extraGroups = mkDefault [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "docker"
      "libvirtd"
      "plugdev"
      "adbusers"
    ];
  };

  home-manager.users.maxou = {
    imports = [./home.nix];
  };
}
