{ config, pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = lib.mkDefault true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.defaultSession = "plasma";

  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  environment.plasma6.excludePackages = with pkgs.libsForQt5; [
    oxygen
  ];

  # install packages
  environment.systemPackages =
    (with pkgs.libsForQt5; [
      polonium
      kate
      kdeconnect-kde
      plasma-applet-caffeine-plus
      plasma-browser-integration
      plasma-thunderbolt
      yakuake
      ktorrent
    ]) ++ (with pkgs; [
      gnome-firmware # TODO find kde alternative (that is not discover)
      partition-manager
      syncthingtray
      yubikey-manager-qt
    ]);

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
