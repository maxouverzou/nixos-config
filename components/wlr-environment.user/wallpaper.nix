{
  pkgs
, ... }:
let
  socket = "~/.mpv.sock";
  directory = "~/Videos";

in {
  home.packages = [ pkgs.mpvpaper ];

  systemd.user.services.mpv-paper = {
    Unit = {
      Description = "MpvPaper";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "mpvpaper --mpv-options \"no audio loop-playlist shuffle panscan=1 input-ipc-server=${socket}\" ${directory}";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  home.file.".config/mpvpaper/pauselist".text = ''
      steam
      firefox
      swaylock
  '';

  home.file.".config/mpvpaper/stoplist".text = ''

  '';


}
