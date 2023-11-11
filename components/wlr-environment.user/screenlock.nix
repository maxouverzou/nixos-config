{ pkgs, ... }: {
  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    timeouts = [
      {
        timeout = 300;
        command ="${pkgs.swaylock-effects}/bin/swaylock --grace 10";
      }
    ];
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      fade-in = "2";
      screenshots = true;
      effect-pixelate = "10";
      effect-greyscale = true;
    };
  };
}
