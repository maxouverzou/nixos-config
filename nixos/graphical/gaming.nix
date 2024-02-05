{ config, lib, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = lib.mkDefault true;
  };

  # for PlayStation 4 controllers support over Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.package = pkgs.bluez;

  environment.systemPackages = with pkgs; [
    bottles
    discord
    headsetcontrol
    # geekbench

    # nvtop
    # radeaontop
    #
    # glxinfo
    # vulkan tools
  ];

}
