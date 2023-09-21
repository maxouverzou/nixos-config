self: super:
{
  python3 = super.python3.override {
    packageOverrides = pself: psuper: {
      pyicloud = psuper.pyicloud.overrideAttrs (attrs: {
        src = super.fetchFromGitHub {
          owner = "maxouverzou";
          repo = "pyicloud";
          rev = "33952a924682f237a05409beb99dc29a7ff1d885";
          hash = "sha256-bLSYRzeR1ka+xFV29Mp97PwD3086XDODlXdcbPHKkEo=";
        };
      });
    };
  };

  # https://github.com/NixOS/nixpkgs/issues/230212#issuecomment-1544083194
  logseq = super.logseq.overrideAttrs (oldAttrs: {
    postFixup = ''
      makeWrapper ${super.electron_20}/bin/electron $out/bin/${oldAttrs.pname} \
        --set "LOCAL_GIT_DIRECTORY" ${super.git} \
        --add-flags $out/share/${oldAttrs.pname}/resources/app \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}" \
        --prefix LD_LIBRARY_PATH : "${super.lib.makeLibraryPath [ super.stdenv.cc.cc.lib ]}"
    '';
  });

  gpx-reduce = super.callPackage ../packages/gpx-reduce.nix { };
  tile-stitch = super.callPackage ../packages/tile-stitch.nix { };
  icloud-drive-fuse = super.callPackage ../packages/icloud-drive-fuse.nix { };
  hyprshot = super.callPackage ../packages/hyprshot.nix { };
  rofi-network-manager = super.callPackage ../packages/rofi-network-manager.nix { };
}
