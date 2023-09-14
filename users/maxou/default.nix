{ config, inputs, pkgs, lib, ...}:
let
  inherit (lib) mkDefault optional optionals;
in
rec {
  # TODO: remove this
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  users.extraUsers.maxou = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "video"
    ]
      ++ (optional (config.hardware.hackrf.enable || config.hardware.rtl-sdr.enable) "plugdev")
      ++ (optional config.networking.networkmanager.enable "networkmanager")
      ++ (optional config.virtualisation.docker.enable "docker")
      ++ (optional config.virtualisation.kvmgt.enable "kvm")
      ++ (optional config.virtualisation.libvirtd.enable "libvirtd")
      ++ (optional config.virtualisation.lxd.enable "lxd")
      ++ (optional config.virtualisation.podman.enable "podman")
      ++ (optional config.virtualisation.virtualbox.host.enable "vboxusers") 
      ++ (optional programs.wireshark.enable "wireshark")
    ;
  };

  home-manager.users.maxou = {
    imports = [./home.nix];
  };
}
