{ pkgs, lib, ...}: {
  home.packages = with pkgs; [
    libreoffice-qt
    libsForQt5.kate
    # libsForQt5.nota # broken
    libsForQt5.bismuth
    libsForQt5.plasma-browser-integration
    libsForQt5.yakuake

    gnome-firmware # libsForQt5.discover

    partition-manager
    qbittorrent
  ];
}
