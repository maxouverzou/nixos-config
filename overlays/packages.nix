self: super:
{
  gpx-reduce = super.callPackage ../packages/gpx-reduce.nix { };
  tile-stitch = super.callPackage ../packages/tile-stitch.nix { };
}