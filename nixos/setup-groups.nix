{ lib, flake, config, ... }:
with lib;
let
  defaultGroups = [ "wheel" "dialout" "tty" ];
  addExtraGroupsToUsers = g: listToAttrs (map
    (username: {
      name = username;
      value = {
        extraGroups = g;
      };
    })
    config.activeUsers);
in
rec {
  users.users = addExtraGroupsToUsers (defaultGroups
    ++ (optionals config.services.xserver.enable [ "video" "input" ])
    ++ (optional (config.services.pipewire.enable || config.hardware.pulseaudio.enable) "audio")
    ++ (optional (config.hardware.hackrf.enable || config.hardware.rtl-sdr.enable) "plugdev")
    ++ (optional config.networking.networkmanager.enable "networkmanager")
    ++ (optional config.virtualisation.docker.enable "docker")
    ++ (optional config.virtualisation.kvmgt.enable "kvm")
    ++ (optional config.virtualisation.libvirtd.enable "libvirtd")
    ++ (optional config.virtualisation.lxd.enable "lxd")
    ++ (optional config.virtualisation.podman.enable "podman")
    ++ (optional config.virtualisation.virtualbox.host.enable "vboxusers")
    ++ (optional config.programs.wireshark.enable "wireshark"));
}
