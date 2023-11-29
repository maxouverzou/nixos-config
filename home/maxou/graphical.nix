{pkgs, ...}: { 
  home.packages = with pkgs; [
    cider
    mpv
    vlc
    yt-dlp
    
    qgis-ltr
  ];
}
