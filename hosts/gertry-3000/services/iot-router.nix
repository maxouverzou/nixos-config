{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    hostapd
  ];

  # TODO: find usable wifi dongle; nl80211 is not compatible with hostapd
  systemd.services.iot-router = {
    enable = false;
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.linux-router}/bin/lnxrouter -n --ap wlp2s0 IntranetOfThings -p MyPassword";
    };
  };
}
