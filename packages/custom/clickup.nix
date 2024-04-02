{ pkgs, appimageTools, fetchurl, ... }:

appimageTools.wrapType2 {
  name = "clickup";
  src = fetchurl {
    url = "https://desktop.clickup.com/linux";
    hash = "sha256-jAOYDX9j+ZTqWsSg0rEckKZnErgsIV6+CtUv3M3wNqM=";
  };
  extraPkgs = pkgs: with pkgs; [
    xorg.libxkbfile
  ];
}
