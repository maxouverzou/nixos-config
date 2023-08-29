{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
	gnomeExtensions.pop-shell
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-text-editor
   ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    gnome-calculator
    yelp # help viewer
    gnome-maps
    gnome-weather
    gnome-contacts
    simple-scan
  ]);


  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.xserver.desktopManager.gnome.enable = true;
}
