{ pkgs, ... }: {
  home.packages = [ pkgs.swaynotificationcenter ];

  systemd.user.services.swaynotificationcenter = {
    Unit = {
      Description = "Simple notification daemon with a GUI built for Sway";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.swaynotificationcenter}/bin/swaync";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

}
