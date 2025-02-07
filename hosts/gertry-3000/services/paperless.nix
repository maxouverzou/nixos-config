{ config, ...}: {
  sops.secrets = {
    PAPERLESS_ADMIN_PASSWORD = {
      mode = "0400";
      owner = config.services.paperless.user;
    };
  };

  services.paperless = {
    enable = true;
    address = "0.0.0.0";
    passwordFile = config.sops.secrets.PAPERLESS_ADMIN_PASSWORD.path;
  };
}
