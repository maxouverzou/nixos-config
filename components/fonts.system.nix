{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;

    fonts = with pkgs; [
      noto-fonts-emoji

      fira-code
      fira-mono
      fira
      liberation_ttf # wine compa fonts
      libertine

      powerline # duh
      font-awesome # waybar, etc
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        monospace = [ "Fira Mono" ];
        serif = [ "Linux Libertine" ];
        sansSerif = [ "Fira Sans" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
