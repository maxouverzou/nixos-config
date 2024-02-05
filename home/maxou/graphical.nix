{pkgs, ...}: { 
  imports = [
    ../3d-printing.nix
    ../emacs-graphical.nix
    # ../gis.nix # pdal build failure (xml error)
  ];

  home.packages = with pkgs; [
    cider
    mpv
    vlc
    yt-dlp
  ];
}
