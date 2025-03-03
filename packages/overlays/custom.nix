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

  clickup = super.callPackage ../custom/clickup.nix { };
  dracula-konsole = super.callPackage ../custom/dracula-konsole.nix { };
  fuckport = super.callPackage ../custom/fuckport.nix { };
  git-diff-image = super.callPackage ../custom/git-diff-image.nix { };
  glim = super.callPackage ../custom/glim.nix { };
  gpx-reduce = super.callPackage ../custom/gpx-reduce.nix { };
  headsetcontrol-udev = super.callPackage ../custom/headsetcontrol-udev.nix { };
  hyprshot = super.callPackage ../custom/hyprshot.nix { };
  icloud-drive-fuse = super.callPackage ../custom/icloud-drive-fuse.nix { };
  jnv = super.callPackage ../custom/jnv.nix { };
  nix4vscode = super.callPackage ../custom/nix4vscode.nix { };
  redis-cli = super.callPackage ../custom/redis-cli.nix { };
  rsync-backup-to-nas = super.callPackage ../custom/rsync-backup-to-nas.nix { };
  tails = super.callPackage ../custom/tails.nix { };
  tile-stitch = super.callPackage ../custom/tile-stitch.nix { };
  unbound-blocklist-stevenblack = super.callPackage ../custom/unbound-blocklist-stevenblack.nix { };
  walk = super.callPackage ../custom/walk.nix { };
  litellm-config = super.callPackage ../custom/litellm-config.nix { };

  tex-mine = super.callPackage ../custom/tex-mine.nix { };
}
