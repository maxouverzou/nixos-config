{ pkgs, ... }: {
  imports =
    [
      # ../../profiles/desktop.nix
      # ../../profiles/development.nix
      # ../../profiles/laptop.nix
      # ../../components/syncthing.system.nix
    ];

  networking = {
    hostName = "wheatley";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };

  services.openssh.enable = true;

}

