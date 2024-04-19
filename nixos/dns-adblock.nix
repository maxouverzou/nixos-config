{ config, lib, pkgs, ... }:

{
  services.resolved.enable = false;

  services.unbound = {
    enable = true;
    settings = {
      server = {
        include = [
          "${pkgs.unbound-blocklist-stevenblack}"
        ];
        interface = [ "0.0.0.0" ];
        access-control = [
          "127.0.0.0/8 allow"
          "192.168.1.0/24 allow"
        ];
      };
      forward-zone = [
        {
          name = ".";
          forward-addr = [
            "1.1.1.1@853#cloudflare-dns.com"
            "1.0.0.1@853#cloudflare-dns.com"
          ];
          forward-tls-upstream = "yes";
        }
      ];
    };
  };
}
