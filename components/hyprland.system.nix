{pkgs, ...}: {
  # https://github.com/NixOS/nixpkgs/issues/143365
  security.pam.services.swaylock = { };

  services.geoclue2.enable = true;

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
}
