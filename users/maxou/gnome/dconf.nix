# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
    };

    "org/gnome/Weather" = {
      locations = "[<(uint32 2, <('Lyon', 'LFLY', true, [(0.7979063621878385, 0.086393797973719322)], [(0.79848813278740571, 0.084648468721724976)])>)>, <(uint32 2, <('Bellingham', 'KBLI', true, [(0.85171097094259174, -2.1387119268011827)], [(0.85101474165067859, -2.1378228211736312)])>)>]";
    };

    "org/gnome/clocks" = {
      world-clocks = "[{'location': <(uint32 2, <('Paris', 'LFPB', true, [(0.85462956287765413, 0.042760566673861078)], [(0.8528842336256599, 0.040724343395436846)])>)>}]";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-size = 24;
      cursor-theme = "Adwaita";
      edge-tiling = true;
      enable-animations = true;
      enable-hot-corners = false;
      gtk-theme = "Adwaita-dark";
      icon-theme = "Adwaita";
      show-battery-percentage = false;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [ "org.gnome.Software.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      move-to-workspace-5 = [ "<Shift><Super>5" ];
      move-to-workspace-6 = [ "<Shift><Super>6" ];
      move-to-workspace-7 = [ "<Shift><Super>7" ];
      move-to-workspace-8 = [ "<Shift><Super>8" ];
      move-to-workspace-9 = [ "<Shift><Super>9" ];
      move-to-workspace-10 = [ "<Shift><Super>0" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      switch-to-workspace-7 = [ "<Super>7" ];
      switch-to-workspace-8 = [ "<Super>8" ];
      switch-to-workspace-9 = [ "<Super>9" ];
      switch-to-workspace-10 = [ "<Super>0" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 10;
    };

    "org/gnome/gedit/preferences/editor" = {
      insert-spaces = true;
      scheme = "solarized-dark";
      tabs-size = mkUint32 4;
      use-default-font = true;
      wrap-last-split-mode = "word";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      edge-tiling = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = mkUint32 2481;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "Launch terminal";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [
        "places-menu@gnome-shell-extensions.gcampax.github.com"
        "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"
        "dash-to-dock@micxgx.gmail.com"
        "openweather-extension@jenslody.de"
        "forge@jmmaranan.com"
      ];
      enabled-extensions = [
        "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
        "appindicatorsupport@rgcjonas.gmail.com"
        "just-perfection-desktop@just-perfection"
        "pop-shell@system76.com"
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
      ];
      favorite-apps = [ "firefox.desktop" "kitty.desktop" "org.gnome.Calendar.desktop" "org.gnome.Nautilus.desktop" "steam.desktop" "emacsclient.desktop" "codium.desktop" ];
    };

    "org/gnome/shell/extensions/appindicator" = {
      tray-pos = "right";
    };

    "org/gnome/shell/extensions/caffeine" = {
      duration-timer = 2;
      indicator-position-max = 2;
      show-indicator = "only-active";
      show-timer = true;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = true;
      activities-button = false;
      app-menu = true;
      app-menu-icon = true;
      app-menu-label = true;
      clock-menu = true;
      clock-menu-position = 1;
      keyboard-layout = true;
      panel-notification-icon = true;
      quick-settings = true;
      window-picker-icon = true;
    };

    "org/gnome/shell/extensions/pop-shell" = {
      active-hint = true;
      actve-hint = true;
      fullscreen-launcher = false;
      show-skip-taskbar = true;
      tile-by-default = true;
      stacking-with-mouse = false;
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      switch-to-application-10 = [];
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "[<(uint32 2, <('Lyon', 'LFLY', true, [(0.7979063621878385, 0.086393797973719322)], [(0.79848813278740571, 0.084648468721724976)])>)>, <(uint32 2, <('Bellingham', 'KBLI', true, [(0.85171097094259174, -2.1387119268011827)], [(0.85101474165067859, -2.1378228211736312)])>)>]";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "[<(uint32 2, <('Paris', 'LFPB', true, [(0.85462956287765413, 0.042760566673861078)], [(0.8528842336256599, 0.040724343395436846)])>)>]";
    };

  };
}
