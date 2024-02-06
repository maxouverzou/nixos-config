{ pkgs, ... }: {
  home.packages = with pkgs; [
    gpx-reduce
    # qgis-ltr # pdal build failure (xml error)
    tile-stitch
  ];
}
