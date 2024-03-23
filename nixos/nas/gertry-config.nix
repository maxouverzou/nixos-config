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
    what = "nas.local:/volume1/gertry";
    where = "/mnt/config";
  }];

  systemd.automounts = [{
    after = [ "network.target" ];
    before = container-services;
    wantedBy = container-services;
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/config";
  }];
}
