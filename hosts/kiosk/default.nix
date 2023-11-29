{ self, config, lib, pkgs, ... }:
let
  test = config.people.activeUsers;
in
{
  imports = [
    ../../nixos/graphical/kde.nix
    # ../../profiles/development.nix
    # ../../profiles/vscode-server.nix
  ];

  networking = {
    hostName = "kiosk";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };
}
