{ config
, pkgs
, flake
, ...
}:
let
  nixos-hardware = flake.inputs.nixos-hardware.nixosModules;
in
{
  imports =
    [
      nixos-hardware.common-cpu-intel
      nixos-hardware.common-gpu-intel
      nixos-hardware.common-pc-laptop
      nixos-hardware.common-pc-laptop-ssd
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # no access time and continuous TRIM for SSD
  fileSystems."/".options = [ "noatime" "discard" ];
  fileSystems."/boot".options = [ "noatime" "discard" ];

  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024;
    }
  ];

  boot.resumeDevice = "/dev/disk/by-label/nixos"; # swapfile is on this drive
  # $ sudo filefrag -v /swapfile | awk '$1=="0:" {print substr($4, 1, length($4)-2)}'
  # 7456768
  boot.kernelParams = [ "resume_offset=7456768" ]; # for hibernation support

  # TODO nixos-hardware already includes this?
  hardware.cpu.intel.updateMicrocode = true;
  hardware.bluetooth.enable = true;

  system.stateVersion = "20.09";
}
