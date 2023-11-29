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

  fuckport = super.callPackage ../custom/fuckport.nix { };
  git-diff-image = super.callPackage ../custom/git-diff-image.nix { };
  gpx-reduce = super.callPackage ../custom/gpx-reduce.nix { };
  hyprshot = super.callPackage ../custom/hyprshot.nix { };
  icloud-drive-fuse = super.callPackage ../custom/icloud-drive-fuse.nix { };
  redis-cli = super.callPackage ../custom/redis-cli.nix { };
  tile-stitch = super.callPackage ../custom/tile-stitch.nix { };
  unbound-blocklist-stevenblack = super.callPackage ../custom/unbound-blocklist-stevenblack.nix { };

  tex-mine = super.callPackage ../custom/tex-mine.nix { };
}
