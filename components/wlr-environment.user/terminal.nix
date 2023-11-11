{ pkgs, ... }: {
  home.packages = with pkgs; [
    xdg-utils
  ];

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

   programs.kitty = {
    enable = true;
    theme = "Solarized Dark";
    extraConfig = ''
      enable_audio_bell no
    '';
  };
}
