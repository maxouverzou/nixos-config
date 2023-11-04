{
  lib
, config
, pkgs
, inputs
, ...
}: let
  nixos-hardware = inputs.nixos-hardware.nixosModules;
in {
  imports =
    [
      nixos-hardware.common-cpu-amd
      nixos-hardware.common-cpu-amd-pstate
      nixos-hardware.common-gpu-amd
      nixos-hardware.common-pc-laptop
      nixos-hardware.common-pc-laptop-ssd
      ./hardware-configuration.nix
    ];

  services.tlp.enable = lib.mkForce false;
  services.fwupd.enable = true;

  /* TODO https://github.com/NixOS/nixos-hardware/pull/765 */
  services.power-profiles-daemon.enable = true;

  boot.extraModprobeConfig = ''
    options snd-hda-intel model=dell-headset-multi
  '';

  services.fprintd.enable = true;

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="8156", ATTR{power/autosuspend}="20"
  '';

  hardware.sensor.iio.enable = true;


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # no access time and continuous TRIM for SSD
  fileSystems."/".options = [ "noatime" "discard" ];
  fileSystems."/boot".options = [ "noatime" "discard" ];

  hardware.bluetooth.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.05";
}
