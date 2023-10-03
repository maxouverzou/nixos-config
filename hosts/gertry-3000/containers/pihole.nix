{
  virtualisation.oci-containers = {
    backend = "podman";
    containers.pihole = {
      autoStart = false;
      volumes = [
        "/mnt/config/pihole-main:/etc/pihole"
        "/mnt/config/pihole-dnsmasq:/etc/dnsmasq.d"
      ];
      ports = [ "53:53/tcp" "53:53/udp" "80:80/tcp" ];
      environment = {
        TZ = "America/Los_Angeles";
        WEBPASSWORD = "mypassword";
        PIHOLE_DNS_ = "1.1.1.2;1.0.0.2";
      };
      image = "pihole/pihole:latest";
      extraOptions = [
        "--pull=newer"
        "--network=host"
      ];
    };
  };
  systemd.services.podman-pihole.after = [ "systemd-timesyncd.service" ];
}

/**
  TODO: stop using --network=host
 */