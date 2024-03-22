{ self, ... }: {
  imports =
    [
      ../../nixos/dns-over-https.nix
      ../../nixos/graphical/kde.nix
      ../../nixos/graphical/gaming.nix
      ../../nixos/tailscale.nix
      ../../nixos/nas/media.nix
      # ../../profiles/development.nix
      # ../../profiles/laptop.nix
      # ../../components/syncthing.system.nix
    ];

  networking = {
    hostName = "glados";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };
  services.openssh.enable = true;
}

