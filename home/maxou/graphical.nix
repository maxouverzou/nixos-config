{pkgs, ...}: { 
  imports = [
    ../3d-printing.nix
    # ../emacs-graphical.nix # hangs on: inhinting kill emacs
  ];

  home.packages = with pkgs; [
    cider
    mpv
    vlc
    yt-dlp
    
    # qgis-ltr # @FIXME broken
  ];
}
