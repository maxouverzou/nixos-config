{ ... }: {
  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    latitude = 47;
    longitude = 122;
  };
}
