{ config
, inputs
, ...
}: {
  config = {
    nixpkgs.overlays = [
      inputs.nurpkgs.overlay
      (import ../overlays/packages.nix)
    ];
  };

}
