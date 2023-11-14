{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./common.nix
      ../components/fonts.system.nix
      ../components/pipewire.system.nix
      ../components/tailscale.system.nix
      # ../components/greetd.system.nix
      # ../components/kde5.system.nix
      # ../components/hyprland.system.nix
      ../components/gnome.system.nix
    ];

  # boot splash instead of log messages
  boot.plymouth.enable = true;

  # enable flatpak support
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  services.hardware.bolt.enable = lib.mkDefault true;

  programs._1password.enable = true;
  programs._1password-gui.enable = true;
}
