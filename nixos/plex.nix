{ config, pkgs, lib, ... }:
{
  imports = [
    ./nas/public.nix
  ];

  services.plex = {
    enable = true;
    openFirewall = true;
  };

  powerManagement.enable = false;

  # disable gdm auto-suspend
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

}
