{ pkgs, lib, ...}: {
  imports = [
    ./dconf.nix
    ./packages.nix
  ];
}
