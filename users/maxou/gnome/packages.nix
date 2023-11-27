{ pkgs, lib, ...}: {
  home.packages = with pkgs; [
    libreoffice

    gnome.dconf-editor
    dconf2nix

    gnome-firmware
    gnome.gedit

    gnomeExtensions.pop-shell
    gnomeExtensions.caffeine
    gnomeExtensions.sound-output-device-chooser
    # gnomeExtensions.dash-to-dock
    gnomeExtensions.dash2dock-lite
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection
    gnomeExtensions.multi-monitor-swap

    # TODO pick one
    gnomeExtensions.drop-down-terminal
    gnomeExtensions.ddterm
  ];

  # @TODO  ~/.config/pop-shell/config.json
}
