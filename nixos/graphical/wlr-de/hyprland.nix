{ pkgs, config, ... }: {
  # https://github.com/NixOS/nixpkgs/issues/143365
  security.pam.services.swaylock = { };

  services.geoclue2.enable = true;

  services.blueman.enable = config.hardware.bluetooth.enable;

  xdg.portal.extraPortals = [
    # pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-kde
    pkgs.xdg-desktop-portal-hyprland
  ];

  hardware.opengl.enable = true;

  programs.dconf.enable = true; # to configure gtk theme

  services.udisks2.enable = true;
}
