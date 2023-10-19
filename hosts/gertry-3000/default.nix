{ pkgs, modulesPath, ... }: let
  container-services = [
    "podman-homebridge.service"
    # "podman-homeassistant.service"
    "podman-pihole.service"
  ];
in {
  imports =
    [
      (modulesPath + "/profiles/headless.nix")
      (modulesPath + "/profiles/minimal.nix")
      ../../profiles/common.nix
      ../../components/avahi-server.system.nix
      # ../../components/plex.system.nix

      #./containers/home-assistant.nix
      #./containers/home-bridge.nix
      #./containers/pihole.nix
      #./services/home-assistant.nix
      ./services/iot-router.nix
      ./services/tailscale.nix

      ../../users/maxou
    ];

  networking = {
    hostName = "gertry";
    domain = "local";

    firewall.enable = false;
  };

  services.openssh = {
    enable = true;
    # TODO: remove this once setup is complete
    settings.PasswordAuthentication = true;
  };

  # TODO: remove this once setup is complete
  networking.networkmanager.enable = true;

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

  # ensure timesyncd is up before starting container services
  # inacurate date/time may fail ssl cert check when pulling images
  
  systemd.services.systemd-timesyncd.before = container-services;
}

