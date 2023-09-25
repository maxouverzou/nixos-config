self: super:
let
  pythonOverrides = {
    packageOverrides = import ../custom/python-packages.nix super;
  };
in
{
  python3 = super.python3.override pythonOverrides;
  python310 = super.python310.override pythonOverrides;
  python311 = super.python311.override pythonOverrides;
  
  gpx-reduce = super.callPackage ../custom/gpx-reduce.nix { };
  tile-stitch = super.callPackage ../custom/tile-stitch.nix { };
  icloud-drive-fuse = super.callPackage ../custom/icloud-drive-fuse.nix { };
  hyprshot = super.callPackage ../custom/hyprshot.nix { };
  git-diff-image = super.callPackage ../custom/git-diff-image.nix { };
}
