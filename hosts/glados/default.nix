{ self
, pkgs
, ...
}: {
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

  virtualisation.libvirtd = {
    enable = true;
  };

  /* remove these once the migration to btrfs is done */
  boot.supportedFilesystems = [ "btrfs" "ext4" ];
  boot.initrd.kernelModules = [ "btrfs" ];
  environment.systemPackages = [
    pkgs.btrfs-progs
  ];

  networking = {
    hostName = "glados";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };
  services.openssh.enable = true;
}

