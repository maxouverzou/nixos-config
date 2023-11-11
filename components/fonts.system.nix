{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;

    fonts = with pkgs; [
      # TODO filter?
      noto-fonts
      noto-fonts-emoji
      twitter-color-emoji
      twemoji-color-font

      # picked as best for code
      fira-code
      fira-mono
      fira
      # wine compat fonts
      liberation_ttf
      libertine
      open-sans

      oxygenfonts # ?

      source-code-pro # best for code, legacy

      powerline # duh
      font-awesome # waybar, etc
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        monospace = [ "Fira Mono" ];
        serif = [ "Linux Libertine" ];
        sansSerif = [ "Open Sans" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };
}
