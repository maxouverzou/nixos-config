{config, lib, pkgs, ...}:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  # for PlayStation 4 controllers support over Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.package = pkgs.bluezFull;

  environment.systemPackages = with pkgs; [
	  bottles
    discord
  ];

}