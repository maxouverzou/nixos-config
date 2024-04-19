{ pkgs, ... }: {
  imports = [
    ../3d-printing.nix
    ../emacs-graphical.nix
    ../gis.nix
  ];

  home.packages = with pkgs; [
    cider
    ktailctl
    mpv
    vlc
    yt-dlp
    zoom-us
  ];

  home.file = {
    ".local/share/konsole/Dracula.colorscheme" = {
      source = "${pkgs.dracula-konsole}";
    };
  };

  services.gpg-agent = {
    pinentryPackage = pkgs.pinentry-qt;
    extraConfig = ''
      pinentry-program ${pkgs.pinentry-qt}/bin/pinentry-qt
    '';
  };
}
