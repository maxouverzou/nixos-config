{
  virtualisation.oci-containers = {
    backend = "podman";
    containers.homebridge = {
      autoStart = false;
      volumes = [ "/mnt/config/home-bridge:/homebridge" ];
      environment.TZ = "America/Los_Angeles";
      image = "docker.io/homebridge/homebridge:latest";
      extraOptions = [
        "--pull=newer"
        "--network=host"
      ];
    };
  };

  systemd.services.podman-homebridge.after = [ "systemd-timesyncd.service" ];
}

/**
  TODO stop using --network=host
  - https://www.devwithimagination.com/2020/02/02/running-homebridge-on-docker-without-host-network-mode/
 */
