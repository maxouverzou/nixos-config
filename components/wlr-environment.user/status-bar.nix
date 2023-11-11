{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        #output = [
        #  "eDP-1"
        #  "HDMI-A-1"
        #];
        modules-left = [
          "hyprland/workspaces"
          "wlr/workspaces"
          "hyprland/submap"
          "custom/media"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "keyboard-state"
          "hyprland/language"
          "battery"
          "battery#bat2"
          "clock"
          "tray"
        ];
        "hyprland/workspaces" = {
          # disable-scroll = true;
          all-outputs = true;
        };
        "wlr/workspaces" = {
          all-outputs = true;
        };
      };
    };
  };
}
