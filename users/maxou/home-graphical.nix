{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {

  imports =
    [
      ../../components/applications.user.nix
      # ../../components/hyprland.user.nix
      ../../components/terminal.user.nix
      ../../components/vscode.user
      ../../components/firefox.user.nix
    ]; # ++ (lib.optional config.services.xserver.desktopManager.gnome.enable ./gnome); # causes infinite recursion

  programs.doom-emacs.emacsPackage = pkgs.emacs;

  home.packages = with pkgs; [
    # cantor

    openscad	
    qgis-ltr
    yt-dlp
    meld
    vlc
    cider
    kitty

    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-reforme1990
  ];

}
