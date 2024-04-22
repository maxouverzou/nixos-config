{ config, pkgs, lib, ... }:
{
  # TODO mount here, in read-only
  imports = [
    ./nas/public.nix
  ];

  services.plex = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.podman-homeassistant.wants = [ "mnt-nas_public.automount" ];

  powerManagement.enable = false;

  # disable gdm auto-suspend
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

}
