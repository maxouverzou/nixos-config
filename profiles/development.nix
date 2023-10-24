{ config, pkgs, lib, ... }:

{
  # container virtualization
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    autoPrune.enable = true;
  };

  # hypervisor virtualization
  virtualisation.libvirtd.enable = true;

}
