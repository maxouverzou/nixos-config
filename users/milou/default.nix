{ config, inputs, pkgs, lib, ...}:
let
  inherit (lib) mkDefault optional optionals;
in
rec {
  users.extraUsers.milou = {
    isNormalUser = true;
    initialPassword = "password";
    uid = 1001;
    extraGroups = [
      "wheel"
      "audio"
      "video"
    ]
      ++ (optional config.networking.networkmanager.enable "networkmanager")
      ++ (optional config.virtualisation.docker.enable "docker")
      ++ (optional config.virtualisation.kvmgt.enable "kvm")
      ++ (optional config.virtualisation.libvirtd.enable "libvirtd")
      ++ (optional config.virtualisation.lxd.enable "lxd")
      ++ (optional config.virtualisation.virtualbox.host.enable "vboxusers") 
      # ++ (optional programs.wireshark.enable "wireshark")
      ++ (optional (config.hardware.hackrf.enable || config.hardware.rtl-sdr.enable) "plugdev")
    ;
  };

  home-manager.users.milou = {
    imports = [./home.nix];
  };
}
