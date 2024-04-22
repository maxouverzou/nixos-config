{
  imports = [
    ../../../nixos/nas/gertry-config.nix
  ];

  virtualisation.oci-containers = {
    backend = "podman";
    containers.homeassistant = {
      autoStart = true;
      volumes = [
        "/mnt/config/home-assistant:/config"
        "/var/run/dbus/:/var/run/dbus/"
      ];

      environment.TZ = "America/Los_Angeles";
      image = "ghcr.io/home-assistant/home-assistant:stable";
      extraOptions = [
        "--pull=newer"
        "--network=host"
        # "--device=/dev/ttyACM0:/dev/ttyACM0"
      ];
    };
  };
  systemd.services.podman-homeassistant.after = [ "systemd-timesyncd.service" ];
  systemd.services.podman-homeassistant.wants = [ "mnt-config.automount" ];
}

/**
  TODO stop using --network=host
  - https://community.home-assistant.io/t/is-there-an-official-list-of-ports/395592/5
 */
