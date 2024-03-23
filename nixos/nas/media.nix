{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];
  services.rpcbind.enable = true;

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = "noatime,nolock";
    };
    what = "nas.local:/volume1/public/Media";
    where = "/mnt/media";
  }];

  systemd.automounts = [{
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/media";
  }];
}
