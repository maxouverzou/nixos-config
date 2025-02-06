{
  virtualisation.oci-containers = {
    backend = "podman";
    containers.litellm = {
      autoStart = false;
      volumes = [ "${pkgs.litellm-config}/config.yaml:/app/config.yaml" ];
      environment.TZ = "America/Los_Angeles";
      ports = [ "4000:4000/tcp" ];
      image = "ghcr.io/berriai/litellm:main-latest";
      environmentFiles = [ "/opt/litellm/.env" ]; # TODO could this be a secret?
      cmd = ["--config" "/app/config.yaml"];
    };
  };

  systemd.services.podman-homebridge.before = [ "open-webui.service" ];
}
