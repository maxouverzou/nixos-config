{ pkgs, ... }: {
  imports =
    [
      ../../profiles/desktop.nix
      ../../profiles/development.nix
      ../../profiles/laptop.nix
      ../../profiles/gaming.nix

      ../../components/syncthing.system.nix
      ../../users/maxou
    ];

  networking = {
    hostName = "glados";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };
  services.openssh.enable = true;
}

