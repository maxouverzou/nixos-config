{ pkgs, ...}: {
  home.packages = with pkgs; [
    gnomeExtensions.forge
    gnomeExtensions.caffeine
    gnomeExtensions.openweather
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      # favorite-apps = [];
      disable-user-extensions = false;
      enabled-extensions = [
        "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "forge@jmmaranan.com"
        "openweather-extension@jenslody.de"
        "caffeine@patapon.info"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      edge-tiling = true;
    };

    "org/gnome/setting-daemon/plugins/color" = {
      night-light-enabled = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-1 = ["<Shift><Super>1"];
      switch-to-workspace-1 = ["<Super>1"];

      move-to-workspace-2 = ["<Shift><Super>2"];
      switch-to-workspace-2 = ["<Super>2"];

      move-to-workspace-3 = ["<Shift><Super>3"];
      switch-to-workspace-3 = ["<Super>3"];

      move-to-workspace-4 = ["<Shift><Super>4"];
      switch-to-workspace-4 = ["<Super>4"];
    };


    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "Launch terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
    };

  };
}


# /org/gnome/shell/extensions/openweather/city
#  '48.630272500000004,-122.3441195625>Alger, Skagit County, Washington, United States>0'

#  /org/gnome/shell/extensions/dash-to-dock/hot-keys
#  false
