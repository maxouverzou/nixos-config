{ pkgs, config, ... }: {

  sops.templates."litellm.env" = {
    content = ''
      ANTHROPIC_API_KEY=${config.sops.placeholder.ANTHROPIC_API_KEY}
      OPENAI_API_KEY=${config.sops.placeholder.OPENAI_API_KEY}
    '';
  };

  virtualisation.oci-containers = {
    backend = "podman";
    containers.litellm = {
      serviceName = "litellm";
      autoStart = false;
      volumes = [ "${pkgs.litellm-config}/config.yaml:/app/config.yaml" ];
      environment.TZ = "America/Los_Angeles";
      ports = [ "4000:4000/tcp" ];
      image = "ghcr.io/berriai/litellm:main-latest";
      environmentFiles = [ "${config.sops.templates."litellm.env".path}" ];
      cmd = ["--config" "/app/config.yaml"];
    };
  };

  systemd.services.litellm.before = [ "open-webui.service" ];
}
