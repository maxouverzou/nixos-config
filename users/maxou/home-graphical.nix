{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {

  imports =
    [
      ../../components/hyprland.user.nix
      ../../components/vscode.user
      ../../components/firefox.user.nix
    ];

  home.packages = with pkgs; [
    # cantor

    openscad	
    qgis-ltr

    libreoffice
    hunspell
    hunspell.en_EN
    hunspell.fr_FR
  ];

}
