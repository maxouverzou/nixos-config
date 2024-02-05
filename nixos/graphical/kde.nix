{ config, pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = lib.mkDefault true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    oxygen
  ];

  # install packages
  environment.systemPackages = with pkgs; [
    libsForQt5.bismuth
    libsForQt5.kate
    libsForQt5.kdeconnect-kde
    libsForQt5.plasma-applet-caffeine-plus
    libsForQt5.plasma-browser-integration
    libsForQt5.plasma-thunderbolt
    libsForQt5.yakuake

    gnome-firmware # TODO find kde alternative (that is not discover)
    partition-manager
    qbittorrent
    syncthingtray
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