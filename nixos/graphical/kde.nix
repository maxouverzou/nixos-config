{ config, pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm = {
    enable = lib.mkDefault true;
    wayland.enable = lib.mkDefault true;
    settings = lib.mkIf (builtins.length config.activeUsers == 1) {
      Autologin = {
        Session = "plasma.desktop";
        User = builtins.elemAt config.activeUsers 0;
      };
    };
  };
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
    ]) ++ (with pkgs; [
      gnome-firmware # TODO find kde alternative (that is not discover)
      partition-manager
      qbittorrent
      syncthingtray
      yubikey-manager-qt
    ]) ++ (lib.optional config.virtualisation.libvirtd.enable pkgs.virt-manager);

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
