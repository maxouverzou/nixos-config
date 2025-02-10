{ pkgs, modulesPath, ... }: {
  imports =
    [
      (modulesPath + "/profiles/headless.nix")
      # (modulesPath + "/profiles/minimal.nix") # TODO pulls gtk3/xorg

      ../../nixos/plex.nix
      ../../nixos/vscode-server.nix

      ./containers/litellm.nix
      ./services/tailscale.nix
      ./services/open-webui.nix
      ./services/paperless.nix
    ];

  # https://myme.no/posts/2021-11-25-nixos-home-assistant.html
  networking = {
    hostName = "gertry";
    domain = "local";

    firewall.enable = false;

    nameservers = [
      "1.1.1.1"
      "2606:4700:4700::1111"
      "1.0.0.1"
      "2606:4700:4700::1001"
    ];

    bridges.br0.interfaces = [ "enp1s0" ];
    interfaces.br0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.2";
        prefixLength = 24;
      }];
    };

    defaultGateway = {
      address = "192.168.1.1";
      interface = "br0";
    };
  };

  services.openssh = {
    enable = true;
    # TODO: remove this once setup is complete
    settings.PasswordAuthentication = true;
  };

  virtualisation.libvirtd.enable = true;
}
