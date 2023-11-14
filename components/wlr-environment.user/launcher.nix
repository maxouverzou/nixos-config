{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi-pulse-select # sink / source
    rofimoji
    rofi-bluetooth
    wdisplays
  ];

  xdg.desktopEntries = {
    rofi-bluetooth = {
      name = "rofi-bluetooth";
      exec = "rofi-bluetooth";
      categories = [ "System" ];
    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "solarized";
    terminal = "kitty";
  };

}
