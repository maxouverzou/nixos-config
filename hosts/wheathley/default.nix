{ pkgs, ... }: {
  imports =
    [
      ../../profiles/desktop.nix
      ../../profiles/development.nix
      ../../profiles/laptop.nix
      ../../users/maxou
    ];

  networking = {
    hostName = "wheatley";
    domain = "local";

    firewall.enable = false;
    networkmanager.enable = true;
  };

  services.openssh.enable = true;

}

