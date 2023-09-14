{ config, pkgs, lib, ... }:

{
  # container virtualization
  virtualisation.docker.enable = true;

  # hypervisor virtualization
  virtualisation.virtualbox.host.enable = true;

}
