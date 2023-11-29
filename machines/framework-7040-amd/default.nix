{ lib
, config
, flake
, ...
}:
let
  nixos-hardware = flake.inputs.nixos-hardware.nixosModules;
in
{
  imports =
    [
      nixos-hardware.framework-13-7040-amd
      ./hardware-configuration.nix
    ];

  services.tlp.enable = lib.mkForce false;
  services.fwupd.enable = true;
  services.fprintd.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # no access time and continuous TRIM for SSD
  fileSystems."/".options = [ "noatime" "discard" ];
  fileSystems."/boot".options = [ "noatime" "discard" ];

  hardware.bluetooth.enable = true;

  system.stateVersion = "23.05";
}
