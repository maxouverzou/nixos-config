{ config, lib, pkgs, ... }:

{
  imports = [
    ../../profiles/desktop.nix
    ../../profiles/development.nix
    ../../profiles/vscode-server.nix
    ../../profiles/gaming.nix
    ../../users/maxou
    ../../users/milou
  ];

  networking = {
    hostName = "kiosk";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };
}
