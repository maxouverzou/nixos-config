{
  # TODO: refactor/update

  config = {
    # Associations
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        # Archive
        "application/zip" = "org.gnome.FileRoller.desktop";

        # Document
        "application/pdf" = "firefox.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";

        # Image
        "image/bmp" = "org.gnome.eog.desktop";
        "image/gif" = "org.gnome.eog.desktop";
        "image/heif" = "org.gnome.eog.desktop";
        "image/jpeg" = "org.gnome.eog.desktop";
        "image/png" = "org.gnome.eog.desktop";
        "image/svg+xml" = "org.gnome.eog.desktop";
        "image/tiff" = "org.gnome.eog.desktop";

        # Text
        "application/gpx+xml" = "codium.desktop";
        "application/json" = "codium.desktop";
        "application/rss+xml" = "codium.desktop";
        "application/x-shellscript" = "codium.desktop";
        "application/xml" = "codium.desktop";
        "message/rfc822" = "codium.desktop";
        "text/markdown" = "codium.desktop";
        "text/plain" = "codium.desktop";

        # Web
        "application/xhtml+xml" = "firefox.desktop";
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
      };
    };
    xdg.configFile."mimeapps.list".force = true; # Workaround for nix-community/home-manager#1213

    # Modules
    programs.jq.enable = true;

    programs.ssh = {
      enable = true;
      includes = [ "config.d/*" ];
      extraOptionOverrides = {
        GSSAPIAuthentication = "no";
        PreferredAuthentications = "publickey";
      };
    };
  };
}
