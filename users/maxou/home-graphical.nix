{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {

  imports =
    [
      ./gnome.nix
      ../../components/applications.user.nix
      # ../../components/hyprland.user.nix
      ../../components/terminal.user.nix
      ../../components/vscode.user
      ../../components/firefox.user.nix
    ];

  programs.doom-emacs.emacsPackage = pkgs.emacs;

  home.packages = with pkgs; [
    # cantor

    openscad	
    qgis-ltr

    libreoffice
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-reforme1990
  ];

}
