{ pkgs, ... }: {
  home.packages = with pkgs; [
    gpx-reduce
    qgis-ltr
    tile-stitch
  ];
}
