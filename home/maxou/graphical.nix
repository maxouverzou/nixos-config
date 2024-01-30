{pkgs, ...}: { 
  imports = [
    ../3d-printing.nix
    ../emacs-graphical.nix
  ];

  home.packages = with pkgs; [
    cider
    mpv
    vlc
    yt-dlp
    
    # qgis-ltr # @FIXME broken
  ];
}
