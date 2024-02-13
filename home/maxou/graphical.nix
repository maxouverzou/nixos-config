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
  ];
}
