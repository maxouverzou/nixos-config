{ pkgs
,...
}: {
  # fix for error: GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name ca.desrt.dconf was not provided by any .service files
  home.packages = [ pkgs.dconf ];

  home.pointerCursor = {
    gtk.enable = true;
    name = "breeze_cursors";
    package = pkgs.libsForQt5.breeze-gtk; # or -icons?
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.libsForQt5.breeze-gtk;
    };
    cursorTheme = {
      name = "breeze_cursors";
      package = pkgs.libsForQt5.breeze-gtk; # or -icons?
      size = 24;
    };
    font = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
      size = 10;
    };
    iconTheme = {
      name = "Breeze-dark";
      package = pkgs.libsForQt5.breeze-icons;
    };

    gtk2.extraConfig = ''
      gtk-enable-animations=1
      gtk-primary-button-warps-slider=0
      gtk-toolbar-style=3
      gtk-menu-images=1
      gtk-button-images=1
    '';
  };



  # TODO breeze libsForQt5.breeze-plymouth?

/*
  # TODO  definition for option `home-manager.users.maxou.qt.platformTheme' is not of type `null or one of "gtk", "gnome"'
  qt = {
    enable = true;
    platformTheme = "kde";
    #style = {
    #  name = "adwaita-dark";
    #  package = pkgs.adwaita-qt;
    #};
  };
*/
}
