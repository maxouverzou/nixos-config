{pkgs, ...}: {
  systemd.services.iot-router = {
    enable = false;
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.linux-router}/bin/lnxrouter -n --ap wlan0 IntranetOfThings -p MyPassword";
    };
  };
}
