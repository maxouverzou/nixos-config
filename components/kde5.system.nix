{ config, pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = lib.mkDefault true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    oxygen
  ];

  # install packages
  environment.systemPackages = with pkgs; [
    plasma5Packages.plasma-thunderbolt
    libsForQt5.plasma-browser-integration
  ];

  networking.firewall = {
    # enable = lib.mkDefault true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
}
