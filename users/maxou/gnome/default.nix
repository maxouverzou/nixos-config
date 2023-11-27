{ pkgs, lib, ...}: {
  imports = [
    ./dconf.nix
    ./packages.nix
    ../../../components/theme-adwaita.user.nix
  ];
}
