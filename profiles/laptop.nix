{
  lib
, ...
}: {
  services.tlp = {
    enable = lib.mkDefault true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
    };
  };
  powerManagement.enable = true;

  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    # TODO: support more options
    # https://www.man7.org/linux/man-pages/man5/logind.conf.5.html
    extraConfig = ''
      HandlePowerKey=suspend-then-hibernate
      IdleAction=suspend-then-hibernate
      IdleActionSec=2m
    '';
  };

  boot.kernelParams = [ "mem_sleep_default=deep" ];

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=1h
    SuspendState=mem
  '';

}
