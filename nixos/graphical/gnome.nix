{ pkgs, lib, ... }: {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = lib.mkDefault true;
  services.xserver.desktopManager.gnome.enable = true;
}
