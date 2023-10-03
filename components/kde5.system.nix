{ config, pkgs, lib, ... }:
{
  services.xserver.desktopManager.plasma5.enable = lib.mkDefault true;
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    print-manager
  ];

  # install packages
  environment.systemPackages = with pkgs; [
    # TODO: move most of these
    yt-dlp
    meld
    vlc
    cider
    # vscode
    kitty
    alacritty
    libsForQt5.kdeconnect-kde
    libsForQt5.bismuth

    libsForQt5.korganizer
    libsForQt5.kalendar

    plasma5Packages.plasma-thunderbolt
    libreoffice-qt
    # replace with aspell?
    hunspell
    hunspellDicts.en_US

    okular
    konversation

    # kexi: insecure
  ];

  networking.firewall = {
    enable = lib.mkDefault true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
}
