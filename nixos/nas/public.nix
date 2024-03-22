{ config, pkgs, lib, ... }: {
  # TODO: replace w/ media-readonly
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];
  services.rpcbind.enable = true;

  networking.extraHosts =
    ''
      192.168.1.250 nas
    '';

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = "noatime,nolock";
    };
    what = "nas:/volume1/public";
    where = "/mnt/nas_public";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" "plex.service" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/nas_public";
  }];
}
