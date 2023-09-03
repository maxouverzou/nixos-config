{ config, pkgs, lib, ...}:

{
  imports =
    [
      ../services/plex.nix
    ];
}