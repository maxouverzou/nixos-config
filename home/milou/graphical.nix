{ pkgs, ... }:
{
  home.packages = with pkgs; [
    azuredatastudio
  ];
}
