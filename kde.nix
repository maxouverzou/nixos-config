{ config, pkgs, ... }:
{
  programs.partition-manager.enable = true;

  environment.systemPackages = with pkgs; [
    libsForQt5.kalendar
    libsForQt5.kdeconnect-kde
    libsForQt5.bismuth    

    plasma5Packages.plasma-thunderbolt

    libreoffice-qt
    hunspell
    hunspellDicts.en_US

    libsForQt5.kdevelop
    cmake
    gnumake42
    gcc
  ];

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    print-manager
  ];

  services.hardware.bolt.enable = true;

  services.xserver.displayManager.gdm.enable = true;

  services.xserver.displayManager.sddm.enable = false;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

  networking.firewall = { 
    enable = true;
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };  

}
