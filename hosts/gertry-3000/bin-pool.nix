{
  environment.systemPackages = with pkgs; [
    nfs-utils
    encfs
  ];

  services.rpcbind.enable = true;
  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = "noatime,nolock";
    };
    what = "nas.local:/volume1/bin-pool";
    where = "/mnt/bin-pool";
  }];

  systemd.automounts = [{
    after = [ "network.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/bin-pool";
  }];
}