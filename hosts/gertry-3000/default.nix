{ pkgs, modulesPath, ... }:
let
  container-services = [
    "podman-homebridge.service"
    "podman-homeassistant.service"
    "podman-pihole.service"
  ];
in
{
  imports =
    [
      (modulesPath + "/profiles/headless.nix")
      # (modulesPath + "/profiles/minimal.nix") # TODO pulls gtk3/xorg

      ../../nixos/plex.nix
      ../../nixos/nas/gertry-config.nix
      ../../nixos/vscode-server.nix

      ./bin-pool.nix
      ./containers/home-assistant.nix
      ./services/tailscale.nix
    ];

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

    interfaces.enp1s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.2";
        prefixLength = 24;
      }];
    };

    defaultGateway = {
      address = "192.168.1.1";
      interface = "enp1s0";
    };
  };

  services.openssh = {
    enable = true;
    # TODO: remove this once setup is complete
    settings.PasswordAuthentication = true;
  };

}
