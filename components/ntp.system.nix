{ config, lib, ... }:

{
  services.ntp.enable = false;

  services.timesyncd = {
    enable = lib.mkDefault true;
    servers = [
      "0.us.pool.ntp.org"
      "1.us.pool.ntp.org"
      "2.us.pool.ntp.org"
      "3.us.pool.ntp.org"
    ];
  };
}
