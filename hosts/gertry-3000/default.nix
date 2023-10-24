{ pkgs, modulesPath, ... }: let
  container-services = [
    "podman-homebridge.service"
    "podman-homeassistant.service"
    "podman-pihole.service"
  ];
in {
  imports =
    [
      (modulesPath + "/profiles/headless.nix")
      (modulesPath + "/profiles/minimal.nix")
      ../../profiles/common.nix
      ../../components/avahi-server.system.nix
      ../../components/plex.system.nix
      ../../components/unbound-adblock.system.nix

      ./containers/home-assistant.nix
      #./containers/home-bridge.nix
      #./containers/pihole.nix
      #./services/home-assistant.nix
      #./services/iot-router.nix
      ./services/tailscale.nix

      ../../users/maxou
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

  # container services config persistance
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  services.rpcbind.enable = true;
  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = "noatime,nolock";
    };
    what = "nas.local:/volume1/gertry";
    where = "/mnt/config";
  }];

  systemd.automounts = [{
    after = [ "network.target" ];
    before = container-services;
    wantedBy = container-services;
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/config";
  }];
}
