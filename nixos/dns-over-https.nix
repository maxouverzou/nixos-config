{
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      server_names = [ "cloudflare" "cloudflare-ipv6" ];
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

  # archive.is blocks cloudflare dns: https://news.ycombinator.com/item?id=19828702
  networking.extraHosts =
    ''
      41.77.143.21 archive.is
      41.77.143.21 archive.ph
      41.77.143.21 archive.today
    '';
}
