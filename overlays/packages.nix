self: super:
{
  python3 = super.python3.override {
    packageOverrides = pself: psuper: {
      pyicloud = psuper.pyicloud.overrideAttrs (attrs: {
        src = super.fetchFromGitHub {
          owner = "maxouverzou";
          repo = "pyicloud";
          rev = "11b7fe938a6d1ab8c62c61d28b8088cd12ef9522";
          hash = "sha256-13+vcBnS5Zi5LQpSu2liMjjWFhbXlHA+QCZ4AgHBJ5Q=";
        };
        doCheck = false;
        nativeCheckInputs = [];
      });
    };
  };

  gpx-reduce = super.callPackage ../packages/gpx-reduce.nix { };
  tile-stitch = super.callPackage ../packages/tile-stitch.nix { };
  icloud-drive-fuse = super.callPackage ../packages/icloud-drive-fuse.nix { };

}