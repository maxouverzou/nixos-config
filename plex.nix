{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  services.plex = {
    enable = true;
    openFirewall = true;
  };

  networking.extraHosts =
    ''
      192.168.1.250 nas
    '';

  services.rpcbind.enable = true;
  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = "noatime,nolock";
    };
    what = "nas:/volume1/public";
    where = "/mnt/nas_public";
  }];

  systemd.automounts = [{
    wantedBy = ["multi-user.target" "plex.service"];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/nas_public";
  }];

  powerManagement.enable = false;
  
  # disable gdm auto-suspend
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

}
